
package jing.pai.helper;

import jing.pai.ChuTip;
import jing.pai.model.CardKe;
import jing.pai.model.CardVector;
import jing.pai.vo.ChuVO;
import jing.pai.vo.HuVO;
import jing.pai.vo.JiaoVO;

import java.util.Vector;

/**
 * 出牌帮助
 * 
 * @author Jing
 */
public class ChuHelp
{
	public ChuTip check(int[] cards, CardKe[] kes)
	{
		ChuTip tip = new ChuTip();
		// 分别去掉一张牌，然后计算剩下的牌是否组成叫
		for(int playCardIndex = 0; playCardIndex < cards.length; playCardIndex++)
		{
			int playCard = cards[playCardIndex];
			if(tip.contains(playCard))
			{
				continue;
			}

			CardVector tempCards = new CardVector();
			for(int i = 0; i < cards.length; i++)
			{
				if(i != playCardIndex)
				{
					tempCards.add(cards[i]);
				}
			}

			// 将这个临时牌型用来检查是否有叫
			int[] jiaoCards = new JiaoHelp().getJiao(tempCards);
			if(jiaoCards != null && jiaoCards.length > 0)
			{
				ChuVO chuVO = new ChuVO(playCard, jiaoCards.length);
				tip.put(playCard, chuVO);
				// 有叫,算出各种叫的情况下对应的胡的牌型
				for(int i = 0; i < jiaoCards.length; i++)
				{
					int jiaoCard = jiaoCards[i];
					CardVector temp = tempCards.clone();
					temp.add(jiaoCard);
					//HuVO hu = new HuVO(); 
					HuVO hu =new HuHelp().getHu(temp, kes);

					chuVO.jiaos[i] = new JiaoVO(jiaoCard, hu);
				}
				sortJiaos(chuVO);
			}
			else
			{
				// tip.put(playCard, new ChuVO());
			}
		}

		return tip;
	}

	/**
	 * 将出牌后叫的牌进行一次排序
	 * 
	 * @param vo
	 */
	private void sortJiaos(ChuVO vo)
	{
		Vector vec = new Vector();
		for(int i = 0; i < vo.jiaos.length; i++)
		{
			JiaoVO temp = vo.jiaos[i];
			int j = 0;
			for(j = 0; j < vec.size(); j++)
			{
				JiaoVO a = (JiaoVO)vec.elementAt(j);
				if(temp.jiaoCard < a.jiaoCard)
				{
					break;
				}
			}
			if(j >= vec.size())
			{
				vec.addElement(temp);
			}
			else
			{
				vec.insertElementAt(temp, j);				
			}
		}

		for(int i = 0; i < vec.size(); i++)
		{
			JiaoVO temp = (JiaoVO)vec.elementAt(i);
			vo.jiaos[i] = temp;
		}
	}
}
