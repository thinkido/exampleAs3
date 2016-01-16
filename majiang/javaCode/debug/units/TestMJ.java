
package debug.units;

import jing.GDC;
import jing.configs.CardLayout;
import jing.configs.Config;
import jing.consts.GameDir;
import jing.consts.CardPlace;
import jing.consts.CombinType;
import jing.game.view.Combin;
import jing.game.view.Mahjong;
import framework.views.Sprite;
import game.model.Global;

/**
 * ²âÊÔÂé½«
 * 
 * @author Jing
 */
public class TestMJ extends Sprite
{

	public TestMJ()
	{
		Global.cfg = new Config("config_json");
		GDC.cl = new CardLayout();
		test();
	}

	private void test()
	{
		int x = 0;
		for(int i = 11; i <= 19; i++)
		{
			Mahjong mj = new Mahjong(i, GameDir.LEFT, CardPlace.ON_TABLE);
			mj.setBack(i % 2 == 1);
			mj.setPosition(x, 0);
			this.addChild(mj);
			x += mj.getW();
			
			mj.changeCard(12, GameDir.LEFT, CardPlace.ON_TABLE);

		}
		
		Combin cb = new Combin(CombinType.CHI_LEFT, 11, GameDir.LEFT, CardPlace.IN_HAND_TABLE);
		this.addChild(cb);
		cb.setPosition(cb.getX(), 100);
		cb.changeCombin(CombinType.GANG, 12, GameDir.LEFT, CardPlace.IN_HAND_TABLE);
		
		cb = new Combin(CombinType.AN_GANG, 11, GameDir.LEFT, CardPlace.IN_HAND_TABLE);
		this.addChild(cb);
		cb.setPosition(cb.getX(), 200);
		
		cb = new Combin(CombinType.GANG, 11, GameDir.LEFT, CardPlace.IN_HAND_TABLE);
		this.addChild(cb);
		cb.setPosition(cb.getX(), 300);
		
		cb = new Combin(CombinType.PENG, 11, GameDir.LEFT, CardPlace.IN_HAND_TABLE);
		this.addChild(cb);
		cb.setPosition(cb.getX(), 400);
		
		cb = new Combin(CombinType.AN_GANG, 11, GameDir.DOWN, CardPlace.IN_HAND_TABLE);
		this.addChild(cb);
		cb.setPosition(cb.getX() + 200, 200);

	}
}
