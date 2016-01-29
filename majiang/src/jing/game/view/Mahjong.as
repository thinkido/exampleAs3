package jing.game.view
{
import framework.resources.Res;
import framework.resources.SpriteSheet;

import jing.GDC;
import jing.consts.CardPlace;
import jing.consts.GameDir;
import jing.consts.MahjongBoardType;
import jing.consts.MahjongState;

import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;

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
	private var _mj:Image= null;

	/**
	 * Ч¹ûͼ
	 */
	private var _effect:Image= null;

	/**
	 * ±߿òµÄͼ(ÀýÈç´ò³öºó¿ÉÒÔÏ½У¬ÄÇô¾ÍÓÐÌرðµı߿ò)
	 */
	private var _board:Image= null;

	public function Mahjong(card:int, dir:String, place:String)
	{
		_cards = Res.actively.getSheet("mahjong_json");
		_mj = new Image(null);
		_effect = new Image(null);
		_board = new Image(null);
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
//			_effect.setTexture(null);
			_effect.texture = null;
		}
		else if(_state == MahjongState.SELECTED)
		{
			_effect.texture = Res.actively.getTexture("in_hand_card_effect_png");
//			_effect.setPosition(0, 0);
			_effect.x = 0;
			_effect.y = 0;
		}
		else if(_state == MahjongState.GLOW)
		{
			_effect.texture = Res.actively.getTexture("on_table_card_effect_png");
//			_effect.setPosition(0, 0);
			
		}
		else if(_state == MahjongState.DISABLE)
		{
			_effect.texture = null;
		}
		else if(_state == MahjongState.LAST_CHU)
		{
			_effect.texture = Res.actively.getTexture("last_chu_png");
//			_effect.setPosition(-4, -41);
			_effect.x = -4;
			_effect.y = -41;
		}
	}

	public function setBack(isBack:Boolean):void{
		_isBack = isBack;
		refresh();
	}

	private function getTexture():Texture{
		var cardPrefix:String= GDC.cl.getLayout(_dir, _place).cardPrefix;
		var tName:String= null;
		if((_place == CardPlace.IN_HAND || _place == CardPlace.NEW_IN_HAND) && _dir != GameDir.DOWN)
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
			trace("²»´æÔڵÄÂ齫£º" + tName);
		}
		return cardT;
	}

	private function refresh():void{
		_mj.texture = getTexture();
		this.width = _mj.width;
		this.height =_mj.height;
	}

	public function setBoard(type:int):void{
		if(MahjongBoardType.NONE == type)
		{
			_board.texture = null;
		}
		else if(MahjongBoardType.FOR_JIAO == type)
		{
			_board.texture = Res.actively.getTexture("for_jiao_png");
		}
	}

	public function getW():int{
		return _mj.width;
	}

	public function getH():int{
		return _mj.height;
	}

}
}