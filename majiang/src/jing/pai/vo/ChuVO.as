package jing.pai.vo
{
	public class ChuVO
	{
		
		public function ChuVO()
		{
			
		}
		
		public function ChuVO_A(playCard:int, jiaoCount:int):void
		{
			this.playCard = playCard;
			this.jiaos = new Vector.<JiaoVO>;
		}
		
		/**
		 * ³öµÄÅÆ
		 */
		public var playCard:int= -1;
		
		/**
		 * ÏµĽÐ
		 */
		public var jiaos:Vector.<JiaoVO> = null;
		
		public function toString():String{
			if(null == this.jiaos || -1== this.playCard)
			{
				return "none";
			}
			
			var out:String= "PlayCard: " + this.playCard + "\n";
			
			for(var i:int= 0; i < jiaos.length; i++)
			{
				out += "Jiao: " + jiaos[i].toString() + "\n";
			}
			
			return out;
		}
		
	}
}