
package jing.pai.model;

/**
 * ��
 * 
 * @author Jing
 */
public class CardKe
{
	/**
	 * �̵�����
	 */
	public int type = 0;

	/**
	 * ��������֣���cardΪ���ֵ�һ��������Ϊcard + 1, card + 2
	 */
	public int card = 0;

	public CardKe(int type, int card)
	{
		this.type = type;
		this.card = card;
	}
}
