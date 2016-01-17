
package jing.game.view;

import java.util.Hashtable;
import java.util.Vector;

import jing.GDC;
import jing.consts.CardPlace;
import jing.consts.CombinType;
import jing.consts.GameDir;
import jing.consts.MahjongBoardType;
import jing.consts.MahjongState;
import jing.game.vo.CombinVO;
import jing.pai.ChuTip;
import jing.pai.consts.KeType;
import jing.pai.consts.KeType2;
import jing.pai.helper.ChuHelp;
import jing.pai.model.CardKe;
import jing.pai.vo.ChuVO;
import jing.vo.CardLayoutVO;
import framework.views.DisplayObject;
import framework.views.Sprite;
import game.view.scene.gamescene.GameScene;

/**
 * @author Jing
 */
public class Player extends Sprite
{

	/**
	 * 需要重新布局
	 */
	private boolean _needRelayout = true;

	/**
	 * 玩家相关的麻将的表
	 */
	Hashtable _mjT;

	/**
	 * 座位号
	 */
	private int _seat = -1;

	public int seat()
	{
		return _seat;
	}

	public void setSeat(int seat)
	{
		_seat = seat;
	}

	private String _name = null;

	public String name()
	{
		return _name;
	}

	private long _gold = -1;

	public long gold()
	{
		return _gold;
	}

	private int _portrait = -1;

	public int portrait()
	{
		return _portrait;
	}

	private int _gender = 1;

	public int gender()
	{
		return _gender;
	}

	private boolean _isReady = false;

	public boolean isReady()
	{
		return _isReady;
	}

	public void setReady(boolean v)
	{
		_isReady = v;
	}

	String _dir;

	public String dir()
	{
		return _dir;
	}

	boolean _showHand = false;

	private int _lack = 0;

	public int lack()
	{
		return _lack;
	}

	private boolean _inTurn = false;

	/**
	 * 是否在自己回合中
	 */
	public boolean inTurn()
	{
		return _inTurn;
	}

	/**
	 * 选中的手牌索引，如果索引等于手牌长度，则表示选中的摸到的牌
	 */
	private int _selected = -1;

	public int selected()
	{
		return _selected;
	}

	private boolean _isAuto = false;

	private ChuTip _chuTip = null;

	public ChuTip chuTip()
	{
		return _chuTip;
	}

	public void setAuto(boolean v)
	{
		_isAuto = v;
	}

	/**
	 * 是否托管中
	 */
	public boolean isAuto()
	{
		return _isAuto;
	}

	public Player(String dir)
	{
		_dir = dir;
		init();
	}

	public void updateInfo(int seat, String name, long gold, int portrait, int gender)
	{
		_seat = seat;
		_name = name;
		_gold = gold;
		_portrait = portrait;
		_gender = gender;
	}

	private void init()
	{
		_mjT = new Hashtable(4);
		_mjT.put(CardPlace.IN_HAND, new Vector());
		_mjT.put(CardPlace.IN_HAND_TABLE, new Vector());
		_mjT.put(CardPlace.NEW_IN_HAND, new Vector());
		_mjT.put(CardPlace.ON_TABLE, new Vector());
	}

	public void reset()
	{
		_isReady = false;
		_showHand = false;
		this._isAuto = false;
		_selected = -1;
		_inTurn = false;

		init();
		this.removeAllChildren();
	}

	/**
	 * 移除牌桌上最后一张牌
	 */
	public void removeLastOnTable()
	{
		Vector vec = (Vector)_mjT.get(CardPlace.ON_TABLE);
		tidyVec(vec, vec.size() - 1);
	}

	/**
	 * 卡牌数量
	 * 
	 * @param place
	 * @return
	 */
	public int cardCount(String place)
	{
		Vector vec = (Vector)_mjT.get(place);
		return vec.size();
	}

	public void setInHand(int[] cards)
	{
		setCards(cards, CardPlace.IN_HAND);
	}

