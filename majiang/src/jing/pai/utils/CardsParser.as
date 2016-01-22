package jing.pai.utils
{
import jing.pai.consts.KeType;
import jing.pai.model.CardKe;
import jing.pai.model.CardVector;

import java.util.Vector;

/**
 * ÅÆ×é½âÎöÆ÷
 * 
 * @author Jing
 */
public class CardsParser
{

	private var _cards:CardVector;

	public function cards():CardVector{
		return _cards;
	}

	private var _kes:Vector;

	public function kes():Vector{
		return _kes;
	}

	private var _pairCard:int= 0;

	public function pairCard():int{
		return _pairCard;
	}

	public function CardsParser()
	{

	}

	/**
	 * ½âÎöÅÆ×é
	 * 
	 * @param cards
	 */
	public function parse(cards:CardVector):void{
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

		var pairTested:CardVector= new CardVector();
		var endIndex:int= cards.count() - 1;
		for(var i:int= 0; i < endIndex; i++)
		{
			var card1:int= cards.getAt(i);
			var card2:int= cards.getAt(i + 1);

			if(false == pairTested.hasCard(card1) && card1 == card2)
			{				
				pairTested.add(card1);
				var pairCard:int= card1;
				var withoutPairCards:CardVector= cards.clone();
				withoutPairCards.removeAt(i + 1);
				withoutPairCards.removeAt(i);
				var kes:Vector= getAllKe(withoutPairCards);

				if(kes != null)
				{
					_kes = kes;
					_pairCard = pairCard;
					return;
				}
			}
		}
	}

	private function getAllKe(cards:CardVector):Vector{
		if(cards.count() < 3)
		{
			return null;
		}

		var kes:Vector= null;

		var endIndex:int= cards.count() - 2;
		for(var i:int= 0; i < endIndex; i++)
		{
			kes = new Vector();

			var ke:CardKe= getKe(cards, i);

			var temp:CardVector= cards.clone();
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
				// ËùÓеĿ̳éȡÍê±Ï
				return kes;
			}
		}

		return null;
	}

	/**
	 * »ñµÿ²
	 * 
	 * @return
	 */
	static public function getKe(cards:CardVector, startIndex:int):CardKe{
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
				return new CardKe(KeType.PENG, card1, 0);
			}
			else if(cards.findCard(card1 + 1, i + 1) > -1&& cards.findCard(card1 + 2, i + 2) > -1)
			{
				// Õҵõ½˳×Ó
				return new CardKe(KeType.CHI, card1, 0);
			}
		}
		return null;
	}
}
}