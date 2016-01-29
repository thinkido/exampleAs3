package jing.game.net
{
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
import net.jarlehansen.protobuf.javame.ByteString;
import network.YiuNetworkHandlerMgr;
import network.YiuNetworkListener;
import protocol.sc_continue_game;
import protocol.sc_end_game;
import protocol.sc_enter_game;
import protocol.sc_enter_game_notify;
import protocol.sc_enter_hall;
import protocol.sc_game_action;
import protocol.sc_game_action_failed;
import protocol.sc_game_action_notify;
import protocol.sc_game_debug;
import protocol.sc_game_hide_actions;
import protocol.sc_game_show_actions;
import protocol.sc_game_turn;
import protocol.sc_game_turn_notify;
import protocol.sc_gold_reset;
import protocol.sc_hall_debug;
import protocol.sc_lack_infos;
import protocol.sc_leave_game;
import protocol.sc_leave_game_notify;
import protocol.sc_ready_game_notify;
import protocol.sc_start_game;
import protocol.sc_sure_lack;

/**
 * ÓÎϷ½øÐеĽӿڼàÌý
 * 
 * @author Jing
 */
public class GamePlaySL implements YiuNetworkListener
{

	public function GamePlaySL()
	{

	}

	public function init():void{
		YiuNetworkHandlerMgr.subscribe(this);
	}

	public function dispose():void{
		YiuNetworkHandlerMgr.unSubscribe(this);
	}

	public function onNetworkEvent(name:String, content:ByteArray):Boolean{
		try
		{
			if(name == "sc_hall_debug")
			{
				var pb:sc_hall_debug= new sc_hall_debug() ;
					pb.mergeFrom(content) ;
				trace(pb.toString());
			}
			else if(name == "sc_game_debug")
			{
				var pb:sc_game_debug= new sc_game_debug() ;
					pb.mergeFrom(content) ;
				trace(pb.getInfo());
			}
			else if(name == "sc_enter_game")
			{
				new SCEnterGame(new sc_enter_game().mergeFrom(content));
			}
			else if(name == "sc_enter_game_notify")
			{
				new SCEnterGameNotify(new sc_enter_game_notify().mergeFrom(content));
			}
			else if(name == "sc_ready_game")
			{
				new SCResadyGame();
			}
			else if(name == "sc_ready_game_notify")
			{
				new SCReadyGameNotify(new sc_ready_game_notify().mergeFrom(content));
			}
			else if(name == "sc_start_game")
			{
				new SCStartGame(new sc_start_game().mergeFrom(content));
			}
			else if(name == "sc_sure_lack")
			{
				new SCSureLack(new sc_sure_lack().mergeFrom(content));
			}
			else if(name == "sc_lack_infos")
			{
				new SCLackInfos(new sc_lack_infos().mergeFrom(content));
			}
			else if(name == "sc_game_action")
			{
				new SCGameAction(new sc_game_action().mergeFrom(content));
			}
			else if(name == "sc_game_action_notify")
			{
				new SCGameActionNotify(new sc_game_action_notify().mergeFrom(content));
			}
			else if(name == "sc_game_action_failed")
			{
				new SCGameActionFailed(new sc_game_action_failed().mergeFrom(content));
			}
			else if(name == "sc_game_hide_actions")
			{
				new SCGameHideActions(new sc_game_hide_actions().mergeFrom(content));
			}
			else if(name == "sc_game_turn")
			{
				new SCGameTurn(new sc_game_turn().mergeFrom(content));
			}
			else if(name == "sc_game_turn_notify")
			{
				new SCGameTurnNotify(new sc_game_turn_notify().mergeFrom(content));
			}
			else if(name == "sc_leave_game")
			{
				new SCLeaveGame(new sc_leave_game().mergeFrom(content));
			}
			else if(name == "sc_leave_game_notify")
			{
				new SCLeaveGameNotify(new sc_leave_game_notify().mergeFrom(content));
			}
			else if(name == "sc_leave_game_failed")
			{

			}
			else if(name == "sc_game_single_result")
			{

			}
			else if(name == "sc_continue_game")
			{
				new SCContinueGame(new sc_continue_game().mergeFrom(content));
			}
			else if(name == "sc_game_show_actions")
			{
				new SCShowActions(new sc_game_show_actions().mergeFrom(content));
			}
			else if(name == "sc_end_game")
			{
				new SCEndGame(new sc_end_game().mergeFrom(content));
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
				new SCGoldReset(new sc_gold_reset().mergeFrom(content));
			}
			else if(name == "sc_enter_hall")
			{
				new SCEnterHall(new sc_enter_hall().mergeFrom(content));
			}
		}
		catch(var ex:Exception)
		{
			ex.printStackTrace();
		}

		return true;
	}

}
}