	public void setShowHand(boolean showHand)
	{
		if(showHand == _showHand)
		{
			return;
		}

		Vector vec = (Vector)_mjT.get(CardPlace.IN_HAND);
		for(int i = 0; i < vec.size(); i++)
		{
			Mahjong mj = (Mahjong)vec.elementAt(i);
			mj.changeCard(mj.card(), mj.dir(), showHand ? CardPlace.SHOW_HAND : CardPlace.IN_HAND);
		}

		Vector newVec = (Vector)_mjT.get(CardPlace.NEW_IN_HAND);
		if(newVec.size() > 0)
		{
			Mahjong mj = (Mahjong)newVec.elementAt(0);
			mj.changeCard(mj.card(), mj.dir(), showHand ? CardPlace.SHOW_HAND : CardPlace.IN_HAND);
		}

		_showHand = showHand;
		needRefresh();
	}

	public void setInHandTable(CombinVO[] combins)
	{
		Vector vec = (Vector)_mjT.get(CardPlace.IN_HAND_TABLE);
		tidyVec(vec, combins.length);

		for(int i = 0; i < combins.length; i++)
		{
			CombinVO cbVO = combins[i];
			Object obj = vec.elementAt(i);
			Combin cb;
			if(obj != null)
			{
				cb = (Combin)obj;
				cb.changeCombin(cbVO.type, cbVO.card, _dir, CardPlace.IN_HAND_TABLE);
			}
			else
			{
				cb = new Combin(cbVO.type, cbVO.card, _dir, CardPlace.IN_HAND_TABLE);
			}

			vec.setElementAt(cb, i);
			this.addChild(cb);
		}

		needRefresh();
	}

	public void setNewInHand(int card)
	{
		int[] cards = {card};
		if(-1 == card)
		{
			cards = new int[0];
		}

		setCards(cards, CardPlace.NEW_IN_HAND);
	}

	public void setOnTable(int[] cards)
	{
		setCards(cards, CardPlace.ON_TABLE);
	}

	private void setCards(int[] cards, String place)
	{
		Vector vec = (Vector)_mjT.get(place);
		tidyVec(vec, cards.length);

		for(int i = 0; i < cards.length; i++)
		{
			int card = cards[i];
			Object obj = vec.elementAt(i);
			Mahjong mj;
			if(obj != null)
			{
				mj = (Mahjong)obj;
				mj.changeCard(card, _dir, place);
			}
			else
			{
				mj = new Mahjong(card, _dir, place);
			}
			vec.setElementAt(mj, i);

			this.addChild(mj);
		}

		needRefresh();
	}

	private void tidyVec(Vector vec, int limit)
	{
		int vecLen = vec.size();
		if(vecLen > limit)
		{
			for(int i = limit; i < vecLen; i++)
			{
				DisplayObject obj = (DisplayObject)vec.elementAt(i);
				this.removeChild(obj);
			}
		}

		vec.setSize(limit);
	}

	/**
	 * 需要刷新布局
	 */
	public void needRefresh()
	{
		_needRelayout = true;
	}

	/**
	 * 游戏进入新一帧
	 */
	protected void enterFrame(long time)
	{
		if(_needRelayout)
		{
			_needRelayout = false;
			refreshLayout();
		}
		super.enterFrame(time);
	}

	private void refreshLayout()
	{
		layoutInHandVec((Vector)_mjT.get(CardPlace.IN_HAND), true == _showHand ? GDC.cl.getLayout(_dir, CardPlace.SHOW_HAND) : GDC.cl.getLayout(_dir, CardPlace.IN_HAND));
		layoutVec((Vector)_mjT.get(CardPlace.IN_HAND_TABLE), GDC.cl.getLayout(_dir, CardPlace.IN_HAND_TABLE));
		layoutVec((Vector)_mjT.get(CardPlace.NEW_IN_HAND), GDC.cl.getLayout(_dir, CardPlace.NEW_IN_HAND));
		layoutVec((Vector)_mjT.get(CardPlace.ON_TABLE), GDC.cl.getLayout(_dir, CardPlace.ON_TABLE));
		sortDeep();
	}

