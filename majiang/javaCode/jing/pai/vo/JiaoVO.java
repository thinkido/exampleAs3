
package jing.pai.vo;

public class JiaoVO
{
	
	public JiaoVO(int jiaoCard, HuVO hu)
	{
		this.jiaoCard = jiaoCard;
		this.hu = hu;
	}

	/**
	 * ½ÐµÄÅÆ
	 */
	public int jiaoCard = -1;

	/**
	 * ºúµÄÅÆÐÍ
	 */
	public HuVO hu = null;
	
	public String toString()
	{
		String out = "JiaoCard [" + this.jiaoCard + "] " + "Hu " + hu.toString();		
		return out;
	}
}
