
package jing.pai.helper;

import jing.pai.ChuTip;
import jing.pai.model.CardKe;
import jing.pai.model.CardVector;
import jing.pai.vo.ChuVO;
import jing.pai.vo.HuVO;
import jing.pai.vo.JiaoVO;

import java.util.Vector;

/**
 * ���ư���
 * 
 * @author Jing
 */
public class ChuHelp
{
	public ChuTip check(int[] cards, CardKe[] kes)
	{
		ChuTip tip = new ChuTip();
		// �ֱ�ȥ��һ���ƣ�Ȼ�����ʣ�µ����Ƿ���ɽ�
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

			// �������ʱ������������Ƿ��н�
			int[] jiaoCards = new JiaoHelp().getJiao(tempCards);
			if(jiaoCards != null && jiaoCards.length > 0)
			{
				ChuVO chuVO = new ChuVO(playCard, jiaoCards.length);
				tip.put(playCard, chuVO);
				// �н�,������ֽе�����¶�Ӧ�ĺ�������
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
	 * �����ƺ�е��ƽ���һ������
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
