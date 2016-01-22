package jing.pai.vo
{
public class JiaoVO
{
	
	public function JiaoVO(jiaoCard:int, hu:HuVO)
	{
		this.jiaoCard = jiaoCard;
		this.hu = hu;
	}

	/**
	 * 叫的牌
	 */
	public var jiaoCard:int= -1;

	/**
	 * 胡的牌型
	 */
	public var hu:HuVO= null;
	
	public function toString():String{
		if(hu == null)
		{
			return "none hu";
		}
		var out:String= "JiaoCard [" + this.jiaoCard + "] " + "Hu " + hu.toString();		
		return out;
	}
}
}