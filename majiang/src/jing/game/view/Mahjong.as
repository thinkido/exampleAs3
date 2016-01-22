package jing.game.view
{
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
 * 麻将显示对象
 * 
 * @author Jing
 */
public class Mahjong extends Sprite
{

	private var _card:int= 0;

	/**
	 * 卡牌
	 */
	public function card():int{
		return _card;
	}

	private var _state:int= 0;

	/**
	 * 麻将的状态
	 */
	public function state():int{
		return _state;
	}

	/**
	 * 牌是否盖着的
	 */
	private var _isBack:Boolean= false;

	/**
	 * 麻将所属的玩家方位
	 */
	private var _dir:String= null;

	public function dir():String{
		return _dir;
	}

	/**
	 * 麻将所在的位置
	 */
	private var _place:String= null;

	public function place():String{
		return _place;
	}

	/**
	 * 牌
	 */
	private var _cards:SpriteSheet= null;

	/**
	 * 麻将图
	 */
	private var _mj:Bitmap= null;

	/**
	 * 效果图
	 */
	private var _effect:Bitmap= null;

	/**
	 * 边框的图(例如打出后可以下叫，那么就有特别的边框)
	 */
	private var _board:Bitmap= null;

	public function Mahjong(card:int, dir:String, place:String)
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
	 * 改变卡牌
	 * 
	 * @param card
	 * @param dir
	 * @param place
	 */
	public function changeCard(card:int, dir:String, place:String):void{
		_card = card;
		_dir = dir;
		_place = place;
		refresh();
	}

	public function setState(state:int):void{
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

	public function setBack(isBack:Boolean):void{
		_isBack = isBack;
		refresh();
	}

	private function getTexture():Texture{
		var cardPrefix:String= GDC.cl.getLayout(_dir, _place).cardPrefix;
		var tName:String= null;
		if((_place.equals(CardPlace.IN_HAND) || _place.equals(CardPlace.NEW_IN_HAND)) && _dir != GameDir.DOWN)
		{
			// 别人的手牌
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

		var cardT:Texture= this._cards.getTexture(tName);
		if(null == cardT)
		{
			System.out.println("不存在的麻将：" + tName);
		}
		return cardT;
	}

	private function refresh():void{
		_mj.setTexture(getTexture());
		this.setWidth(_mj.getWidth());
		this.setHeight(_mj.getHeight());
	}

	public function setBoard(type:int):void{
		if(MahjongBoardType.NONE == type)
		{
			_board.setTexture(null);
		}
		else if(MahjongBoardType.FOR_JIAO == type)
		{
			_board.setTexture(Res.actively.getTexture("for_jiao_png"));
		}
	}

	public function getW():int{
		return _mj.getWidth();
	}

	public function getH():int{
		return _mj.getHeight();
	}

}
}