	private void layoutInHandVec(Vector vec, CardLayoutVO vo)
	{
		// GDC.trace("layout:" + vec.size());
		int size = vec.size();
		int x = vo.startX;
		int y = vo.startY;

		for(int i = size - 1; i >= 0; i--)
		{
			DisplayObject obj = (DisplayObject)vec.elementAt(i);

			int count = size - i - 1;

			int offX = 0;
			int offY = 0;

			if(GameDir.UP.equals(vo.dir))
			{
				offY = -1 * count * (obj.getHeight() + vo.gap);
			}
			else if(GameDir.LEFT.equals(vo.dir))
			{
				offX = -1 * count * (obj.getWidth() + vo.gap);
			}
			else if(GameDir.DOWN.equals(vo.dir))
			{
				offY = count * (obj.getHeight() + vo.gap);
			}
			else if(GameDir.RIGHT.equals(vo.dir))
			{
				offX = (count % vo.warpCount) * (obj.getWidth() + vo.gap);
			}

			x = vo.startX + offX;
			y = vo.startY + offY;

			obj.setPosition(x, y);
		}
	}

	private void layoutVec(Vector vec, CardLayoutVO vo)
	{
		int size = vec.size();
		int x = vo.startX;
		int y = vo.startY;
		for(int i = 0; i < size; i++)
		{
			DisplayObject obj = (DisplayObject)vec.elementAt(i);

			int warpX = 0;
			int warpY = 0;
			int warp = i / vo.warpCount;
			if(warp > 0)
			{
				warpX = vo.warp.x() * warp;
				warpY = vo.warp.y() * warp;
			}

			int offX = 0;
			int offY = 0;
			int count = i % vo.warpCount;

			if(GameDir.UP.equals(vo.dir))
			{
				offY = -1 * count * (obj.getHeight() + vo.gap);
			}
			else if(GameDir.LEFT.equals(vo.dir))
			{
				offX = -1 * count * (obj.getWidth() + vo.gap);
			}
			else if(GameDir.DOWN.equals(vo.dir))
			{
				offY = count * (obj.getHeight() + vo.gap);
			}
			else if(GameDir.RIGHT.equals(vo.dir))
			{
				offX = (count % vo.warpCount) * (obj.getWidth() + vo.gap);
			}

			x = vo.startX + warpX + offX;
			y = vo.startY + warpY + offY;

			obj.setPosition(x, y);
		}
	}

	private void sortDeep()
	{
		for(int i = 0; i < this.numChildren(); i++)
		{
			DisplayObject obj = this.getChildAt(i);
			int y = obj.getY();
			int j = 0;
			for(j = 0; j < i; j++)
			{
				if(y < this.getChildAt(j).getY())
				{
					break;
				}
			}
			this.addChildAt(obj, j);
		}
	}

	public void setLack(int lack)
	{
		_lack = lack;
		Vector vecLack = new Vector();
		Vector vecNoLack = new Vector();
		Vector vecInHand = (Vector)_mjT.get(CardPlace.IN_HAND);

		for(int index = 0; index < vecInHand.size(); ++index)
		{
			Mahjong mj = (Mahjong)vecInHand.elementAt(index);
			if(Math.floor(mj.card() / 10) == lack)
			{
				vecLack.addElement(mj);
			}
			else
			{
				vecNoLack.addElement(mj);
			}
		}

		vecInHand.removeAllElements();
		for(int index = 0; index < vecNoLack.size(); ++index)
		{
			vecInHand.addElement(vecNoLack.elementAt(index));
		}
		for(int index = 0; index < vecLack.size(); ++index)
		{
			vecInHand.addElement(vecLack.elementAt(index));
		}

		needRefresh();
	}

	/**
	 * 设置玩家是否在自己回合
	 * 
	 * @param b
	 */
	public void setInTurn(boolean b)
	{
		_inTurn = b;
	}

