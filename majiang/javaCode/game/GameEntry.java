
package game;

import jing.GDC;
import jing.configs.CardLayout;
import jing.configs.Config;
import framework.resources.Res;
import framework.views.Sprite;
import game.model.Global;

public class GameEntry extends Sprite
{

	public GameEntry()
	{

	}

	protected void initInfo()
	{
		if(Global.account == null)
		{
			Global.account = "fuck222";
			Global.adAccount = Global.account;
		}
		Global.resUrl = "http://182.140.237.55/res_i";
		Res.localRes.init("/res.json");
		Res.actively = Res.localRes;
		// Res.httpRes.init("/res.json", Global.resUrl);
		// Res.actively = Res.httpRes;

		Global.cfg = new Config("config_json");
		GDC.cl = new CardLayout();
	}

	protected void addedToStage()
	{
		Global.setRoot(this);
		initInfo();
		Global.init();
	}

}
