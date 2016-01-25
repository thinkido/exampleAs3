
package jing.pai.utils;

import jing.pai.consts.KeType;
import jing.pai.model.CardKe;
import jing.pai.model.CardVector;

import java.util.Vector;

/**
 * 牌组解析器
 * 
 * @author Jing
 */
public class CardsParser
{

	private CardVector _cards;

	public CardVector cards()
	{
		return _cards;
	}

	private Vector _kes;

	public Vector kes()
	{
		return _kes;
	}

	private int _pairCard = 0;

	public int pairCard()
	{
		return _pairCard;
	}

	public CardsParser()
	{

	}

	/**
	 * 解析牌组
	 * 
	 * @param cards
	 */
	public void parse(CardVector cards)
	{
		_cards = cards;

		if(cards.count() < 2)
		{
			return;
		}
		else if(cards.count() == 2)
		{
			if(cards.getAt(0) == cards.getAt(1))
			{
				_kes = new Vector();
				_pairCard = cards.getAt(0);
				return;
			}
		}

		CardVector pairTested = new CardVector();
		int endIndex = cards.count() - 1;
		for(int i = 0; i < endIndex; i++)
		{
			int card1 = cards.getAt(i);
			int card2 = cards.getAt(i + 1);

			if(false == pairTested.hasCard(card1) && card1 == card2)
			{				
				pairTested.add(card1);
				int pairCard = card1;
				CardVector withoutPairCards = cards.clone();
				withoutPairCards.removeAt(i + 1);
				withoutPairCards.removeAt(i);
				Vector kes = getAllKe(withoutPairCards);

				if(kes != null)
				{
					_kes = kes;
					_pairCard = pairCard;
					return;
				}
			}
		}
	}

	private Vector getAllKe(CardVector cards)
	{
		if(cards.count() < 3)
		{
			return null;
		}

		Vector kes = null;

		int endIndex = cards.count() - 2;
		for(int i = 0; i < endIndex; i++)
		{
			kes = new Vector();

			CardKe ke = getKe(cards, i);

			CardVector temp = cards.clone();
			do
			{
				if(null == ke)
				{
					break;
				}

				kes.addElement(ke);

				if(KeType.PENG == ke.type)
				{
					temp.removeCard(ke.id);
					temp.removeCard(ke.id);
					temp.removeCard(ke.id);
				}
				else if(KeType.CHI == ke.type)
				{
					temp.removeCard(ke.id);
					temp.removeCard(ke.id + 1);
					temp.removeCard(ke.id + 2);
				}

				ke = getKe(temp, 0);
			} while(temp.count() > 0);

			if(temp.count() == 0)
			{
				// 所有的刻抽取完毕
				return kes;
			}
		}

		return null;
	}

	/**
	 * 获得坎
	 * 
	 * @return
	 */
	static public CardKe getKe(CardVector cards, int startIndex)
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
				// 三张牌是一样的，是一个坎
				return new CardKe(KeType.PENG, card1, 0);
			}
			else if(cards.findCard(card1 + 1, i + 1) > -1 && cards.findCard(card1 + 2, i + 2) > -1)
			{
				// 找得到顺子
				return new CardKe(KeType.CHI, card1, 0);
			}
		}
		return null;
	}
}
