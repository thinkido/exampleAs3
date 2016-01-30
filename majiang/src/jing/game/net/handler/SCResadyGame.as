package jing.game.net.handler
{
import game.view.scene.gamescene.GameScene;

import jing.consts.GameDir;

public class SCResadyGame
{

	public function SCResadyGame()
	{
		GameScene.cur.model.releaseOutRoomTimer();
		GameScene.cur.info.setReady(GameDir.DOWN, true);
		GameScene.cur.info.setHu(GameDir.DOWN, false);
	}

}
}