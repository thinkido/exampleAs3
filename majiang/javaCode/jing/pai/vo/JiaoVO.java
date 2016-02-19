
package jing.pai.vo;

public class JiaoVO
{
	
	public JiaoVO(int jiaoCard, HuVO hu)
	{
		this.jiaoCard = jiaoCard;
		this.hu = hu;
	}

	/**
	 * 叫的牌
	 */
	public int jiaoCard = -1;

	/**
	 * 胡的牌型
	 */
	public HuVO hu = null;
	
	public String toString()
	{
		String out = "JiaoCard [" + this.jiaoCard + "] ";
		if(hu == null)
		{
			out += "none hu";
		}
		else
		{
			out += "Hu " + hu.toString();
		}	
		return out;
	}
}
