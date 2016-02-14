package jing.pai.vo
{
	import jing.pai.consts.GBHuType;
	
	public class HuVO
	{
		/**
		 * 胡的牌型
		 */
		public var types:Array= null;
		public var len:int;
	
		public function HuVO() {
			types = [] ; // [] ;
		}
		/**
		 * 胡的总番数
		 */
		public var all_fan:int= 0;
		
		public function add_result(type:int, fan:int):void{
			if (len >= 100 ) { // types.length) {
				trace("add_result "+len);
			} else {
				types[len] = type;
				len++;
				this.all_fan += fan;
			}
		}
	
		public function toString():String{
			var strTypes:String= "";
			for(var i:int= 0; i < types.length; i++)
			{
				var type:int= types[i];
				var typeDesc:String= " { " + type + " : " + GBHuType.HU_TXT[type] + " }";
				strTypes += typeDesc;
			}
			return "[ 番数: " + all_fan + " , 类型: " + strTypes + " ]";
		}
	}
}