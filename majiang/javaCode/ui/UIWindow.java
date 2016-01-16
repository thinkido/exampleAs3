
package ui;

import framework.views.Bitmap;
import game.control.WindowManager;
import game.model.Global;

public abstract class UIWindow extends UICurrentView
{

	public void addDarkBg()
	{
		addChildAt(new Bitmap(Global.imgDarkBg), 0);
	}

	/**
	 * ·µ»Ø
	 */
	public void onGoBack()
	{
		WindowManager.getInstance().closeCurWindow();
	}
}
