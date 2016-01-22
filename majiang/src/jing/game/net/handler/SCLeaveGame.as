package jing.game.net.handler
{
import game.model.Global;
import game.view.scene.gamescene.GameScene;
import protocol.sc_leave_game;

/**
 * 和服务器断开连接
 * 
 * @author Jing
 */
public class SCLeaveGame
{

	public function SCLeaveGame(pb:sc_leave_game)
	{
		
		if(pb.getWhy().equals("player_money_not_enough"))
		{
			playerMoneyNotEnough();
		}
		else if(pb.getWhy().equals("ready_timeout"))
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