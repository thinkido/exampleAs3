package jing.pai
{
	import jing.pai.vo.ChuVO;
	
	/**
	 * 出牌提示数据
	 * 
	 * @author Jing
	 */
	public class ChuTip
	{
	
		private var _t:Object= null;
	
		public function ChuTip()
		{
			_t = new Object();
		}
	
		public function put(card:int, vo:ChuVO):void{
			var cardStr:String = card.toString();
			_t[cardStr] = vo;
		}
	
		public function get(card:int):ChuVO{
			var cardStr:String= card.toString();
			var obj:Object= _t[cardStr];
			if(null != obj)
			{
				var chuVO:ChuVO= ChuVO(obj);
				if(chuVO.jiaos != null && chuVO.jiaos.length > 0)
				{
					return chuVO;
				}
			}
			return null;
		}
	
		/**
		 * 得到所有可以打出后有叫的牌的数组
		 * 
		 * @return
		 */
		public function getPlayCards():Array
		{
			var cards:Array= [];
			var i:int= 0;
			for each(var item:String in _t)
			{
				cards[i++] = int(item);
			}
			
			/*for(var enumobj:Enumeration= _t.keys(); enumobj.hasMoreElements();)
			{
				var str:String= String(enumobj.nextElement());
				var integer:Integer= Integer.valueOf(str);
				cards[i++] = integer.intValue();
			}*/
			return cards;
		}
	
		public function contains(card:int):Boolean{
			var cardStr:String= card.toString();
			if( _t[cardStr] != undefined )
			{
				return true;
			}
			return false;
		}
	
		public function toString():String{
			var out:String= "\n";
			for each (var item:ChuVO in _t)
			{
				out += item.toString() + '\n';
			}
			
			/*for(var enumobj:Enumeration= _t.elements(); enumobj.hasMoreElements();)
			{
				var object:ChuVO= ChuVO(enumobj.nextElement());
				out += object.toString() + "\n";
			}*/
			return out;
		}
	}
}