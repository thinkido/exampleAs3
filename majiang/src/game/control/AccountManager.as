package game.control
{
	import flash.utils.ByteArray;
	
	import framework.time.ITickListener;
	import framework.time.TickItem;
	import framework.views.Stage;
	
	import game.constant.SceneType;
	import game.model.Global;
	import game.model.vo.EnterGameVO;
	import game.model.vo.GiftVO;
	import game.model.vo.IpAddressVO;
	import game.model.vo.UserDataVO;
	
	import java.io.IOException;
	
	import net.jarlehansen.protobuf.javame.ByteString;
	
	import network.ProtocolList;
	import network.YiuNetworkHandlerMgr;
	import network.YiuNetworkListener;
	import network.YiuNetworkSocket;
	import network.YiuNetworkStatusListener;
	
	import org.json.me.JSONArray;
	import org.json.me.JSONException;
	import org.json.me.JSONObject;
	
	import protocol.heartbeat;
	import protocol.sc_enter_hall;
	import protocol.sc_force_continue_game;
	
	public class AccountManager implements YiuNetworkListener
	{
		
		private static var SOCKET_INTERVAL:int = 200;
		
		private static var HEARTBEAT_INTERVAL:int = 10000;
		
		private static var _instance:AccountManager = null;
		
		private var _id:String;
		
		public function id():String
		{
			return _id;
		}
		
		private var _type:String = "tv";
		
		public function type():String
		{
			return _type;
		}
		
		private var _name:String;
		
		private var _statusListener:YiuNetworkStatusListener;
		
		private var _heartbeatBytes:ByteArray;
		
		public static function getInstance():AccountManager
		{
			if(_instance == null)
				_instance = new AccountManager();
			return _instance;
		}
		
		public function AccountManager():void
		{
			_statusListener = new YiuNetworkStatusListener()
			{
				
				protected function doLost(socket:YiuNetworkSocket):void
				{
					trace("�����������ж�", "LogManager.LEVEL_ERROR");
					socket.close();
					return;
				}
				
				// status = [connect-failed,send-failed,receive-failed,connected]
				public function onNetworkStatusNotify(socket:YiuNetworkSocket, status:String):void
				{
					trace(status);
					if(status == "connect-failed" || status == "send-failed")
					{
						doLost(socket);
					}
				}
			};
			try
			{
				_heartbeatBytes = heartbeat.newBuilder().setNoop(0).build().toByteArray();
			}
			catch(e:Error)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
			Stage.current.ticker.setTimeInterval(HEARTBEAT_INTERVAL, new ITickListener()
				{
					
					public void onTick(TickItem tickItem)
					{
						if(Global.socketHall != null && Global.socketHall.isConnected())
							Global.socketHall.sendProtobuf("heartbeat", _heartbeatBytes);
						if(Global.socketGame != null && Global.socketGame.isConnected())
							Global.socketGame.sendProtobuf("heartbeat", _heartbeatBytes);
					}
				}, null);
			
			_id = Global.account;
			_name = Global.adAccount;
			ProtocolList.init();
		}
		
		public function getId():String
		{
			return _id;
		}
		
		public function getType():String
		{
			return _type;
		}
		
		public function getName():String
		{
			return _name;
		}
		
		public function reset():void
		{
			if(Global.socketHall != null)
			{
				if(Global.socketHall.isConnected())
					Global.socketHall.close();
				Global.socketHall = null;
			}
			if(Global.socketGame != null)
			{
				if(Global.socketGame.isConnected())
					Global.socketGame.close();
				Global.socketGame = null;
			}
			Global.giftVO = null;
		}
		
		public void connect()
		{
			// �����׽���
			YiuNetworkSocket socketHall = new YiuNetworkSocket(Global.cfg.hallAddressVO());
			Stage.current.ticker.setTimeInterval(SOCKET_INTERVAL, socketHall, null);
			socketHall.setStatusListener(_statusListener);
			socketHall.connect();
			Global.socketHall = socketHall;
			
			// ��Ϸ�����׽���,��ʱ�����ӣ������뷿�������
			YiuNetworkSocket socketGame = new YiuNetworkSocket();
			Stage.current.ticker.setTimeInterval(SOCKET_INTERVAL, socketGame, null);
			socketGame.setStatusListener(_statusListener);
			Global.socketGame = socketGame;
			String ret = YiuHttpManager.PostOptJson(Global.cfg.gateAddressVO().toHttpAddress() + "/login", "id=" + _id + "&idtype=" + _type + "&name=" + _name + "&version=0.1");
			if(ret == null || ret == "{}")
			{
				trace("��¼ʧ��", "LogManager.LEVEL_ERROR");
			}
			else
			{
				try
				{
					var json:Object = JSON.parse(ret);
					var day:int = json["loginday"];
					var gold:int = json["logingold"];
					var fetched:Boolean = json["logingold_fetched"] ;
					Global.giftVO = new GiftVO(day, gold, fetched);
				}
				catch(JSONException e)
				{
					trace("��¼/��ȡ��¼������Ϣʧ��", "LogManager.LEVEL_ERROR");
				}
				trace("��½�ɹ�");
				YiuNetworkHandlerMgr.subscribe(this);
				reqEnterHall();
			}
		}
		
		public void reqEnterHall()
		{
			Global.socketHall.send(new JSONArray().put("enter_hall").put(_id).put(_type).put(0).toString());
		}
		
		public function onNetworkEvent(name:String, content:ByteString):Boolean
		{
			try
			{
				if(name == "sc_enter_hall")
				{
					YiuNetworkHandlerMgr.unSubscribe(this);
					sc_enter_hall msg = sc_enter_hall.parseFrom(content.toByteArray());
					Global.userDataVO = new UserDataVO(msg);
					PlaceDataManager.getInstance().init(msg.getPlace_infos());
					SceneManager.getInstance().switchScene(SceneType.SCENE_HALL);
					return false;
				}
				else if(name == "sc_force_continue_game")
				{
					YiuNetworkHandlerMgr.unSubscribe(this);
					sc_force_continue_game msg = sc_force_continue_game.parseFrom(content.toByteArray());
					SceneManager.getInstance().switchScene(SceneType.SCENE_GAME, new EnterGameVO(new IpAddressVO(msg.getHost(), msg.getPort()), true));
					return false;
				}
			}
			catch(IOException e)
			{
				trace("����sc_enter_hallЭ��ʧ��", "LogManager.LEVEL_ERROR");
			}
			return true;
		}
	}
}
