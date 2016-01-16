
package game.view.scene.gamescene.elements;

import jing.consts.CardPlace;
import jing.consts.GameDir;
import jing.consts.MahjongState;
import jing.consts.PlayerAction;
import jing.game.view.Mahjong;
import framework.views.Sprite;

public class ChiPreviewUI extends Sprite
{

	private Mahjong[] mjs = new Mahjong[3];

	public ChiPreviewUI(int card, int type)
	{
		int card1 = 0;
		int card2 = 0;
		int card3 = 0;
		int eatedIndex = -1;
		if(type == PlayerAction.CHI_LEFT)
		{
			eatedIndex = 0;
			card1 = card;
			card2 = card + 1;
			card3 = card + 2;
		}
		else if(type == PlayerAction.CHI_MIDDLE)
		{
			eatedIndex = 1;
			card1 = card;
			card2 = card + 1;
			card3 = card + 2;
		}
		else if(type == PlayerAction.CHI_RIGHT)
		{
			eatedIndex = 2;
			card1 = card;
			card2 = card + 1;
			card3 = card + 2;
		}

		mjs[0] = new Mahjong(card1, GameDir.DOWN, CardPlace.ON_TABLE);
		mjs[1] = new Mahjong(card2, GameDir.DOWN, CardPlace.ON_TABLE);
		mjs[2] = new Mahjong(card3, GameDir.DOWN, CardPlace.ON_TABLE);
		int w = mjs[0].getWidth();
		mjs[1].setPosition(w, 0);
		mjs[2].setPosition(w * 2, 0);
		mjs[eatedIndex].setState(MahjongState.GLOW);
		for(int i = 0; i < mjs.length; i++)
		{
			this.addChild(mjs[i]);
		}
	}

}
