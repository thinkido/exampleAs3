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

	public function onNetworkEvent(name:String, content:ByteString):Boolean{
		try
		{
			if(name == "sc_hall_debug")
			{
				var pb:sc_hall_debug= sc_hall_debug.parseFrom(content.toByteArray());
				trace(pb.toString());
			}
			else if(name == "sc_game_debug")
			{
				var pb:sc_game_debug= sc_game_debug.parseFrom(content.toByteArray());
				trace(pb.getInfo());
			}
			else if(name == "sc_enter_game")
			{
				new SCEnterGame(sc_enter_game.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_enter_game_notify")
			{
				new SCEnterGameNotify(sc_enter_game_notify.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_ready_game")
			{
				new SCResadyGame();
			}
			else if(name == "sc_ready_game_notify")
			{
				new SCReadyGameNotify(sc_ready_game_notify.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_start_game")
			{
				new SCStartGame(sc_start_game.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_sure_lack")
			{
				new SCSureLack(sc_sure_lack.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_lack_infos")
			{
				new SCLackInfos(sc_lack_infos.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_game_action")
			{
				new SCGameAction(sc_game_action.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_game_action_notify")
			{
				new SCGameActionNotify(sc_game_action_notify.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_game_action_failed")
			{
				new SCGameActionFailed(sc_game_action_failed.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_game_hide_actions")
			{
				new SCGameHideActions(sc_game_hide_actions.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_game_turn")
			{
				new SCGameTurn(sc_game_turn.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_game_turn_notify")
			{
				new SCGameTurnNotify(sc_game_turn_notify.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_leave_game")
			{
				new SCLeaveGame(sc_leave_game.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_leave_game_notify")
			{
				new SCLeaveGameNotify(sc_leave_game_notify.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_leave_game_failed")
			{

			}
			else if(name == "sc_game_single_result")
			{

			}
			else if(name == "sc_continue_game")
			{
				new SCContinueGame(sc_continue_game.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_game_show_actions")
			{
				new SCShowActions(sc_game_show_actions.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_end_game")
			{
				new SCEndGame(sc_end_game.parseFrom(content.toByteArray()));
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
				new SCGoldReset(sc_gold_reset.parseFrom(content.toByteArray()));
			}
			else if(name == "sc_enter_hall")
			{
				new SCEnterHall(sc_enter_hall.parseFrom(content.toByteArray()));
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