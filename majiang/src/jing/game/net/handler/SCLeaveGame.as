package jing.game.net.handler
{
import game.view.scene.gamescene.GameScene;

import protocol.gameserver.sc_leave_game;

/**
 * ºͷþÎñÆ÷¶ϿªÁ¬½Ó
 * 
 * @author Jing
 */
public class SCLeaveGame
{

	public function SCLeaveGame(pb:sc_leave_game)
	{
		
		if(pb.why == "player_money_not_enough")
		{
			playerMoneyNotEnough();
		}
		else if(pb.why == "ready_timeout")
		{
			readyTimeout();
		}
	}

	private function playerMoneyNotEnough():void{
		GameScene.cur.switchToHall();
	}

	private function readyTimeout():void{
		GameScene.cur.model.kickedFromRoom();
	}

}
}