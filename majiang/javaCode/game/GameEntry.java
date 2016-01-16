
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
			Global.account = "fucker2";
			Global.adAccount = Global.account;
		}
		Global.resUrl = "http://192.168.0.202/itv/gbmj/res";
		// Res.localRes.init("/res.json");
		Res.httpRes.init("/res.json", Global.resUrl);
		Res.actively = Res.httpRes;
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
