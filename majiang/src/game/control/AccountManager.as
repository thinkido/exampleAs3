package game.control
{
	import com.thinkido.framework.common.observer.Notification;
	import com.thinkido.framework.common.observer.Observer;
	import com.thinkido.framework.common.observer.ObserverThread;
	import com.thinkido.framework.common.timer.vo.TimerData;
	import com.thinkido.framework.events.TSocketEvent;
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
	import network.ProtocolNode;
	import network.YiuNetworkHandlerMgr;
	
	import org.osmf.logging.Log;
	
	import protos.common.protocol;
	import protos.common.sc_protocol_pack;
	import protos.gameserver.heartbeat;
	import protos.hallserver.sc_enter_hall;
	import protos.hallserver.sc_force_continue_game;
	
	public class AccountManager
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
		
		private var showLog:Boolean = true ;
				
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
			Global.socketHall.connect();
			Global.socketHall.addEventListener( TSocketEvent.LOGIN_SUCCESS , connHander );
			Global.socketHall.addEventListener( TSocketEvent.LOGIN_FAILURE , connHander );
			Global.socketHall.addEventListener( TSocketEvent.CLOSE , connHander );
			
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
			
			registerMsgs(proList ,onNetworkEvent,"AccountManager");
		}
		public function disposePro():void{
			removeMsgs(proList ,"AccountManager");		
		}
		private var proList:Array = ["sc_enter_hall","sc_force_continue_game"];
		private function connHander( evt:TSocketEvent ):void
		{
			if( evt.type == TSocketEvent.LOGIN_SUCCESS ){
				trace("socket msg:" + TSocketEvent.LOGIN_SUCCESS);
			}else if( evt.type == TSocketEvent.LOGIN_FAILURE ){
				trace("socket msg:" + TSocketEvent.LOGIN_FAILURE);
			}else if( evt.type == TSocketEvent.CLOSE ){
				trace("socket msg:" + TSocketEvent.CLOSE);
			}			
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
			var prot:ByteArray = null;
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
		
		private function receiveMsg(np:ByteArray) : void
		{			
			var noti:Notification ;
			
			var pro:protocol = new protocol();
			var pbObject:protocol = pro.mergeFrom( np );
			var node:ProtocolNode = ProtocolList.getNode(pbObject.id );
			
			if (node == null) return;
			
			if (node.mName == "sc_protocol_pack")
			{
				var pbPack:sc_protocol_pack = new sc_protocol_pack() ;
				pbPack.mergeFrom( pbObject.content ) ;
				var vecProtocol:Array = pbPack.pack ;
				for (var index:int = 0; index < vecProtocol.length; ++index)
				{
					var pbPackedObject:protocol = vecProtocol[index] as protocol; 
					var packedNode:ProtocolNode = ProtocolList.getNode(pbPackedObject.id );					   
					if (showLog)
					{
						trace( "Got Protobuf: " + pbPackedObject.id );
					}
//					YiuNetworkHandlerMgr.processPacket(packedNode.mName, pbPackedObject.getContent());					
					noti = new Notification( node.mName , pbPackedObject.content );
					_msgObserverThread.notifyObservers(noti);
				}
			} 
			else 
			{
				if (showLog) 
				{
					trace( "Got Protobuf: " + pbObject.id );
				}
//				YiuNetworkHandlerMgr.processPacket(node.mName, pbObject.getContent());
				noti = new Notification( node.mName , pbPackedObject.content );
				_msgObserverThread.notifyObservers(noti);
			}
			return;
		}
		
		public function registerMsg(proName:String, $handle:Function, $name) : void
		{
			var _observer:Observer = new Observer($handle, $name);
			_msgObserverThread.registerObserver(proName, _observer);
			return;
		}
		public function removeMsg(proName:String, $name:String) : void
		{
			_msgObserverThread.removeObserver(proName, $name);
			return;
		}
		public function registerMsgs(proNames:Array, $handle:Function, $name) : void
		{
			var item:* = undefined;
			for each (item in proNames)
			{				
				registerMsg(item, $handle, $name);
			}
			return;
		}		
		public function removeMsgs(proNames:Array, $name:String) : void
		{
			var item:* = undefined;
			for each (item in proNames)
			{				
				removeMsg(item, $name);
			}
			return;
		}
		
		public function reqEnterHall():void
		{
			Global.socketHall.send(JSON.stringify(["enter_hall",_id,_type,0]) );
		}
		
		public function onNetworkEvent(e:Notification):void
		{
			var name:String = e.name ;
			var content:ByteArray = e.body as ByteArray ;
			
			if(name == "sc_enter_hall")
			{
				YiuNetworkHandlerMgr.unSubscribe(this);
				var msg:sc_enter_hall = new sc_enter_hall() ;
				msg.mergeFrom(content) ;
				Global.userDataVO = new UserDataVO(msg);
				PlaceDataManager.getInstance().init(msg.placeInfos);
				SceneManager.getInstance().switchScene(SceneType.SCENE_HALL);
				return false;
			}
			else if(name == "sc_force_continue_game")
			{
				YiuNetworkHandlerMgr.unSubscribe(this);
				var msg1:sc_force_continue_game = new sc_force_continue_game() ;
				msg1.mergeFrom(content) ;
				SceneManager.getInstance().switchScene(SceneType.SCENE_GAME, new EnterGameVO(new IpAddressVO(msg1.host, msg1.port), true));
				return false;
			}
			
		}


	}
}
