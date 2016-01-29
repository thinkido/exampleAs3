package game.control
{
	import com.thinkido.framework.common.observer.Notification;
	import com.thinkido.framework.common.observer.ObserverThread;
	import com.thinkido.framework.common.timer.vo.TimerData;
	import com.thinkido.framework.manager.TimerManager;
	import com.thinkido.framework.net.JSocket;
	import com.thinkido.framework.net.NProtocol;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.getTimer;
	
	import framework.views.Stage;
	
	import game.constant.SceneType;
	import game.model.Global;
	import game.model.vo.EnterGameVO;
	import game.model.vo.GiftVO;
	import game.model.vo.IpAddressVO;
	import game.model.vo.UserDataVO;
	
	import network.ProtocolList;
	import network.YiuNetworkHandlerMgr;
	import network.YiuNetworkListener;
	import network.YiuNetworkStatusListener;
	
	import protos.common.heartbeat;
	import protos.gameserver.heartbeat;
	import protos.hallserver.sc_enter_hall;
	import protos.hallserver.sc_force_continue_game;
	
	public class AccountManager implements YiuNetworkListener
	{
		
		private static var SOCKET_INTERVAL:int = 200;
		
		private static var HEARTBEAT_INTERVAL:int = 10000;
		
		private static var _instance:AccountManager = null;
		
		private var _id:String;
		
		//as3 jiang 添加
		private   const importantMessageList:Array = [10052, 10020, 30000];
		private   var sleepModeRenderTime:int = 100;
		private   var inSleepMode:Boolean = false;
		private   var lastRunTime:int = 0;
		private   var _heartTime:TimerData = TimerManager.createTimer(HEARTBEAT_INTERVAL, 0, heartHandle, null, null, null, false);
		private  var _msgObserverThread:ObserverThread = new ObserverThread();
		private  var stage:Stage;
				
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
		
		private  var _heartbeatBytes:ByteArray;
		
		public static function getInstance():AccountManager
		{
			if(_instance == null)
				_instance = new AccountManager();
			return _instance;
		}
		public function init(sta:Stage):void
		{
			stage = sta;
			stage.addEventListener(Event.ENTER_FRAME, runReceiveMsgs);
		}
		
		public function AccountManager():void
		{
			_statusListener = new YiuNetworkStatusListener_A();
			
			// 大厅套接字
			var socketHall:JSocket = new JSocket();
			Global.socketHall = socketHall;
			
			// 游戏房间套接字,暂时不连接，当进入房间才连接
			var socketGame:JSocket = new JSocket();
			Global.socketGame = socketGame;
			
			try
			{
				var hb:protos.gameserver.heartbeat = new heartbeat();
				hb.noop = 0 ;
				_heartbeatBytes = new ByteArray();
				_heartbeatBytes.endian = Endian.LITTLE_ENDIAN ;
				hb.writeTo( _heartbeatBytes );
//				_heartbeatBytes = heartbeat.newBuilder().setNoop(0).build().toByteArray() ;
			}
			catch(e:*)
			{
				trace( e.getStackTrace() );  
			}		
			_id = Global.account;
			_name = Global.adAccount;
			ProtocolList.init();
		}		
//			心跳包  待写
		private  function heartHandle() : void
		{
			if (Global.socketHall != null && Global.socketHall.connected)
			{
				Global.socketHall.send("heartbeat", _heartbeatBytes);
			}
			if (Global.socketHall != null && Global.socketHall.connected)
			{				
				Global.socketHall.send("heartbeat", _heartbeatBytes);
			}
			return;
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
				if(Global.socketHall.connected )
					Global.socketHall.close();
				Global.socketHall = null;
			}
			if(Global.socketGame != null)
			{
				if(Global.socketGame.connected )
					Global.socketGame.close();
				Global.socketGame = null;
			}
			Global.giftVO = null;
		}
		
		public function connect():void
		{
			Global.socketHall.setStatusListener(_statusListener);
			Global.socketHall.connect();
			
			Global.socketGame.setStatusListener(_statusListener);
//			var ret:String = YiuHttpManager.PostOptJson(Global.cfg.gateAddressVO().toHttpAddress() + "/login", "id=" + _id + "&idtype=" + _type + "&name=" + _name + "&version=0.1");
			var url:String = Global.cfg.gateAddressVO().toHttpAddress() + "/login";
			var ul:URLLoader = new URLLoader();
			ul.dataFormat = URLLoaderDataFormat.BINARY;
			ul.addEventListener(Event.COMPLETE, loginHander);
			var ur:URLRequest = new URLRequest(url);
			ur.method = URLRequestMethod.POST;
			var uv:URLVariables = new URLVariables();
			uv.id = _id;
			uv.idtype = _type;
			uv.name = _name;
			uv.version=0.1;
			ur.data = uv; 
			ul.load(ur);
		}
		private function loginHander(e:Event):void
		{
			var ul:URLLoader = e.currentTarget as URLLoader;
			var ba:ByteArray = ul.data;
			var content:String = ba.readMultiByte(ba.bytesAvailable, "UTF-8");
			var json:Object = JSON.parse(content);			
			var day:int = json["loginday"];
			var gold:int = json["logingold"];
			var fetched:Boolean = json["logingold_fetched"] ;
			Global.giftVO = new GiftVO(day, gold, fetched);
			trace("登陆成功");
			YiuNetworkHandlerMgr.subscribe(this);
			reqEnterHall();
		}
			
		private function runReceiveMsgs(event:Event) : void
		{
			var prot:NProtocol = null;
			var now:int = getTimer();
			inSleepMode = now - lastRunTime > sleepModeRenderTime;
			lastRunTime = now; 
			if (inSleepMode)
			{
				while (Global.socketHall.serverMsgArr.length > 0)
				{
					prot = Global.socketHall.serverMsgArr.shift();
					receiveMsg(prot);
				}
				while (Global.socketGame.serverMsgArr.length > 0)
				{
					prot = Global.socketGame.serverMsgArr.shift();
					receiveMsg(prot);
				}
			}
			else
			{
				while (Global.socketHall.serverMsgArr.length > 0)
				{
					prot = Global.socketHall.serverMsgArr.shift();
					receiveMsg(prot);
					if (getTimer() - now >= 5)
					{
						break;
					}
				}
				while (Global.socketGame.serverMsgArr.length > 0)
				{
					prot = Global.socketGame.serverMsgArr.shift();
					receiveMsg(prot);
					if (getTimer() - now >= 5)
					{
						break;
					}
				}
			}
			trace("使用时间："+(getTimer() - now));
			return;
		}
		
		private function receiveMsg(protocol:NProtocol) : void
		{
			var _loc_4:* = new Notification( protocol.type.toString() , protocol );
			_msgObserverThread.notifyObservers(_loc_4);
			return;
		}
		
		public function reqEnterHall():void
		{
			Global.socketHall.send(JSON.stringify(["enter_hall",_id,_type,0]) );
		}
		
		public function onNetworkEvent( name:String, content:ByteArray ):Boolean
		{
			try
			{
				if(name == "sc_enter_hall")
				{
					YiuNetworkHandlerMgr.unSubscribe(this);
					var msg:sc_enter_hall = new sc_enter_hall() ;
					msg.mergeFrom(content) ;
					Global.userDataVO = new UserDataVO(msg);
					PlaceDataManager.getInstance().init(msg.getPlace_infos());
					SceneManager.getInstance().switchScene(SceneType.SCENE_HALL);
					return false;
				}
				else if(name == "sc_force_continue_game")
				{
					YiuNetworkHandlerMgr.unSubscribe(this);
					var msg1:sc_force_continue_game = new sc_force_continue_game() ;
					msg1.mergeFrom(content) ;
					SceneManager.getInstance().switchScene(SceneType.SCENE_GAME, new EnterGameVO(new IpAddressVO(msg1.getHost(), msg1.getPort()), true));
					return false;
				}
			}
			catch( e:Error)
			{
				trace("解析sc_enter_hall协议失败", "LogManager.LEVEL_ERROR");
			}
			return true;
		}


	}
}
