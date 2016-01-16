
package jing.game.net.handler;

import game.view.scene.gamescene.GameScene;
import jing.game.view.Player;
import protocol.sc_leave_game_notify;

public class SCLeaveGameNotify
{

	public SCLeaveGameNotify(sc_leave_game_notify pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getSeat_index());
		GameScene.cur.info.setHu(player.dir(), false);
		GameScene.cur.info.setReady(player.dir(), false);
		GameScene.cur.info.setName(player.dir(), "µÈ´ý¼ÓÈë");
	}

}
