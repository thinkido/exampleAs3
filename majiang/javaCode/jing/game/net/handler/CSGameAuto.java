
package jing.game.net.handler;

import game.view.scene.gamescene.GameScene;

public class CSGameAuto
{

	public CSGameAuto()
	{
		GameScene gs = GameScene.cur;
		gs.pDown.setAuto(true);
		gs.info.showAuto(gs.pDown.dir(), true);
	}

}
