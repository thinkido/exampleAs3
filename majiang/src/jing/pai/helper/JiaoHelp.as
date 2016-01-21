package jing.pai.helper
{
import jing.pai.model.CardVector;
import jing.pai.utils.CardUtil;

/**
 * ¸ù¾ÝÅÆÐÍÕҳöƥÅäµĽÐ
 * 
 * @param cards
 * @return
 */
public class JiaoHelp
{

	private var _cards:CardVector= null;

	private const RIGHTFUL_COUNTS:Array= {1, 4, 7, 10, 13};

	public function JiaoHelp()
	{

	}

	public int[] getJiao(var cards:CardVector)
	{
		_cards = cards;
		var jiaoCards:CardVector= new CardVector();
		cards.sort();
		var count:int= cards.count();
		if(false == isRightfulCount(count))
		{
			return null;
		}

		for(var i:int= 0; i < count; i++)
		{
			var temp:CardVector= cards.clone();
			var card1:int= temp.getAt(i);
			temp.removeAt(i);
			if(isQiDui(temp) || isRightfulCombination(temp))
			{
				addJiaoCard(jiaoCards, cards.getAt(i));
			}

			if(i < temp.count())
			{
				var card2:int= temp.getAt(i);
				if(int((card1 / 10) )== int((card2 / 10)))
				{
					// ÊÇͬһÖֻ¨ɫµÄÅÆ
					temp.removeAt(i);
					if(isRightfulCombination(temp))
					{
						if(card1 == card2 && false == jiaoCards.hasCard(card2))
						{
							// ¶Դ¦
							addJiaoCard(jiaoCards, card1);
						}
						else if(card1 + 1== card2)
						{
							if(card1 % 10== 1)
							{
								// ±ßÕÅ
								addJiaoCard(jiaoCards, card2 + 1);
							}
							else if(card2 % 10== 9)
							{
								// ±ßÕÅ
								addJiaoCard(jiaoCards, card1 - 1);
							}
							else
							{
								// ±ßÕÅ
								addJiaoCard(jiaoCards, card1 - 1);
								addJiaoCard(jiaoCards, card2 + 1);
							}
						}
						else if(card1 + 2== card2)
						{
							// ¿¨ÕÅ
							addJiaoCard(jiaoCards, card1 + 1);
						}
					}
				}

			}
		}
		return jiaoCards.getCards();
	}

	private function addJiaoCard(cards:CardVector, jiaoCard:int):void{
		if(false == cards.hasCard(jiaoCard) && _cards.hasCardCount(jiaoCard) < 4)
		{
			cards.add(jiaoCard);
		}
	}

	private function isQiDui(cards:CardVector):Boolean{
		if(cards.count() != 12)
		{
			return false;
		}

		for(var i:int= 0; i < cards.count(); i += 2)
		{
			if(cards.getAt(i) != cards.getAt(i + 1))
			{
				return false;
			}
		}

		return true;
	}

	/**
	 * ÊǷñºϷ¨µÄÅÆÊý
	 * 
	 * @param count
	 * @return
	 */
	private function isRightfulCount(count:int):Boolean{
		for(var i:int= 0; i < RIGHTFUL_COUNTS.length; i++)
		{
			if(RIGHTFUL_COUNTS[i] == count)
			{
				return true;
			}
		}
		return false;
	}

	/**
	 * ÕâЩÅÆÐÍÊǷñºÏÀí
	 * 
	 * @param cards
	 * @return
	 */
	private function isRightfulCombination(cards:CardVector):Boolean{
		if(isIncludePair(cards.count()))
		{
			var count:int= cards.count();
			for(var i:int= 0; i < count - 1; i++)
			{
				var pair:Array= getPair(cards, i);
				if(null != pair)
				{
					var tempCard:CardVector= cards.clone();
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
	 * ÊǷñ¶¼Êǿ²
	 * 
	 * @param cards
	 * @return
	 */
	private function isAllKan(cards:CardVector):Boolean{
		cards = cards.clone();
		do
		{
			if(cards.count() == 0)
			{
				return true;
			}
			var kan:Array= getKan(cards);
			if(null == kan)
			{
				return false;
			}

			cards.removeCards(kan);
		} while(cards.count() > 0);
		return true;
	}

	/**
	 * ÊǷñ´æÔڽ«ÅÆ
	 * 
	 * @param count
	 * @return
	 */
	private function isIncludePair(count:int):Boolean{
		const CARDS:Array= {2, 5, 8, 11};
		for(var i:int= 0; i < CARDS.length; i++)
		{
			if(CARDS[i] == count)
			{
				return true;
			}
		}
		return false;
	}

	/**
	 * »ñµÿ²
	 * 
	 * @return
	 */
	private int[] getKan(var cards:CardVector)
	{
		var count:int= cards.count();
		if(count < 3)
		{
			return null;
		}

		for(var i:int= 0; i < count - 2; i++)
		{
			var card1:int= cards.getAt(i);
			var card3:int= cards.getAt(i + 2);

			if(card1 == card3)
			{
				// ÈýÕÅÅÆÊÇһÑùµģ¬ÊÇһ¸ö¿²
				var kan:Array= {card1, card1, card1};
				return kan;
			}
			else if(true == CardUtil.typeShunEnable(card1) && cards.findCard(card1 + 1, i + 1) > -1&& cards.findCard(card1 + 2, i + 2) > -1)
			{
				// Õҵõ½˳×Ó
				var kan:Array= {card1, card1 + 1, card1 + 2};
				return kan;
			}
		}
		return null;
	}

	/**
	 * »ñµÃһ¶Ô
	 * 
	 * @param cards
	 * @return
	 */
	private int[] getPair(var cards:CardVector, var startIndex:int)
	{
		var count:int= cards.count();
		for(var i:int= startIndex; i < count - 1; i++)
		{
			var card1:int= cards.getAt(i);
			var card2:int= cards.getAt(i + 1);

			if(card1 == card2)
			{
				var kan:Array= {card1, card2};
				return kan;
			}
		}
		return null;
	}
}
}