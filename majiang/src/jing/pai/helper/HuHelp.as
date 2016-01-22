package jing.pai.helper
{
import jing.pai.consts.KeType;
import jing.pai.model.CardKe;
import jing.pai.model.CardVector;
import jing.pai.utils.CardsParser;
import jing.pai.vo.HuVO;

/**
 * 根据牌型算出胡牌 BUG: 1.将对有错误，应该是对对胡为基础
 * 
 * @param cards
 */
public class HuHelp
{

	/**
	 * 杠数量(手上)
	 */
	private var _gangCount:int= 0;

	/**
	 * 手上的牌
	 */
	private var _cards:CardVector= null;

	/**
	 * 解析器
	 */
	private var _parser:CardsParser= null;

	/**
	 * 刻子
	 */
	private var _keList:Array= null;

	public function HuHelp()
	{

	}

	public function getHu(inHands:CardVector, onTables:Array, huCard:int):HuVO{
		return null;
	}

	public function getHu(cards:CardVector, keList:Array):HuVO{
		_cards = cards;
		if(null == keList)
		{
			keList = new CardKe[0];
		}
		_keList = keList;

		pretreatment();

		var hu:HuVO= new HuVO();
		/*
		 * if(true == isQiDui()) { // 七对是特殊牌型 if(true == isQingYiSe()) {
		 * if(_gangCount > 0) { hu.type1 = HuType.QING_LONG_QI_DUI; } else {
		 * hu.type1 = HuType.QING_QI_DUI; } } else if(_gangCount > 0) { hu.type1
		 * = HuType.LONG_QI_DUI; } else { hu.type1 = HuType.AN_QI_DUI; } } else
		 * if(true == isHu()) { if(true == isQingYiSe()) { if(true ==
		 * isDuiDuiHu()) { hu.type1 = HuType.QING_DUI; } else if(true ==
		 * isDaiYao()) { hu.type1 = HuType.QING_DAI_YAO; } else { hu.type1 =
		 * HuType.QING_YI_SE; } } else if(true == isJiangDui()) { hu.type1 =
		 * HuType.JIANG_DUI; } else if(true == isDaiYao()) { hu.type1 =
		 * HuType.DAI_YAO; } else if(true == isDuiDuiHu()) { hu.type1 =
		 * HuType.DUI_DUI_HU; } else { hu.type1 = HuType.PING_HU; } }
		 */
		return hu;
	}

	private function pretreatment():void{
		_cards.sort();

		var endIdx:int= _cards.count() - 4;
		for(var i:int= 0; i < endIdx; i++)
		{
			if(_cards.getAt(i) == _cards.getAt(i + 3))
			{
				_gangCount++;
			}
		}
		_parser = new CardsParser();
		_parser.parse(_cards);
	}

	/**
	 * 是否胡牌
	 * 
	 * @return
	 */
	private function isHu():Boolean{
		if(_parser.kes() == null)
		{
			return false;
		}
		return true;
	}

	/**
	 * 是否对对胡
	 * 
	 * @return
	 */
	private function isDuiDuiHu():Boolean{
		for(var i:int= 0; i < _keList.length; i++)
		{
			var ke:CardKe= _keList[i];
			if(ke.type == KeType.CHI)
			{
				return false;
			}
		}

		for(var i:int= 0; i < _parser.kes().size(); i++)
		{
			var ke:CardKe= CardKe((_parser.kes().elementAt(i)));
			if(ke.type == KeType.CHI)
			{
				return false;
			}
		}

		return true;
	}

	/**
	 * 是否是清一色
	 * 
	 * @return
	 */
	private function isQingYiSe():Boolean{
		var flag:int= _cards.getAt(0) / 10;
		for(var i:int= 1; i < _cards.count(); i++)
		{
			var temp:int= _cards.getAt(i) / 10;
			if(flag != temp)
			{
				return false;
			}
		}

		for(var i:int= 0; i < _keList.length; i++)
		{
			var ke:CardKe= _keList[i];
			var temp:int= ke.card / 10;
			if(flag != temp)
			{
				return false;
			}
		}

		return true;
	}

	/**
	 * 是否是七对
	 * 
	 * @return
	 */
	private function isQiDui():Boolean{
		if(_keList.length > 0)
		{
			return false;
		}

		var cards:CardVector= _cards.clone();
		do
		{
			var card:int= cards.getAt(0);
			cards.removeCard(card);
			if(-1== cards.removeCard(card))
			{
				return false;
			}
		} while(cards.count() != 0);
		return true;
	}

	/**
	 * 是否是将对，只有2、5、8
	 * 
	 * @return
	 */
	private function isJiangDui():Boolean{
		for(var i:int= 0; i < _cards.count(); i++)
		{
			var temp:int= _cards.getAt(i) % 10;
			if(temp != 2|| temp != 5|| temp != 8)
			{
				return false;
			}
		}

		for(var i:int= 0; i < _keList.length; i++)
		{
			var ke:CardKe= _keList[i];
			if(ke.type == KeType.CHI)
			{
				return false;
			}

			var temp:int= ke.card % 10;
			if(temp != 2|| temp != 5|| temp != 8)
			{
				return false;
			}
		}

		return true;
	}

	/**
	 * 是否带幺
	 * 
	 * @return
	 */
	private function isDaiYao():Boolean{
		for(var i:int= 0; i < _keList.length; i++)
		{
			var ke:CardKe= _keList[i];
			var temp:int= ke.card % 10;
			if(ke.type == KeType.CHI && temp != 1&& temp != 7)
			{
				return false;
			}

			if((ke.type == KeType.GANG || ke.type == KeType.PENG) && temp != 1&& temp != 9)
			{
				return false;
			}
		}

		var cardCount:Array= new int[10];
		var cards:CardVector= _cards.clone();
		for(var i:int= 0; i < cards.count(); i++)
		{
			var card:int= cards.getAt(i);
			var flag:int= card % 10;
			if(flag == 4|| flag == 5|| flag == 6)
			{
				return false;
			}

			cardCount[flag]++;
		}

		if(cardCount[3] > cardCount[1] || cardCount[2] != cardCount[3])
		{
			return false;
		}

		if(cardCount[8] > cardCount[9] || cardCount[7] != cardCount[8])
		{
			return false;
		}

		return true;
	}
}
}