package jing.game.view
{
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
	private var _needRelayout:Boolean= true;

	/**
	 * 玩家相关的麻将的表
	 */
	var _mjT:Hashtable;

	/**
	 * 座位号
	 */
	private var _seat:int= -1;

	public function seat():int{
		return _seat;
	}

	public function setSeat(seat:int):void{
		_seat = seat;
	}

	private var _name:String= null;

	public function name():String{
		return _name;
	}

	private var _gold:Number= -1;

	public function gold():Number{
		return _gold;
	}

	private var _portrait:int= -1;

	public function portrait():int{
		return _portrait;
	}

	private var _gender:int= 1;

	public function gender():int{
		return _gender;
	}

	private var _isReady:Boolean= false;

	public function isReady():Boolean{
		return _isReady;
	}

	public function setReady(v:Boolean):void{
		_isReady = v;
	}

	var _dir:String;

	public function dir():String{
		return _dir;
	}

	var _showHand:Boolean= false;

	private var _lack:int= 0;

	public function lack():int{
		return _lack;
	}

	private var _inTurn:Boolean= false;

	/**
	 * 是否在自己回合中
	 */
	public function inTurn():Boolean{
		return _inTurn;
	}

	/**
	 * 选中的手牌索引，如果索引等于手牌长度，则表示选中的摸到的牌
	 */
	private var _selected:int= -1;

	public function selected():int{
		return _selected;
	}

	private var _isAuto:Boolean= false;

	private var _chuTip:ChuTip= null;

	public function chuTip():ChuTip{
		return _chuTip;
	}

	public function setAuto(v:Boolean):void{
		_isAuto = v;
	}

	/**
	 * 是否托管中
	 */
	public function isAuto():Boolean{
		return _isAuto;
	}

	public function Player(dir:String)
	{
		_dir = dir;
		init();
	}

	public function updateInfo(seat:int, name:String, gold:Number, portrait:int, gender:int):void{
		_seat = seat;
		_name = name;
		_gold = gold;
		_portrait = portrait;
		_gender = gender;
	}

	private function init():void{
		_mjT = new Hashtable(4);
		_mjT.put(CardPlace.IN_HAND, new Vector());
		_mjT.put(CardPlace.IN_HAND_TABLE, new Vector());
		_mjT.put(CardPlace.NEW_IN_HAND, new Vector());
		_mjT.put(CardPlace.ON_TABLE, new Vector());
	}

	public function reset():void{
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
	public function removeLastOnTable():void{
		var vec:Vector= Vector(_mjT.get(CardPlace.ON_TABLE));
		tidyVec(vec, vec.size() - 1);
	}

	/**
	 * 卡牌数量
	 * 
	 * @param place
	 * @return
	 */
	public function cardCount(place:String):int{
		var vec:Vector= Vector(_mjT.get(place));
		return vec.size();
	}

	public function setInHand(cards:Array):void{
		setCards(cards, CardPlace.IN_HAND);
	}

	public function setShowHand(showHand:Boolean):void{
		if(showHand == _showHand)
		{
			return;
		}

		var vec:Vector= Vector(_mjT.get(CardPlace.IN_HAND));
		for(var i:int= 0; i < vec.size(); i++)
		{
			var mj:Mahjong= Mahjong(vec.elementAt(i));
			mj.changeCard(mj.card(), mj.dir(), showHand ? CardPlace.SHOW_HAND : CardPlace.IN_HAND);
		}

		var newVec:Vector= Vector(_mjT.get(CardPlace.NEW_IN_HAND));
		if(newVec.size() > 0)
		{
			var mj:Mahjong= Mahjong(newVec.elementAt(0));
			mj.changeCard(mj.card(), mj.dir(), showHand ? CardPlace.SHOW_HAND : CardPlace.IN_HAND);
		}

		_showHand = showHand;
		needRefresh();
	}

	public function setInHandTable(combins:Array):void{
		var vec:Vector= Vector(_mjT.get(CardPlace.IN_HAND_TABLE));
		tidyVec(vec, combins.length);

		for(var i:int= 0; i < combins.length; i++)
		{
			var cbVO:CombinVO= combins[i];
			var obj:Object= vec.elementAt(i);
			var cb:Combin;
			if(obj != null)
			{
				cb = Combin(obj);
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

	public function setNewInHand(card:int):void{
		var cards:Array= {card};
		if(-1== card)
		{
			cards = new int[0];
		}

		setCards(cards, CardPlace.NEW_IN_HAND);
	}

	public function setOnTable(cards:Array):void{
		setCards(cards, CardPlace.ON_TABLE);
	}

	private function setCards(cards:Array, place:String):void{
		var vec:Vector= Vector(_mjT.get(place));
		tidyVec(vec, cards.length);

		for(var i:int= 0; i < cards.length; i++)
		{
			var card:int= cards[i];
			var obj:Object= vec.elementAt(i);
			var mj:Mahjong;
			if(obj != null)
			{
				mj = Mahjong(obj);
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

	private function tidyVec(vec:Vector, limit:int):void{
		var vecLen:int= vec.size();
		if(vecLen > limit)
		{
			for(var i:int= limit; i < vecLen; i++)
			{
				var obj:DisplayObject= DisplayObject(vec.elementAt(i));
				this.removeChild(obj);
			}
		}

		vec.setSize(limit);
	}

	/**
	 * 需要刷新布局
	 */
	public function needRefresh():void{
		_needRelayout = true;
	}

	/**
	 * 游戏进入新一帧
	 */
	protected function enterFrame(time:Number):void{
		if(_needRelayout)
		{
			_needRelayout = false;
			refreshLayout();
		}
		super.enterFrame(time);
	}

	private function refreshLayout():void{
		layoutInHandVec(Vector(_mjT.get(CardPlace.IN_HAND)), true == _showHand ? GDC.cl.getLayout(_dir, CardPlace.SHOW_HAND) : GDC.cl.getLayout(_dir, CardPlace.IN_HAND));
		layoutVec(Vector(_mjT.get(CardPlace.IN_HAND_TABLE)), GDC.cl.getLayout(_dir, CardPlace.IN_HAND_TABLE));
		layoutVec(Vector(_mjT.get(CardPlace.NEW_IN_HAND)), GDC.cl.getLayout(_dir, CardPlace.NEW_IN_HAND));
		layoutVec(Vector(_mjT.get(CardPlace.ON_TABLE)), GDC.cl.getLayout(_dir, CardPlace.ON_TABLE));
		sortDeep();
	}

	private function layoutInHandVec(vec:Vector, vo:CardLayoutVO):void{
		// GDC.trace("layout:" + vec.size());
		var size:int= vec.size();
		var x:int= vo.startX;
		var y:int= vo.startY;

		for(var i:int= size - 1; i >= 0; i--)
		{
			var obj:DisplayObject= DisplayObject(vec.elementAt(i));

			var count:int= size - i - 1;

			var offX:int= 0;
			var offY:int= 0;

			if(GameDir.UP.equals(vo.dir))
			{
				offY = -1* count * (obj.getHeight() + vo.gap);
			}
			else if(GameDir.LEFT.equals(vo.dir))
			{
				offX = -1* count * (obj.getWidth() + vo.gap);
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

	private function layoutVec(vec:Vector, vo:CardLayoutVO):void{
		var size:int= vec.size();
		var x:int= vo.startX;
		var y:int= vo.startY;
		for(var i:int= 0; i < size; i++)
		{
			var obj:DisplayObject= DisplayObject(vec.elementAt(i));

			var warpX:int= 0;
			var warpY:int= 0;
			var warp:int= i / vo.warpCount;
			if(warp > 0)
			{
				warpX = vo.warp.x() * warp;
				warpY = vo.warp.y() * warp;
			}

			var offX:int= 0;
			var offY:int= 0;
			var count:int= i % vo.warpCount;

			if(GameDir.UP.equals(vo.dir))
			{
				offY = -1* count * (obj.getHeight() + vo.gap);
			}
			else if(GameDir.LEFT.equals(vo.dir))
			{
				offX = -1* count * (obj.getWidth() + vo.gap);
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

	private function sortDeep():void{
		for(var i:int= 0; i < this.numChildren(); i++)
		{
			var obj:DisplayObject= this.getChildAt(i);
			var y:int= obj.getY();
			var j:int= 0;
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

	public function setLack(lack:int):void{
		_lack = lack;
		var vecLack:Vector= new Vector();
		var vecNoLack:Vector= new Vector();
		var vecInHand:Vector= Vector(_mjT.get(CardPlace.IN_HAND));

		for(var index:int= 0; index < vecInHand.size(); ++index)
		{
			var mj:Mahjong= Mahjong(vecInHand.elementAt(index));
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
		for(var index:int= 0; index < vecNoLack.size(); ++index)
		{
			vecInHand.addElement(vecNoLack.elementAt(index));
		}
		for(var index:int= 0; index < vecLack.size(); ++index)
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
	public function setInTurn(b:Boolean):void{
		_inTurn = b;
	}

	/**
	 * 设置选中的牌
	 * 
	 * @param place
	 * @param index
	 */
	public function setSelectCard(index:int):void{
		if(_selected == index)
		{
			return;
		}
		GameScene.cur.jiaoTip(null);
		var mj:Mahjong= getSelectedCard();
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
				var vo:ChuVO= _chuTip.get(mj.card());
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
	public function changeSelectCard(moveDir:String):void{
		var nowSelected:int= _selected;
		var inHandCount:int= cardCount(CardPlace.IN_HAND);
		inHandCount += cardCount(CardPlace.NEW_IN_HAND);

		if(-1== nowSelected)
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

	public function getSelectedCard():Mahjong{
		if(-1== _selected)
		{
			return null;
		}

		if(_selected < cardCount(CardPlace.IN_HAND))
		{
			return getCard(CardPlace.IN_HAND, _selected);
		}

		return getCard(CardPlace.NEW_IN_HAND, 0);
	}

	public function getCard(place:String, index:int):Mahjong{
		var vec:Vector= Vector(_mjT.get(place));
		if(index >= vec.size() || index < 0)
		{
			return null;
		}

		var mj:Mahjong= Mahjong(vec.elementAt(index));
		return mj;
	}

	public function clearJiaoTip():void{
		var vecInHand:Vector= Vector(_mjT.get(CardPlace.IN_HAND));
		for(var i:int= 0; i < vecInHand.size(); i++)
		{
			var mj:Mahjong= Mahjong(vecInHand.elementAt(i));
			mj.setBoard(MahjongBoardType.NONE);
		}

		var mj:Mahjong= getCard(CardPlace.NEW_IN_HAND, 0);
		if(mj != null)
		{
			mj.setBoard(MahjongBoardType.NONE);
		}
	}

	public function updateChuTip():void{
		var ch:ChuHelp= new ChuHelp();
		// 将手上的牌和刻字放入进行计算
		var ct:ChuTip= ch.check(getInHandCards(), getOnTableKes());
		if(ct != null)
		{
			System.out.println(ct.toString());
		}
		_chuTip = ct;
		if(null != ct)
		{
			var cards:Array= ct.getPlayCards();
			GDC.trace("出牌提示：" + ct.toString());
			// 给所有打出后可以下叫的手牌加上边框
			var vecInHand:Vector= Vector(_mjT.get(CardPlace.IN_HAND));
			for(var i:int= 0; i < vecInHand.size(); i++)
			{
				var mj:Mahjong= Mahjong(vecInHand.elementAt(i));
				for(var j:int= 0; j < cards.length; j++)
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
			var mj:Mahjong= getCard(CardPlace.NEW_IN_HAND, 0);
			if(mj != null)
			{
				for(var j:int= 0; j < cards.length; j++)
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
			var chuVO:ChuVO= ct.get(_selected);
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
		var inHandCount:int= cardCount(CardPlace.IN_HAND);
		var newCount:int= cardCount(CardPlace.NEW_IN_HAND);
		var inHandCards:Array= new int[inHandCount + newCount];
		var vecInHand:Vector= Vector(_mjT.get(CardPlace.IN_HAND));
		for(var i:int= 0; i < vecInHand.size(); i++)
		{
			var mj:Mahjong= Mahjong(vecInHand.elementAt(i));
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
		var kes:Array= new CardKe[cardCount(CardPlace.IN_HAND_TABLE)];
		var vec:Vector= Vector(_mjT.get(CardPlace.IN_HAND_TABLE));
		for(var i:int= 0; i < vec.size(); i++)
		{
			var cb:Combin= Combin(vec.elementAt(i));
			var keType:int= -1;
			var keType2:int= 0;

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
	public function changeCardsState(place:String, card:int, oldState:int, newState:int):void{
		var vec:Vector= Vector(_mjT.get(place));
		for(var i:int= 0; i < vec.size(); i++)
		{
			var mj:Mahjong= Mahjong(vec.elementAt(i));
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
	public function resetCardsState(place:String):void{
		var vec:Vector= Vector(_mjT.get(place));
		for(var i:int= 0; i < vec.size(); i++)
		{
			var mj:Mahjong= Mahjong(vec.elementAt(i));
			mj.setState(MahjongState.NORMAL);
		}
	}

}
}