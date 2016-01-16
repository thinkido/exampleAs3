
package jing.pai.utils;

public class CardUtil
{

	private CardUtil()
	{

	}

	/**
	 * ��ȡ��������
	 * 
	 * @param card
	 * @return
	 */
	static public int getCardType(int card)
	{
		int type = card / 10;
		return type;
	}

	/**
	 * �Ƿ���ͬ������
	 * 
	 * @param card1
	 * @param card2
	 * @return
	 */
	static public boolean isSameType(int card1, int card2)
	{
		int type1 = getCardType(card1);
		int type2 = getCardType(card2);
		if(type1 == type2)
		{
			return true;
		}
		return false;
	}

	/**
	 * �Ƿ�����
	 * 
	 * @param card
	 * @return
	 */
	static public boolean isWan(int card)
	{
		int type = getCardType(card);
		if(1 == type)
		{
			return true;
		}
		return false;
	}

	/**
	 * �Ƿ���Ͳ
	 * 
	 * @param card
	 * @return
	 */
	static public boolean isTong(int card)
	{
		int type = getCardType(card);
		if(2 == type)
		{
			return true;
		}
		return false;
	}

	/**
	 * �Ƿ�����
	 * 
	 * @param card
	 * @return
	 */
	static public boolean isTiao(int card)
	{
		int type = getCardType(card);
		if(3 == type)
		{
			return true;
		}
		return false;
	}

	/**
	 * �Ƿ�����
	 * 
	 * @param card
	 * @return
	 */
	static public boolean isZi(int card)
	{
		int type = getCardType(card);
		if(4 == type)
		{
			return true;
		}
		return false;
	}

	/**
	 * �Ƿ��ǻ�
	 * 
	 * @param card
	 * @return
	 */
	static public boolean isHua(int card)
	{
		int type = getCardType(card);
		if(5 == type)
		{
			return true;
		}
		return false;
	}

	/**
	 * �����ܷ񱻳ԡ��Ƿ������˳��
	 * 
	 * @param card
	 * @return
	 */
	static public boolean typeShunEnable(int card)
	{
		int type = getCardType(card);
		if(1 == type || 2 == type || 3 == type)
		{
			return true;
		}
		return false;
	}
}
