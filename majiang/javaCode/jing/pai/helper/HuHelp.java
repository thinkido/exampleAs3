
package jing.pai.helper;

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
	private int _gangCount = 0;

	/**
	 * 手上的牌
	 */
	private CardVector _cards = null;

	/**
	 * 解析器
	 */
	private CardsParser _parser = null;

	/**
	 * 刻子
	 */
	private CardKe[] _keList = null;

	public HuHelp()
	{

	}

	public HuVO getHu(CardVector inHands, CardKe[] onTables, int huCard)
	{
		return null;
	}

	public HuVO getHu(CardVector cards, CardKe[] keList)
	{
		_cards = cards;
		if(null == keList)
		{
			keList = new CardKe[0];
		}
		_keList = keList;

		pretreatment();

		HuVO hu = new HuVO();
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

	private void pretreatment()
	{
		_cards.sort();

		int endIdx = _cards.count() - 4;
		for(int i = 0; i < endIdx; i++)
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
	private boolean isHu()
	{
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
	private boolean isDuiDuiHu()
	{
		for(int i = 0; i < _keList.length; i++)
		{
			CardKe ke = _keList[i];
			if(ke.type == KeType.CHI)
			{
				return false;
			}
		}

		for(int i = 0; i < _parser.kes().size(); i++)
		{
			CardKe ke = (CardKe)(_parser.kes().elementAt(i));
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
	private boolean isQingYiSe()
	{
		int flag = _cards.getAt(0) / 10;
		for(int i = 1; i < _cards.count(); i++)
		{
			int temp = _cards.getAt(i) / 10;
			if(flag != temp)
			{
				return false;
			}
		}

		for(int i = 0; i < _keList.length; i++)
		{
			CardKe ke = _keList[i];
			int temp = ke.card / 10;
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
	private boolean isQiDui()
	{
		if(_keList.length > 0)
		{
			return false;
		}

		CardVector cards = _cards.clone();
		do
		{
			int card = cards.getAt(0);
			cards.removeCard(card);
			if(-1 == cards.removeCard(card))
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
	private boolean isJiangDui()
	{
		for(int i = 0; i < _cards.count(); i++)
		{
			int temp = _cards.getAt(i) % 10;
			if(temp != 2 || temp != 5 || temp != 8)
			{
				return false;
			}
		}

		for(int i = 0; i < _keList.length; i++)
		{
			CardKe ke = _keList[i];
			if(ke.type == KeType.CHI)
			{
				return false;
			}

			int temp = ke.card % 10;
			if(temp != 2 || temp != 5 || temp != 8)
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
	private boolean isDaiYao()
	{
		for(int i = 0; i < _keList.length; i++)
		{
			CardKe ke = _keList[i];
			int temp = ke.card % 10;
			if(ke.type == KeType.CHI && temp != 1 && temp != 7)
			{
				return false;
			}

			if((ke.type == KeType.GANG || ke.type == KeType.PENG) && temp != 1 && temp != 9)
			{
				return false;
			}
		}

		int[] cardCount = new int[10];
		CardVector cards = _cards.clone();
		for(int i = 0; i < cards.count(); i++)
		{
			int card = cards.getAt(i);
			int flag = card % 10;
			if(flag == 4 || flag == 5 || flag == 6)
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
