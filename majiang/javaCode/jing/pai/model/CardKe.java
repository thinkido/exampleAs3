
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
	 * �̵�����2
	 */
	public int type2 = 0;

	/**
	 * ��������֣���cardΪ���ֵ�һ��������Ϊcard + 1, card + 2
	 */
	public int card = 0;

	public CardKe(int type, int card, int type2)
	{
		this.type = type;
		this.card = card;
		this.type2 = type2;
	}
}
