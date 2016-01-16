
package jing.game.view;

import jing.GDC;
import jing.consts.GameDir;
import jing.consts.CardPlace;
import jing.consts.MahjongBoardType;
import jing.consts.MahjongState;
import framework.resources.Res;
import framework.resources.SpriteSheet;
import framework.resources.Texture;
import framework.views.Bitmap;
import framework.views.Sprite;

/**
 * �齫��ʾ����
 * 
 * @author Jing
 */
public class Mahjong extends Sprite
{

	private int _card = 0;

	/**
	 * ����
	 */
	public int card()
	{
		return _card;
	}

	private int _state = 0;

	/**
	 * �齫��״̬
	 */
	public int state()
	{
		return _state;
	}

	/**
	 * ���Ƿ���ŵ�
	 */
	private boolean _isBack = false;

	/**
	 * �齫��������ҷ�λ
	 */
	private String _dir = null;

	public String dir()
	{
		return _dir;
	}

	/**
	 * �齫���ڵ�λ��
	 */
	private String _place = null;

	public String place()
	{
		return _place;
	}

	/**
	 * ��
	 */
	private SpriteSheet _cards = null;

	/**
	 * �齫ͼ
	 */
	private Bitmap _mj = null;

	/**
	 * Ч��ͼ
	 */
	private Bitmap _effect = null;

	/**
	 * �߿��ͼ(������������½У���ô�����ر�ı߿�)
	 */
	private Bitmap _board = null;

	public Mahjong(int card, String dir, String place)
	{
		_cards = Res.actively.getSheet("mahjong_json");
		_mj = new Bitmap(null);
		_effect = new Bitmap(null);
		_board = new Bitmap(null);
		this.addChild(_mj);
		this.addChild(_effect);
		this.addChild(_board);
		changeCard(card, dir, place);
	}

	/**
	 * �ı俨��
	 * 
	 * @param card
	 * @param dir
	 * @param place
	 */
	public void changeCard(int card, String dir, String place)
	{
		_card = card;
		_dir = dir;
		_place = place;
		refresh();
	}

	public void setState(int state)
	{
		_state = state;
		if(_state == MahjongState.NORMAL)
		{
			_effect.setTexture(null);
		}
		else if(_state == MahjongState.SELECTED)
		{
			_effect.setTexture(Res.actively.getTexture("in_hand_card_effect_png"));
			_effect.setPosition(0, 0);
		}
		else if(_state == MahjongState.GLOW)
		{
			_effect.setTexture(Res.actively.getTexture("on_table_card_effect_png"));
			_effect.setPosition(0, 0);
		}
		else if(_state == MahjongState.DISABLE)
		{
			_effect.setTexture(null);
		}
		else if(_state == MahjongState.LAST_CHU)
		{
			_effect.setTexture(Res.actively.getTexture("last_chu_png"));
			_effect.setPosition(-4, -41);
		}
	}

	public void setBack(boolean isBack)
	{
		_isBack = isBack;
		refresh();
	}

	private Texture getTexture()
	{
		String cardPrefix = GDC.cl.getLayout(_dir, _place).cardPrefix;
		String tName = null;
		if((_place.equals(CardPlace.IN_HAND) || _place.equals(CardPlace.NEW_IN_HAND)) && _dir != GameDir.DOWN)
		{
			// ���˵�����
			tName = cardPrefix;
		}
		else if(_isBack)
		{
			tName = cardPrefix + "back";
		}
		else
		{
			tName = cardPrefix + _card;
		}

		Texture cardT = this._cards.getTexture(tName);
		if(null == cardT)
		{
			System.out.println("�����ڵ��齫��" + tName);
		}
		return cardT;
	}

	private void refresh()
	{
		_mj.setTexture(getTexture());
		this.setWidth(_mj.getWidth());
		this.setHeight(_mj.getHeight());
	}

	public void setBoard(int type)
	{
		if(MahjongBoardType.NONE == type)
		{
			_board.setTexture(null);
		}
		else if(MahjongBoardType.FOR_JIAO == type)
		{
			_board.setTexture(Res.actively.getTexture("for_jiao_png"));
		}
	}

	public int getW()
	{
		return _mj.getWidth();
	}

	public int getH()
	{
		return _mj.getHeight();
	}

}
