
package debug.units;

import jing.GDC;
import jing.configs.CardLayout;
import jing.configs.Config;
import jing.consts.GameDir;
import jing.game.view.Player;
import jing.game.vo.CombinVO;
import framework.views.Sprite;
import game.model.Global;
import game.view.scene.gamescene.elements.GameInfoUI;

/**
 * ≤‚ ‘ÕÊº“
 * 
 * @author Jing
 */
public class TestPlayer extends Sprite
{

	public TestPlayer()
	{
		Global.cfg = new Config("config_json");
		GDC.cl = new CardLayout();

		GameInfoUI ui = new GameInfoUI();

		// this.addChild(new GameBoard());
		createDown();
		createUp();
		createLeft();
		createRight();

		this.addChild(ui);
	}

	private void createDown()
	{
		int[] inHand = {11, 12, 13};
		int mo = 21;
		int[] onTable = {11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29};
		CombinVO[] cbs = new CombinVO[3];
		cbs[0] = new CombinVO(1, 11);
		cbs[1] = new CombinVO(2, 11);
		cbs[2] = new CombinVO(3, 11);

		Player p = new Player(GameDir.DOWN);

		p.setInHand(inHand);
		p.setNewInHand(mo);
		p.setOnTable(onTable);
		p.setInHandTable(cbs);
		p.setShowHand(true);
		this.addChild(p);

		// p.reset();
	}

	private void createLeft()
	{
		int[] inHand = {11, 12, 13, 14, 15};
		int mo = 21;
		int[] onTable = {11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29};
		CombinVO[] cbs = new CombinVO[3];
		cbs[0] = new CombinVO(1, 11);
		cbs[1] = new CombinVO(2, 11);
		cbs[2] = new CombinVO(3, 11);

		Player p = new Player(GameDir.LEFT);

		p.setInHand(inHand);
		p.setNewInHand(mo);
		p.setOnTable(onTable);
		p.setInHandTable(cbs);
		p.setShowHand(true);
		this.addChild(p);

	}

	private void createRight()
	{
		int[] inHand = {11, 12, 13, 14, 15};
		int mo = 21;
		int[] onTable = {11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29};
		CombinVO[] cbs = new CombinVO[3];
		cbs[0] = new CombinVO(1, 41);
		cbs[1] = new CombinVO(2, 11);
		cbs[2] = new CombinVO(4, 11);

		Player p = new Player(GameDir.RIGHT);

		p.setNewInHand(mo);
		p.setInHand(inHand);

		p.setOnTable(onTable);
		p.setInHandTable(cbs);

		p.setShowHand(true);

		this.addChild(p);
	}

	private void createUp()
	{
		int[] inHand = {11, 12, 13, 14, 15};
		int mo = 21;
		int[] onTable = {11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29};
		CombinVO[] cbs = new CombinVO[3];
		cbs[0] = new CombinVO(1, 11);
		cbs[1] = new CombinVO(2, 11);
		cbs[2] = new CombinVO(4, 11);

		Player p = new Player(GameDir.UP);

		p.setInHand(inHand);
		p.setNewInHand(mo);
		p.setOnTable(onTable);
		p.setInHandTable(cbs);
		p.setShowHand(true);
		this.addChild(p);
	}

}
