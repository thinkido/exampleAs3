package jing.pai.vo
{
	public class ChuVO
	{	
		public function ChuVO(playCard:int = -1 , jiaoCount:int = -99999999 )
		{
			this.playCard = playCard;
			this.jiaos = jiaoCount == -99999999 ? null : new JiaoVO[jiaoCount]; ;		//new JiaoVO[jiaoCount];
		}
	
		/**
		 * 出的牌
		 */
		public var playCard:int= -1;
	
		/**
		 * 下的叫
		 */
		public var jiaos:Array= null;
	
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