package jing.game.view
{
	import game.model.Global;
	
	import jing.consts.CombinType;
	import jing.consts.GameDir;
	import jing.vo.CardLayoutVO;
	
	import starling.display.Sprite;
	
	/**
	 * ×éºÏÅƣ¬ÀýÈçÍæ¼Ҵò³öµÄÅ򡢳ԡ¢¸ܡ¢°µ¸Ü
	 * 
	 * @author Jing
	 */
	public class Combin extends Sprite
	{
		
		private var _type:int= 0;
		
		public function type():int{
			return _type;
		}
		
		/**
		 * Èç¹ûÊǳÔ_card±íʾ˳×ӵĵÚһÕÅÅÆ
		 */
		private var _card:int= 0;
		
		public function card():int{
			return _card;
		}
		
		private var _dir:String= null;
		
		private var _place:String= null;
		
		private var _mjs:Array= null;
		
		public function Combin(type:int, card:int, dir:String, place:String)
		{
			changeCombin(type, card, dir, place);
		}
		
		public function changeCombin(type:int, card:int, dir:String, place:String):void{
			_type = type;
			_card = card;
			_dir = dir;
			_place = place;
			refresh();
		}
		
		public function removeAllChildren():void
		{
			var num:int = this.numChildren;
			while(num-- > 0)
			{
				this.removeChildAt(0);
			}
		}
		
		private function refresh():void{
			this.removeAllChildren();
			var vo:CardLayoutVO= Global.cl.getLayout(_dir, _place);
			var _mjsLen:int = 0 ;
			switch(_type)
			{
				case CombinType.AN_GANG:
				case CombinType.GANG:
					_mjs = [] ; // new Mahjong[4];
					_mjsLen = 4 ;
					break;
				case CombinType.CHI_LEFT:
				case CombinType.CHI_MIDDLE:
				case CombinType.CHI_RIGHT:
				case CombinType.PENG:
					_mjs = [] ; // new Mahjong[3];
					_mjsLen = 3 ;
					break;
			}
			
			
			var offX:int= 0;
			var w:int= 0;
			var h:int= 0;
			for(var i:int= 0; i < _mjsLen ; i++)
			{
				var card:int= _card;
				if(_type == CombinType.CHI_LEFT || _type == CombinType.CHI_MIDDLE || _type == CombinType.CHI_RIGHT)
				{
					// Èç¹ûÊǳԣ¬_card±íʾ˳×ӵĵÚһ¸öÅÆ
					card = _card + i;
				}
				var mj:Mahjong= new Mahjong(card, _dir, _place);
				
//				mj.setPosition(offX, 0);
				mj.x = offX;
				mj.y = 0;
				
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
				_mjs[3].x = _mjs[1].x ;
				_mjs[3].y = _mjs[1].y + vo.combinGangOffY ;
			}
			
			if(_type == CombinType.AN_GANG && _dir == GameDir.DOWN)
			{
				_mjs[3].setBack(false);
			}
			
			w = _mjs[0].getW() * 3;
			h = _mjs[0].getH();
			this.width = w;
			this.height = h;
		}
	}
}