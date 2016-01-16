package jing.game.net.handler;

import game.view.scene.gamescene.GameScene;


public class CSGameManual
{

	public CSGameManual()
	{
		GameScene gs = GameScene.cur;
		gs.pDown.setAuto(false);
		gs.info.showAuto(gs.pDown.dir(), false);
	}

}
