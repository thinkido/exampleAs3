package jing.game.view
{
	import com.as3game.spritesheet.SpriteSheet;
	
	import framework.resources.Res;
	
	import game.model.Global;
	
	import jing.consts.CardPlace;
	import jing.consts.GameDir;
	import jing.consts.MahjongBoardType;
	import jing.consts.MahjongState;
	
	import managers.ResManager;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
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
		 * 麻将的状态״̬
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
		private var _mj:Image= null;
	
		/**
		 * 效果图
		 */
		private var _effect:Image= null;
	
		/**
		 * 边框的图(例如打出后可以下叫，那么就有特别的边框)
		 */
		private var _board:Image= null;
	
		public function Mahjong(card:int, dir:String, place:String)
		{
			_cards = ResManager.getFile("mahjong_json" ,Res.TYPE_SHEET );
			_mj = new Image(null);
			_effect = new Image(null);
			_board = new Image(null);
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
				_effect.texture = null;
			}
			else if(_state == MahjongState.SELECTED)
			{
				_effect.texture = ResManager.getFile("in_hand_card_effect_png" ,Res.TYPE_TEXTURE );
				_effect.x = 0;
				_effect.y = 0;
			}
			else if(_state == MahjongState.GLOW)
			{
				_effect.texture = ResManager.getFile("on_table_card_effect_png" ,Res.TYPE_TEXTURE );
				_effect.x = 0;
				_effect.y = 0;
			}
			else if(_state == MahjongState.DISABLE)
			{
				_effect.texture = null;
			}
			else if(_state == MahjongState.LAST_CHU)
			{
				_effect.texture = ResManager.getFile("last_chu_png" ,Res.TYPE_TEXTURE );
				_effect.x = -4;
				_effect.y = -41;
			}
		}
	
		public function setBack(isBack:Boolean):void{
			_isBack = isBack;
			refresh();
		}
	
		private function getTexture():Texture{
			var cardPrefix:String= Global.cl.getLayout(_dir, _place).cardPrefix;
			var tName:String= null;
			if((_place == CardPlace.IN_HAND || _place == CardPlace.NEW_IN_HAND) && _dir != GameDir.DOWN)
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
				trace("不存在的麻将：" + tName);
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
				_board.texture = ResManager.getFile("for_jiao_png" ,Res.TYPE_TEXTURE );
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