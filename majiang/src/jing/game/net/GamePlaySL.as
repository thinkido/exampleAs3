package jing.game.net
{
	import com.thinkido.framework.common.observer.Notification;
	
	import flash.utils.ByteArray;
	
	import game.control.AccountManager;
	
	import jing.game.net.handler.CSGameAuto;
	import jing.game.net.handler.CSGameManual;
	import jing.game.net.handler.SCContinueGame;
	import jing.game.net.handler.SCEndGame;
	import jing.game.net.handler.SCEnterGame;
	import jing.game.net.handler.SCEnterGameNotify;
	import jing.game.net.handler.SCEnterHall;
	import jing.game.net.handler.SCGameAction;
	import jing.game.net.handler.SCGameActionFailed;
	import jing.game.net.handler.SCGameActionNotify;
	import jing.game.net.handler.SCGameHideActions;
	import jing.game.net.handler.SCGameTurn;
	import jing.game.net.handler.SCGameTurnNotify;
	import jing.game.net.handler.SCGoldReset;
	import jing.game.net.handler.SCLackInfos;
	import jing.game.net.handler.SCLeaveGame;
	import jing.game.net.handler.SCLeaveGameNotify;
	import jing.game.net.handler.SCReadyGameNotify;
	import jing.game.net.handler.SCResadyGame;
	import jing.game.net.handler.SCShowActions;
	import jing.game.net.handler.SCStartGame;
	import jing.game.net.handler.SCSureLack;
	
	import network.YiuNetworkListener;
	
	import protocol.gameserver.sc_continue_game;
	import protocol.gameserver.sc_end_game;
	import protocol.gameserver.sc_enter_game;
	import protocol.gameserver.sc_enter_game_notify;
	import protocol.gameserver.sc_game_action;
	import protocol.gameserver.sc_game_action_failed;
	import protocol.gameserver.sc_game_action_notify;
	import protocol.gameserver.sc_game_debug;
	import protocol.gameserver.sc_game_hide_actions;
	import protocol.gameserver.sc_game_show_actions;
	import protocol.gameserver.sc_game_turn;
	import protocol.gameserver.sc_game_turn_notify;
	import protocol.gameserver.sc_gold_reset;
	import protocol.gameserver.sc_lack_infos;
	import protocol.gameserver.sc_leave_game;
	import protocol.gameserver.sc_leave_game_notify;
	import protocol.gameserver.sc_ready_game_notify;
	import protocol.gameserver.sc_start_game;
	import protocol.gameserver.sc_sure_lack;
	import protocol.hallserver.sc_enter_hall;
	import protocol.hallserver.sc_hall_debug;
	
	/**
	 * 游戏进行的接口监听
	 * 
	 * @author Jing
	 */
	public class GamePlaySL
	{
		private var proList:Array = ["sc_hall_debug",
			"sc_game_debug",
			"sc_enter_game",
			"sc_enter_game_notify",
			"sc_ready_game",
			"sc_ready_game_notify",
			"sc_start_game",
			"sc_sure_lack",
			"sc_lack_infos",
			"sc_game_action",
			"sc_game_action_notify",
			"sc_game_action_failed",
			"sc_game_hide_actions",
			"sc_game_turn",
			"sc_game_turn_notify",
			"sc_leave_game",
			"sc_leave_game_notify",
			"sc_leave_game_failed",
			"sc_game_single_result",
			"sc_continue_game",
			"sc_game_show_actions",
			"sc_end_game",
			"cs_game_auto",
			"cs_game_manual",
			"sc_gold_reset",
			"sc_enter_hall"] ;
		
		public function GamePlaySL()
		{
	
		}
	
		public function init():void{
	//		YiuNetworkHandlerMgr.subscribe(this);
			AccountManager.getInstance().registerMsgs(proList ,onNetworkEvent,"GamePlaySL");
		}
	
		public function dispose():void{
	//		YiuNetworkHandlerMgr.unSubscribe(this);
			AccountManager.getInstance().removeMsgs(proList ,"GamePlaySL");		
		}
	
		public function onNetworkEvent(e:Notification):void
		{
			var name:String = e.name ;
			var content:ByteArray = e.body as ByteArray ;
			
			if(name == "sc_hall_debug")
			{
				var pb:sc_hall_debug= new sc_hall_debug() ;
					pb.mergeFrom(content) ;
				trace(pb.toString());
			}
			else if(name == "sc_game_debug")
			{
				var gameDebug:sc_game_debug= new sc_game_debug() ;
				gameDebug.mergeFrom(content) ;
				trace(gameDebug.getInfo());
			}
			else if(name == "sc_enter_game")
			{
				var sng:sc_enter_game = new sc_enter_game() ;
				sng.mergeFrom(content) ;
				new SCEnterGame( sng );
			}
			else if(name == "sc_enter_game_notify")
			{
				var sngn:sc_enter_game_notify = new sc_enter_game_notify() ;
				sngn.mergeFrom(content) ;
				new SCEnterGameNotify( sngn );
			}
			else if(name == "sc_ready_game")
			{
				new SCResadyGame();
			}
			else if(name == "sc_ready_game_notify")
			{
				var srgn:sc_ready_game_notify = new sc_ready_game_notify() ; 
				srgn.mergeFrom(content)
				new SCReadyGameNotify(srgn);
			}
			else if(name == "sc_start_game")
			{
				var ssg:sc_start_game = new sc_start_game() ;
				ssg.mergeFrom(content) ;
				new SCStartGame( ssg );
			}
			else if(name == "sc_sure_lack")
			{
				var ssl:sc_sure_lack = new sc_sure_lack() ;
				ssl.mergeFrom(content) ;
				new SCSureLack( ssl ) ;
			}
			else if(name == "sc_lack_infos")
			{
				var sli:sc_lack_infos = new sc_lack_infos() ;
				sli.mergeFrom(content) ;
				new SCLackInfos( sli );
			}
			else if(name == "sc_game_action")
			{
				var sga:sc_game_action = new sc_game_action() ;
				sga.mergeFrom(content) ;
				new SCGameAction( sga );
			}
			else if(name == "sc_game_action_notify")
			{
				var sgan:sc_game_action_notify = new sc_game_action_notify() ;
				sgan.mergeFrom(content)
				new SCGameActionNotify( sgan);
			}
			else if(name == "sc_game_action_failed")
			{
				var sgaf:sc_game_action_failed =  new sc_game_action_failed() ;
				sgaf.mergeFrom(content) ;
				new SCGameActionFailed( sgaf );
			}
			else if(name == "sc_game_hide_actions")
			{
				var sgha = new sc_game_hide_actions() ;
				sgha.mergeFrom(content) ; 
				new SCGameHideActions(sgha );
			}
			else if(name == "sc_game_turn")
			{
				var sgt:sc_game_turn = new sc_game_turn() ;
				sgt.mergeFrom(content) ;
				new SCGameTurn( sgt );
			}
			else if(name == "sc_game_turn_notify")
			{
				var sgtn:sc_game_turn_notify = new sc_game_turn_notify() ;
				sgtn.mergeFrom(content) ;
				new SCGameTurnNotify( sgtn );
			}
			else if(name == "sc_leave_game")
			{
				var slg:sc_leave_game = new sc_leave_game() ;
				slg.mergeFrom(content) ;
				new SCLeaveGame( slg ) ;
			}
			else if(name == "sc_leave_game_notify")
			{
				var slgn:sc_leave_game_notify = new sc_leave_game_notify() ;
				slgn.mergeFrom(content) ;
				new SCLeaveGameNotify( slgn );
			}
			else if(name == "sc_leave_game_failed")
			{

			}
			else if(name == "sc_game_single_result")
			{

			}
			else if(name == "sc_continue_game")
			{
				var scg:sc_continue_game = new sc_continue_game() ;
				scg.mergeFrom(content) ;
				new SCContinueGame( scg );
			}
			else if(name == "sc_game_show_actions")
			{
				var sgsa:sc_game_show_actions = new sc_game_show_actions() ;
				sgsa.mergeFrom(content) ;
				new SCShowActions( sgsa );
			}
			else if(name == "sc_end_game")
			{
				var seg:sc_end_game = new sc_end_game() ;
				seg.mergeFrom(content) ;
				new SCEndGame( seg );
			}
			else if(name == "cs_game_auto")
			{
				new CSGameAuto();
			}
			else if(name == "cs_game_manual")
			{
				new CSGameManual();
			}
			else if(name == "sc_gold_reset")
			{
				var sgr:sc_gold_reset = new sc_gold_reset() ;
				sgr.mergeFrom(content) ;
				new SCGoldReset( sgr );
			}
			else if(name == "sc_enter_hall")
			{
				var seh:sc_enter_hall = new sc_enter_hall() ;
				seh.mergeFrom(content) ;
				new SCEnterHall( seh );
			}
			
		}
	
	}
}