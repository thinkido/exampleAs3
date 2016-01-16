
package jing.pai.model;

import java.util.Vector;

/**
 * �ƶ���
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
	 * ��β������һ����
	 * 
	 * @param card
	 */
	public void add(int card)
	{
		_vec.addElement(toInteger(card));
	}

	/**
	 * ��β������һ����
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
	 * ��ָ��λ�ü���һ����
	 * 
	 * @param card
	 * @param index
	 */
	public void addAt(int card, int index)
	{
		_vec.insertElementAt(toInteger(card), index);
	}

	/**
	 * �Ƴ�һ��ָ��λ�õ���
	 * 
	 * @param index
	 */
	public void removeAt(int index)
	{
		_vec.removeElementAt(index);
	}

	/**
	 * �õ�ָ��λ�õ���
	 * 
	 * @param index
	 * @return
	 */
	public int getAt(int index)
	{
		return toInt((Integer)_vec.elementAt(index));
	}

	/**
	 * �Ƴ�һ�ſ���
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
	 * �Ƴ�������
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
	 * �õ����п��Ƶ�����
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
	 * �Ƿ���ָ������
	 * 
	 * @param card
	 * @return
	 */
	public boolean hasCard(int card)
	{
		return _vec.contains(toInteger(card));
	}

	/**
	 * ָ�����Ƶĳ�����
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
	 * ��ָ����������������ʼѰ�ҿ���
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
	 * ���Ƶ�����
	 * 
	 * @return
	 */
	public int count()
	{
		return _vec.size();
	}

	/**
	 * ���ƽ���һ������,��������������1��9��1��9Ͳ��1��9��
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
	 * ����
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
