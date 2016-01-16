
package jing.pai.utils;

public class CardUtil
{

	private CardUtil()
	{

	}

	/**
	 * 获取卡牌类型
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
	 * 是否是同样类型
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
	 * 是否是万
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
	 * 是否是筒
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
	 * 是否是条
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
	 * 是否是字
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
	 * 是否是花
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
	 * 牌型能否被吃、是否能组成顺子
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
