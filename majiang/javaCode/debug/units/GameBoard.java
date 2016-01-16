
package debug.units;

import game.model.Global;
import game.view.scene.gamescene.elements.ChiPreviewUI;
import jing.GDC;
import jing.configs.CardLayout;
import jing.configs.Config;
import jing.consts.PlayerAction;
import ui.UIContainer;

public class GameBoard extends UIContainer
{

	public GameBoard()
	{
		Global.cfg = new Config("config_json");
		GDC.cl = new CardLayout();
		ChiPreviewUI cp = new ChiPreviewUI(15, PlayerAction.CHI_RIGHT);
		this.addChild(cp);
//		initWithJsonObject(getJson("board_layer_json"));
//		DisplayObject obj = this.getChildByName("a");
//		obj.setVisible(false);
//		this.releaseRes();
	}
}