	/**
	 * 设置选中的牌
	 * 
	 * @param place
	 * @param index
	 */
	public void setSelectCard(int index)
	{
		if(_selected == index)
		{
			return;
		}
		GameScene.cur.jiaoTip(null);
		Mahjong mj = getSelectedCard();
		if(null != mj)
		{
			mj.setState(MahjongState.NORMAL);
		}
		_selected = index;
		mj = getSelectedCard();
		if(null != mj)
		{
			mj.setState(MahjongState.SELECTED);
			// 根据选中的牌，设置桌面上所有相同的牌为高亮提示
			GameScene.cur.glowSameCardOnTable(mj.card());

			if(null != _chuTip)
			{
				ChuVO vo = _chuTip.get(mj.card());
				if(null != vo)
				{
					GameScene.cur.jiaoTip(vo.jiaos);
				}
			}
		}
		else
		{
			_selected = -1;
		}
	}

	/**
	 * 向指定方向切换选择的牌
	 * 
	 * @param moveDir
	 */
	public void changeSelectCard(String moveDir)
	{
		int nowSelected = _selected;
		int inHandCount = cardCount(CardPlace.IN_HAND);
		inHandCount += cardCount(CardPlace.NEW_IN_HAND);

		if(-1 == nowSelected)
		{
			setSelectCard(inHandCount - 1);
		}
		else
		{
			if(GameDir.LEFT == moveDir)
			{
				nowSelected--;
				if(nowSelected < 0)
				{
					nowSelected = inHandCount - 1;
				}
			}
			else if(GameDir.RIGHT == moveDir)
			{
				nowSelected++;
				if(nowSelected >= inHandCount)
				{
					nowSelected = 0;
				}
			}

			setSelectCard(nowSelected);
		}
	}

	public Mahjong getSelectedCard()
	{
		if(-1 == _selected)
		{
			return null;
		}

		if(_selected < cardCount(CardPlace.IN_HAND))
		{
			return getCard(CardPlace.IN_HAND, _selected);
		}

		return getCard(CardPlace.NEW_IN_HAND, 0);
	}

	public Mahjong getCard(String place, int index)
	{
		Vector vec = (Vector)_mjT.get(place);
		if(index >= vec.size() || index < 0)
		{
			return null;
		}

		Mahjong mj = (Mahjong)vec.elementAt(index);
		return mj;
	}

	public void clearJiaoTip()
	{
		Vector vecInHand = (Vector)_mjT.get(CardPlace.IN_HAND);
		for(int i = 0; i < vecInHand.size(); i++)
		{
			Mahjong mj = (Mahjong)vecInHand.elementAt(i);
			mj.setBoard(MahjongBoardType.NONE);
		}

		Mahjong mj = getCard(CardPlace.NEW_IN_HAND, 0);
		if(mj != null)
		{
			mj.setBoard(MahjongBoardType.NONE);
		}
	}

	public void updateChuTip()
	{
		ChuHelp ch = new ChuHelp();
		// 将手上的牌和刻字放入进行计算
		ChuTip ct = ch.check(getInHandCards(), getOnTableKes());
		if(ct != null)
		{
			System.out.println(ct.toString());
		}
		_chuTip = ct;
		if(null != ct)
		{
			int[] cards = ct.getPlayCards();
			GDC.trace("出牌提示：" + ct.toString());
			// 给所有打出后可以下叫的手牌加上边框
			Vector vecInHand = (Vector)_mjT.get(CardPlace.IN_HAND);
			for(int i = 0; i < vecInHand.size(); i++)
			{
				Mahjong mj = (Mahjong)vecInHand.elementAt(i);
				for(int j = 0; j < cards.length; j++)
				{
					if(mj.card() == cards[j])
					{
						mj.setBoard(MahjongBoardType.FOR_JIAO);
					}
					else
					{
						mj.setBoard(MahjongBoardType.NONE);
					}
				}
			}

			// 摸到的牌
			Mahjong mj = getCard(CardPlace.NEW_IN_HAND, 0);
			if(mj != null)
			{
				for(int j = 0; j < cards.length; j++)
				{
					if(mj.card() == cards[j])
					{
						mj.setBoard(MahjongBoardType.FOR_JIAO);
					}
					else
					{
						mj.setBoard(MahjongBoardType.NONE);
					}
				}
			}

			// 判断选中的牌，如果打出后可以下叫，则显示打出后叫的牌以及对应的胡牌番型
			ChuVO chuVO = ct.get(_selected);
			if(null != chuVO)
			{
				GameScene.cur.showChuInfo(chuVO);
			}
		}
	}

