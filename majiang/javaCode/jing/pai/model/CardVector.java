
package jing.pai.model;

import java.util.Vector;

/**
 * 牌队列
 * 
 * @author Jing
 */
public class CardVector
{

	private Vector _vec = null;

	public CardVector()
	{
		_vec = new Vector();
	}

	public CardVector(int[] cards)
	{
		_vec = new Vector(cards.length);
		for(int i = 0; i < cards.length; i++)
		{
			add(cards[i]);
		}
	}

	/**
	 * 在尾部加入一张牌
	 * 
	 * @param card
	 */
	public void add(int card)
	{
		_vec.addElement(toInteger(card));
	}

	/**
	 * 在尾部加入一堆牌
	 * 
	 * @param cards
	 */
	public void add(int[] cards)
	{
		for(int i = 0; i < cards.length; i++)
		{
			_vec.addElement(toInteger(cards[i]));
		}
	}

	/**
	 * 在指定位置加入一张牌
	 * 
	 * @param card
	 * @param index
	 */
	public void addAt(int card, int index)
	{
		_vec.insertElementAt(toInteger(card), index);
	}

	/**
	 * 移除一张指定位置的牌
	 * 
	 * @param index
	 */
	public void removeAt(int index)
	{
		_vec.removeElementAt(index);
	}

	/**
	 * 得到指定位置的牌
	 * 
	 * @param index
	 * @return
	 */
	public int getAt(int index)
	{
		return toInt((Integer)_vec.elementAt(index));
	}

	/**
	 * 移除一张卡牌
	 * 
	 * @param card
	 */
	public int removeCard(int card)
	{
		int count = this.count();
		for(int i = 0; i < count; i++)
		{
			if(card == getAt(i))
			{
				removeAt(i);
				return i;
			}
		}
		return -1;
	}

	/**
	 * 移除卡牌组
	 * 
	 * @param cards
	 */
	public void removeCards(int[] cards)
	{
		for(int i = 0; i < cards.length; i++)
		{
			removeCard(cards[i]);
		}
	}

	/**
	 * 得到所有卡牌的数组
	 * 
	 * @return
	 */
	public int[] getCards()
	{
		int[] cards = new int[_vec.size()];
		for(int i = 0; i < cards.length; i++)
		{
			cards[i] = getAt(i);
		}
		return cards;
	}

	/**
	 * 是否有指定的牌
	 * 
	 * @param card
	 * @return
	 */
	public boolean hasCard(int card)
	{
		return _vec.contains(toInteger(card));
	}

	/**
	 * 指定卡牌的持有数
	 * 
	 * @param card
	 * @return
	 */
	public int hasCardCount(int card)
	{
		int count = 0;
		for(int i = 0; i < count(); i++)
		{
			if(card == getAt(i))
			{
				count++;
			}
		}
		return count;
	}

	/**
	 * 从指定索引（包含）开始寻找卡牌
	 * 
	 * @param card
	 * @param startIndex
	 * @return
	 */
	public int findCard(int card, int startIndex)
	{
		int count = this.count();
		for(int i = startIndex; i < count; i++)
		{
			if(card == getAt(i))
			{
				return i;
			}
		}
		return -1;
	}

	/**
	 * 卡牌的数量
	 * 
	 * @return
	 */
	public int count()
	{
		return _vec.size();
	}

	/**
	 * 对牌进行一次排序,从左至右依次是1到9万，1到9筒，1到9条
	 */
	public void sort()
	{
		int size = count();
		CardVector newVec = new CardVector();
		for(int i = 0; i < size; i++)
		{
			int card = getAt(i);
			int j = 0;
			for(j = 0; j < newVec.count(); j++)
			{
				int tempCard = newVec.getAt(j);
				if(card < tempCard)
				{
					break;
				}
			}
			newVec.addAt(card, j);
		}

		_vec = newVec._vec;
	}

	/**
	 * 复制
	 * 
	 * @return
	 */
	public CardVector clone()
	{
		return new CardVector(this.getCards());
	}

	private Integer toInteger(int card)
	{
		return new Integer(card);
	}

	private int toInt(Integer obj)
	{
		return obj.intValue();
	}

	public String toString()
	{
		String str = "";
		for(int i = 0; i < count(); i++)
		{
			str += _vec.elementAt(i).toString() + ",";
		}
		return str;
	}
}
