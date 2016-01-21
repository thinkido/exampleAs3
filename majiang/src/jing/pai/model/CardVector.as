package jing.pai.model
{
import java.util.Vector;

/**
 * ÅƶÓÁÐ
 * 
 * @author Jing
 */
public class CardVector
{

	private var _vec:Vector= null;

	public function CardVector()
	{
		_vec = new Vector();
	}

	public function CardVector(cards:Array)
	{
		_vec = new Vector(cards.length);
		for(var i:int= 0; i < cards.length; i++)
		{
			add(cards[i]);
		}
	}

	/**
	 * ÔÚβ²¿¼ÓÈëһÕÅÅÆ
	 * 
	 * @param card
	 */
	public function add(card:int):void{
		_vec.addElement(toInteger(card));
	}

	/**
	 * ÔÚβ²¿¼ÓÈëһ¶ÑÅÆ
	 * 
	 * @param cards
	 */
	public function add(cards:Array):void{
		for(var i:int= 0; i < cards.length; i++)
		{
			_vec.addElement(toInteger(cards[i]));
		}
	}

	/**
	 * ÔÚָ¶¨λÖüÓÈëһÕÅÅÆ
	 * 
	 * @param card
	 * @param index
	 */
	public function addAt(card:int, index:int):void{
		_vec.insertElementAt(toInteger(card), index);
	}

	/**
	 * ÒƳýһÕÅָ¶¨λÖõÄÅÆ
	 * 
	 * @param index
	 */
	public function removeAt(index:int):void{
		_vec.removeElementAt(index);
	}

	/**
	 * µõ½ָ¶¨λÖõÄÅÆ
	 * 
	 * @param index
	 * @return
	 */
	public function getAt(index:int):int{
		return toInt(Integer(_vec.elementAt(index)));
	}

	/**
	 * ÒƳýһÕſ¨ÅÆ
	 * 
	 * @param card
	 */
	public function removeCard(card:int):int{
		var count:int= this.count();
		for(var i:int= 0; i < count; i++)
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
	 * ÒƳý¿¨ÅÆ×é
	 * 
	 * @param cards
	 */
	public function removeCards(cards:Array):void{
		for(var i:int= 0; i < cards.length; i++)
		{
			removeCard(cards[i]);
		}
	}

	/**
	 * µõ½ËùÓп¨ÅƵÄÊý×é
	 * 
	 * @return
	 */
	public int[] getCards()
	{
		var cards:Array= new int[_vec.size()];
		for(var i:int= 0; i < cards.length; i++)
		{
			cards[i] = getAt(i);
		}
		return cards;
	}

	/**
	 * ÊǷñÓÐָ¶¨µÄÅÆ
	 * 
	 * @param card
	 * @return
	 */
	public function hasCard(card:int):Boolean{
		return _vec.contains(toInteger(card));
	}

	/**
	 * ָ¶¨¿¨ÅƵĳÖÓÐÊý
	 * 
	 * @param card
	 * @return
	 */
	public function hasCardCount(card:int):int{
		var count:int= 0;
		for(var i:int= 0; i < count(); i++)
		{
			if(card == getAt(i))
			{
				count++;
			}
		}
		return count;
	}

	/**
	 * ´Óָ¶¨Ë÷Ò񣨰𺬣©¿ªʼѰÕҿ¨ÅÆ
	 * 
	 * @param card
	 * @param startIndex
	 * @return
	 */
	public function findCard(card:int, startIndex:int):int{
		var count:int= this.count();
		for(var i:int= startIndex; i < count; i++)
		{
			if(card == getAt(i))
			{
				return i;
			}
		}
		return -1;
	}

	/**
	 * ¿¨ÅƵÄÊýÁ¿
	 * 
	 * @return
	 */
	public function count():int{
		return _vec.size();
	}

	/**
	 * ¶ÔÅƽøÐÐһ´ÎÅÅÐò,´Ó×óÖÁÓÒÒÀ´ÎÊÇ1µ½9Íò£¬1µ½9Ͳ£¬1µ½9Ìõ
	 */
	public function sort():void{
		var size:int= count();
		var newVec:CardVector= new CardVector();
		for(var i:int= 0; i < size; i++)
		{
			var card:int= getAt(i);
			var j:int= 0;
			for(j = 0; j < newVec.count(); j++)
			{
				var tempCard:int= newVec.getAt(j);
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
	 * ¸´ÖÆ
	 * 
	 * @return
	 */
	public function clone():CardVector{
		return new CardVector(this.getCards());
	}

	private function toInteger(card:int):Integer{
		return new Integer(card);
	}

	private function toInt(obj:Integer):int{
		return obj.intValue();
	}

	public function toString():String{
		var str:String= "";
		for(var i:int= 0; i < count(); i++)
		{
			str += _vec.elementAt(i).toString() + ",";
		}
		return str;
	}
}
}