	/**
	 * 得到手牌中所有卡牌的值的数组
	 * 
	 * @return
	 */
	private int[] getInHandCards()
	{
		int inHandCount = cardCount(CardPlace.IN_HAND);
		int newCount = cardCount(CardPlace.NEW_IN_HAND);
		int[] inHandCards = new int[inHandCount + newCount];
		Vector vecInHand = (Vector)_mjT.get(CardPlace.IN_HAND);
		for(int i = 0; i < vecInHand.size(); i++)
		{
			Mahjong mj = (Mahjong)vecInHand.elementAt(i);
			inHandCards[i] = mj.card();
		}

		if(newCount != 0)
		{
			inHandCards[inHandCards.length - 1] = getCard(CardPlace.NEW_IN_HAND, 0).card();
		}
		return inHandCards;
	}

	/**
	 * 得到桌面上所有的刻的数组
	 * 
	 * @return
	 */
	private CardKe[] getOnTableKes()
	{
		CardKe[] kes = new CardKe[cardCount(CardPlace.IN_HAND_TABLE)];
		Vector vec = (Vector)_mjT.get(CardPlace.IN_HAND_TABLE);
		for(int i = 0; i < vec.size(); i++)
		{
			Combin cb = (Combin)vec.elementAt(i);
			int keType = -1;
			int keType2 = 0;

			if(cb.type() == CombinType.PENG)
			{
				keType = KeType.PENG;
				keType2 = KeType2.PENG;
			}
			else if(cb.type() == CombinType.CHI_LEFT || cb.type() == CombinType.CHI_MIDDLE || cb.type() == CombinType.CHI_RIGHT)
			{
				keType = KeType.CHI;
				if(cb.type() == CombinType.CHI_LEFT)
				{
					keType2 = KeType2.ZUO_CHI;
				}
				else if(cb.type() == CombinType.CHI_MIDDLE)
				{
					keType2 = KeType2.MID_CHI;
				}
				else if(cb.type() == CombinType.CHI_RIGHT)
				{
					keType2 = KeType2.YOU_CHI;
				}
			}
			else if(cb.type() == CombinType.AN_GANG || cb.type() == CombinType.GANG)
			{
				keType = KeType.GANG;
				if(cb.type() == CombinType.AN_GANG)
				{
					keType2 = KeType2.AN_GANG;
				}
				else if(cb.type() == CombinType.GANG)
				{
					keType2 = KeType2.MING_GANG;
				}
			}

			kes[i] = new CardKe(keType, cb.card(), keType2);
		}
		return kes;
	}

	/**
	 * 将指定状态的卡牌更换为新的状态
	 * 
	 * @param place
	 * @param card
	 * @param oldState
	 * @param newState
	 */
	public void changeCardsState(String place, int card, int oldState, int newState)
	{
		Vector vec = (Vector)_mjT.get(place);
		for(int i = 0; i < vec.size(); i++)
		{
			Mahjong mj = (Mahjong)vec.elementAt(i);
			if(mj.card() == card && mj.state() == oldState)
			{
				mj.setState(newState);
			}
		}
	}

	/**
	 * 重置卡牌的状态为Normal
	 * 
	 * @param place
	 */
	public void resetCardsState(String place)
	{
		Vector vec = (Vector)_mjT.get(place);
		for(int i = 0; i < vec.size(); i++)
		{
			Mahjong mj = (Mahjong)vec.elementAt(i);
			mj.setState(MahjongState.NORMAL);
		}
	}

}
