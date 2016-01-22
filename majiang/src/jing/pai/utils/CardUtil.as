package jing.pai.utils
{
public class CardUtil
{

	private function CardUtil()
	{

	}

	/**
	 * 获取卡牌类型
	 * 
	 * @param card
	 * @return
	 */
	static public function getCardType(card:int):int{
		var type:int= card / 10;
		return type;
	}

	/**
	 * 是否是同样类型
	 * 
	 * @param card1
	 * @param card2
	 * @return
	 */
	static public function isSameType(card1:int, card2:int):Boolean{
		var type1:int= getCardType(card1);
		var type2:int= getCardType(card2);
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
	static public function isWan(card:int):Boolean{
		var type:int= getCardType(card);
		if(1== type)
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
	static public function isTong(card:int):Boolean{
		var type:int= getCardType(card);
		if(2== type)
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
	static public function isTiao(card:int):Boolean{
		var type:int= getCardType(card);
		if(3== type)
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
	static public function isZi(card:int):Boolean{
		var type:int= getCardType(card);
		if(4== type)
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
	static public function isHua(card:int):Boolean{
		var type:int= getCardType(card);
		if(5== type)
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
	static public function typeShunEnable(card:int):Boolean{
		var type:int= getCardType(card);
		if(1== type || 2== type || 3== type)
		{
			return true;
		}
		return false;
	}
}
}