package jing.game.net.handler
{
import game.view.scene.gamescene.GameScene;

import protocol.gameserver.sc_ready_game_notify;

public class SCReadyGameNotify
{

	public function SCReadyGameNotify(pb:sc_ready_game_notify)
	{
		var dir:String= GameScene.cur.getDirBySeat(pb.seatIndex);
		GameScene.cur.info.setReady(dir, true);
		GameScene.cur.info.setHu(dir, false);
	}

}
}