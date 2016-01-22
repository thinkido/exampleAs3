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
 * Â齫ÏÔʾ¶ÔÏó
 * 
 * @author Jing
 */
public class Mahjong extends Sprite
{

	private var _card:int= 0;

	/**
	 * ¿¨ÅÆ
	 */
	public function card():int{
		return _card;
	}

	private var _state:int= 0;

	/**
	 * Â齫µÄ״̬
	 */
	public function state():int{
		return _state;
	}

	/**
	 * ÅÆÊǷñ¸Ç×ŵÄ
	 */
	private var _isBack:Boolean= false;

	/**
	 * Â齫ËùÊôµÄÍæ¼ҷ½λ
	 */
	private var _dir:String= null;

	public function dir():String{
		return _dir;
	}

	/**
	 * Â齫ËùÔڵÄλÖÃ
	 */
	private var _place:String= null;

	public function place():String{
		return _place;
	}

	/**
	 * ÅÆ
	 */
	private var _cards:SpriteSheet= null;

	/**
	 * Â齫ͼ
	 */
	private var _mj:Bitmap= null;

	/**
	 * Ч¹ûͼ
	 */
	private var _effect:Bitmap= null;

	/**
	 * ±߿òµÄͼ(ÀýÈç´ò³öºó¿ÉÒÔÏ½У¬ÄÇô¾ÍÓÐÌرðµı߿ò)
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
	 * ¸ı俨ÅÆ
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
			// ±ðÈ˵ÄÊÖÅÆ
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
			System.out.println("²»´æÔڵÄÂ齫£º" + tName);
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