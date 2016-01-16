
package jing.game.view;

import jing.GDC;
import jing.consts.GameDir;
import jing.consts.CombinType;
import jing.vo.CardLayoutVO;
import framework.views.Sprite;

/**
 * 组合牌，例如玩家打出的碰、吃、杠、暗杠
 * 
 * @author Jing
 */
public class Combin extends Sprite
{

	private int _type = 0;

	public int type()
	{
		return _type;
	}

	/**
	 * 如果是吃_card表示顺子的第一张牌
	 */
	private int _card = 0;

	public int card()
	{
		return _card;
	}

	private String _dir = null;

	private String _place = null;

	private Mahjong[] _mjs = null;

	public Combin(int type, int card, String dir, String place)
	{
		changeCombin(type, card, dir, place);
	}

	public void changeCombin(int type, int card, String dir, String place)
	{
		_type = type;
		_card = card;
		_dir = dir;
		_place = place;
		refresh();
	}

	private void refresh()
	{
		this.removeAllChildren();
		CardLayoutVO vo = GDC.cl.getLayout(_dir, _place);
		switch(_type)
		{
			case CombinType.AN_GANG:
			case CombinType.GANG:
				_mjs = new Mahjong[4];
				break;
			case CombinType.CHI_LEFT:
			case CombinType.CHI_MIDDLE:
			case CombinType.CHI_RIGHT:
			case CombinType.PENG:
				_mjs = new Mahjong[3];
				break;
		}

		int offX = 0;
		int w = 0;
		int h = 0;
		for(int i = 0; i < _mjs.length; i++)
		{
			int card = _card;
			if(_type == CombinType.CHI_LEFT || _type == CombinType.CHI_MIDDLE || _type == CombinType.CHI_RIGHT)
			{
				// 如果是吃，_card表示顺子的第一个牌
				card = _card + i;
			}
			Mahjong mj = new Mahjong(card, _dir, _place);

			mj.setPosition(offX, 0);

			if(_type == CombinType.AN_GANG)
			{
				mj.setBack(true);
			}

			offX += mj.getW() + vo.combinGap;
			this.addChild(mj);

			_mjs[i] = mj;
		}

		if(_type == CombinType.AN_GANG || _type == CombinType.GANG)
		{
			_mjs[3].setPosition(_mjs[1].getX(), _mjs[1].getY() + vo.combinGangOffY);
		}

		if(_type == CombinType.AN_GANG && _dir == GameDir.DOWN)
		{
			_mjs[3].setBack(false);
		}

		w = _mjs[0].getWidth() * 3;
		h = _mjs[0].getHeight();
		this.setWidth(w);
		this.setHeight(h);
	}
}
