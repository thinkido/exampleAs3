
package jing.pai.model;

/**
 * 刻
 * 
 * @author Jing
 */
public class CardKe
{
	/**
	 * 刻的类型
	 */
	public int type = 0;

	/**
	 * 如果是连字，则card为连字第一个，后面为card + 1, card + 2
	 */
	public int card = 0;

	public CardKe(int type, int card)
	{
		this.type = type;
		this.card = card;
	}
}
