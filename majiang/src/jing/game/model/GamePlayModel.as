package jing.game.model
{
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import game.model.Global;
	import game.model.vo.EnterGameVO;
	import game.util.CommonUtil;
	
	import jing.game.net.GamePlaySL;
	import jing.game.net.GameRequest;
	
	public class GamePlayModel
	{
	
		/**
		 * 当前活跃的Model
		 */
		static public var current:GamePlayModel= null;
	
		private var _sl:GamePlaySL;
	
		private var _enterGameVO:EnterGameVO;
	
		private var _roomId:int;
	
		public function roomId():int{
			return _roomId;
		}
	
		private var _roomBase:int= 1000;
	
		public function roomBase():int{
			return _roomBase;
		}
	
		private var _roomLevel:String;
	
		public function roomLevel():String{
			return _roomLevel;
		}
	
		private var _leaveRoomTimerId:int= -1;
	
		private var _isKicked:Boolean= false;
	
		public function isKicked():Boolean{
			return _isKicked;
		}
	
		public function GamePlayModel(vo:EnterGameVO)
		{
			_enterGameVO = vo;
			GamePlayModel.current = this;
		}
	
		public function init():void{
			// 连接服务器
			Global.socketGame.connect();
			_sl = new GamePlaySL();
			_sl.init();
			GameRequest.ins().enterGame();
		}
	
		public function dispose():void{
			reset();
			_sl.dispose();
			if(Global.socketGame != null && Global.socketGame.connected)
			{
				trace("主动断开和游戏服的连接");
				Global.socketGame.close();
			}
		}
	
		public function reset():void{
			_isKicked = false;
			releaseOutRoomTimer();
		}
	
		public function updateRoomInfo(roomId:int, roomBase:int, roomLevel:String):void{
			_roomId = roomId;
			_roomBase = roomBase;
			_roomLevel = roomLevel;
		}
	
		public function startLeaveRoomTimer():void{
			_leaveRoomTimerId = setTimeout(kickedFromRoom, 20000 );
		}
	
		public function releaseOutRoomTimer():void{
			if(-1!= _leaveRoomTimerId)
			{
				clearTimeout(_leaveRoomTimerId);
				_leaveRoomTimerId = -1;
			}
		}
	
		public function kickedFromRoom():void{
			Global.socketGame.close();
			_isKicked = true;
			CommonUtil.showPopupWindow(false, "您已离开房间！", null);
		}
	}
}