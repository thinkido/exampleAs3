
package jing.game.net.handler;

import game.view.scene.gamescene.GameScene;
import protocol.sc_ready_game_notify;

public class SCReadyGameNotify
{

	public SCReadyGameNotify(sc_ready_game_notify pb)
	{
		String dir = GameScene.cur.getDirBySeat(pb.getSeat_index());
		GameScene.cur.info.setReady(dir, true);
		GameScene.cur.info.setHu(dir, false);
	}

}
