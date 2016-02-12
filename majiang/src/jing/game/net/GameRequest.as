package jing.game.net
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import game.control.AccountManager;
	import game.control.NetManager;
	import game.model.Global;
	
	import jing.consts.PlayerAction;
	
	import protocol.gameserver.cs_game_action;
	import protocol.gameserver.cs_game_manual;
	import protocol.gameserver.cs_ready_game;
	
	/**
	 * 游戏场景发出的请求
	 * 
	 * @author Jing
	 */
	public class GameRequest
	{
	
		static private var _ins:GameRequest= new GameRequest();
	
		static public function ins():GameRequest{
			return _ins;
		}
	
		public function GameRequest()
		{
	
		}
	
		public function enterGame():void{
			var json:String= JSON.stringify(["enter_game",AccountManager.getInstance().getId(),AccountManager.getInstance().getType(),0,"none",false,1,"nil","nil"]);
			NetManager.sendStr(Global.socketGame,json );	//Global.socketGame.send(json);
		}
	
		public function readyGame():void{
			try
			{
				var msg:cs_ready_game = new cs_ready_game();
				msg.noop = 0 ;
				var msgBy:ByteArray = new ByteArray();
				msgBy.endian = Endian.LITTLE_ENDIAN ;
				msg.writeTo( msgBy );
				NetManager.sendProtobuf(Global.socketGame,"cs_ready_game",msgBy);
			}
			catch(e:*)
			{
				requestError("cs_ready_game", e);
			}
		}
	
		/**
		 * 定缺
		 * 
		 * @param id
		 */
		public function sureLack(code:int):void{
			var msg:cs_game_action = new cs_game_action();
			msg.id = PlayerAction.LACK ;
			msg.tileTypeOrId = code;
			var msgBy:ByteArray = new ByteArray();
			msgBy.endian = Endian.LITTLE_ENDIAN ;
			msg.writeTo( msgBy );
			try
			{
				NetManager.sendProtobuf(Global.socketGame,"cs_game_action", msgBy );
			}
			catch(e:*)
			{
				requestError("cs_game_action", e);
			}
		}
	
		/**
		 * 玩家动作
		 * 
		 * @param action ²Ù×÷ID
		 * @param cardTypeOrId ÅƵÄID»òÀàÐÍ
		 */
		public function gameAction(action:int, cardTypeOrId:int):void{
			var msg:cs_game_action = new cs_game_action();
			msg.id = action ;
			msg.tileTypeOrId = cardTypeOrId ;
			var msgBy:ByteArray = new ByteArray();
			msgBy.endian = Endian.LITTLE_ENDIAN ;
			msg.writeTo( msgBy );
			try
			{
				NetManager.sendProtobuf(Global.socketGame,"cs_game_action", msgBy );
			}
			catch(e:*)
			{
				requestError("cs_game_action", e);
			}
		}
	
		public function enterHall():void{
			var id:String= AccountManager.getInstance().id();
			var type:String= AccountManager.getInstance().type();			
			NetManager.sendStr(Global.socketHall,JSON.stringify(["enter_hall",id,type,0]) ); //Global.socketHall.send(JSON.stringify(["enter_hall",id,type,0]));
		}
	
		/**
		 * 取消托管
		 */
		public function gameManual():void{
			var msg:cs_game_manual = new cs_game_manual();
			msg.noop = 0 ;
			var msgBy:ByteArray = new ByteArray();
			msgBy.endian = Endian.LITTLE_ENDIAN ;
			msg.writeTo( msgBy );
			try
			{
				NetManager.sendProtobuf(Global.socketGame,"cs_game_manual", msgBy );
			}
			catch(e:*)
			{
				requestError("cs_game_manual", e);
			}
		}
	
		private function requestError(content:String, e:*):void{
			trace("协议发送出错：" + content, "LogManager.LEVEL_ERROR");
			trace( e.getStackTrace() );   //e.printStackTrace();
		}
	
	}
}