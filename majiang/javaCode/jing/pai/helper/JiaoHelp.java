
package jing.pai.helper;

import jing.pai.model.CardVector;
import jing.pai.utils.CardUtil;

/**
 * ���������ҳ�ƥ��Ľ�
 * 
 * @param cards
 * @return
 */
public class JiaoHelp
{

	private CardVector _cards = null;

	private final int[] RIGHTFUL_COUNTS = {1, 4, 7, 10, 13};

	public JiaoHelp()
	{

	}

	public int[] getJiao(CardVector cards)
	{
		_cards = cards;
		CardVector jiaoCards = new CardVector();
		cards.sort();
		int count = cards.count();
		if(false == isRightfulCount(count))
		{
			return null;
		}

		for(int i = 0; i < count; i++)
		{
			CardVector temp = cards.clone();
			int card1 = temp.getAt(i);
			temp.removeAt(i);
			if(isQiDui(temp) || isRightfulCombination(temp))
			{
				addJiaoCard(jiaoCards, cards.getAt(i));
			}

			if(i < temp.count())
			{
				int card2 = temp.getAt(i);
				if((int)(card1 / 10) == (int)(card2 / 10))
				{
					// ��ͬһ�ֻ�ɫ����
					temp.removeAt(i);
					if(isRightfulCombination(temp))
					{
						if(card1 == card2 && false == jiaoCards.hasCard(card2))
						{
							// �Դ�
							addJiaoCard(jiaoCards, card1);
						}
						else if(card1 + 1 == card2)
						{
							if(card1 % 10 == 1)
							{
								// ����
								addJiaoCard(jiaoCards, card2 + 1);
							}
							else if(card2 % 10 == 9)
							{
								// ����
								addJiaoCard(jiaoCards, card1 - 1);
							}
							else
							{
								// ����
								addJiaoCard(jiaoCards, card1 - 1);
								addJiaoCard(jiaoCards, card2 + 1);
							}
						}
						else if(card1 + 2 == card2)
						{
							// ����
							addJiaoCard(jiaoCards, card1 + 1);
						}
					}
				}

			}
		}
		return jiaoCards.getCards();
	}

	private void addJiaoCard(CardVector cards, int jiaoCard)
	{
		if(false == cards.hasCard(jiaoCard) && _cards.hasCardCount(jiaoCard) < 4)
		{
			cards.add(jiaoCard);
		}
	}

	private boolean isQiDui(CardVector cards)
	{
		if(cards.count() != 12)
		{
			return false;
		}

		for(int i = 0; i < cards.count(); i += 2)
		{
			if(cards.getAt(i) != cards.getAt(i + 1))
			{
				return false;
			}
		}

		return true;
	}

	/**
	 * �Ƿ�Ϸ�������
	 * 
	 * @param count
	 * @return
	 */
	private boolean isRightfulCount(int count)
	{
		for(int i = 0; i < RIGHTFUL_COUNTS.length; i++)
		{
			if(RIGHTFUL_COUNTS[i] == count)
			{
				return true;
			}
		}
		return false;
	}

	/**
	 * ��Щ�����Ƿ����
	 * 
	 * @param cards
	 * @return
	 */
	private boolean isRightfulCombination(CardVector cards)
	{
		if(isIncludePair(cards.count()))
		{
			int count = cards.count();
			for(int i = 0; i < count - 1; i++)
			{
				int[] pair = getPair(cards, i);
				if(null != pair)
				{
					CardVector tempCard = cards.clone();
					tempCard.removeCards(pair);
					if(isAllKan(tempCard))
					{
						return true;
					}
				}
			}

		}
		else if(isAllKan(cards))
		{
			return true;
		}
		return false;
	}

	/**
	 * �Ƿ��ǿ�
	 * 
	 * @param cards
	 * @return
	 */
	private boolean isAllKan(CardVector cards)
	{
		cards = cards.clone();
		do
		{
			if(cards.count() == 0)
			{
				return true;
			}
			int[] kan = getKan(cards);
			if(null == kan)
			{
				return false;
			}

			cards.removeCards(kan);
		} while(cards.count() > 0);
		return true;
	}

	/**
	 * �Ƿ���ڽ���
	 * 
	 * @param count
	 * @return
	 */
	private boolean isIncludePair(int count)
	{
		final int[] CARDS = {2, 5, 8, 11};
		for(int i = 0; i < CARDS.length; i++)
		{
			if(CARDS[i] == count)
			{
				return true;
			}
		}
		return false;
	}

	/**
	 * ��ÿ�
	 * 
	 * @return
	 */
	private int[] getKan(CardVector cards)
	{
		int count = cards.count();
		if(count < 3)
		{
			return null;
		}

		for(int i = 0; i < count - 2; i++)
		{
			int card1 = cards.getAt(i);
			int card3 = cards.getAt(i + 2);

			if(card1 == card3)
			{
				// ��������һ���ģ���һ����
				int[] kan = {card1, card1, card1};
				return kan;
			}
			else if(true == CardUtil.typeShunEnable(card1) && cards.findCard(card1 + 1, i + 1) > -1 && cards.findCard(card1 + 2, i + 2) > -1)
			{
				// �ҵõ�˳��
				int[] kan = {card1, card1 + 1, card1 + 2};
				return kan;
			}
		}
		return null;
	}

	/**
	 * ���һ��
	 * 
	 * @param cards
	 * @return
	 */
	private int[] getPair(CardVector cards, int startIndex)
	{
		int count = cards.count();
		for(int i = startIndex; i < count - 1; i++)
		{
			int card1 = cards.getAt(i);
			int card2 = cards.getAt(i + 1);

			if(card1 == card2)
			{
				int[] kan = {card1, card2};
				return kan;
			}
		}
		return null;
	}
}
