
package debug;

import debug.units.TestEffect;
import debug.units.TestPlayer;
import framework.resources.Res;
import framework.views.Sprite;
import game.model.Global;

public class DebugEntry extends Sprite
{

	// private int curNum;

	public DebugEntry()
	{
	}

	protected void addedToStage()
	{
		Global.resUrl = "http://182.140.237.55/res_i";
		Res.localRes.init("/res.json");
		Res.actively = Res.localRes;
		Global.setRoot(this);
		// LogManager.getInstance().showPanel();
		this.addChild(new TestPlayer());
	}

}
