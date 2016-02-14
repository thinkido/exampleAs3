package jing.pai.helper
{

import jing.pai.ChuTip;
import jing.pai.model.CardKe;
import jing.pai.model.CardVector;
import jing.pai.vo.ChuVO;
import jing.pai.vo.HuVO;
import jing.pai.vo.JiaoVO;

/**
 * 出牌帮助
 * 
 * @author Jing
 */
public class ChuHelp
{
	public function check(cards:Vector.<int>, kes:Vector.<CardKe>):ChuTip{
		var tip:ChuTip= new ChuTip();
		
		// 分别去掉一张牌，然后计算剩下的牌是否组成叫
		for(var playCardIndex:int= 0; playCardIndex < cards.length; playCardIndex++)
		{
			var playCard:int= cards[playCardIndex];
			if(tip.contains(playCard))
			{
				continue;
			}
			
			var tempCards:CardVector= new CardVector();
			for(var i:int= 0; i < cards.length; i++)
			{
				if(i != playCardIndex)
				{
					tempCards.add(cards[i]);
				}
			}

			// 将这个临时牌型用来检查是否有叫
			var jiaoCards:Array= new JiaoHelp().getJiao(tempCards);
			if(jiaoCards != null && jiaoCards.length > 0)
			{
				
				var chuVO:ChuVO= new ChuVO(playCard, jiaoCards.length);
				tip[playCard] = chuVO;
				// 有叫,算出各种叫的情况下对应的胡的牌型
				for(i = 0; i < jiaoCards.length; i++)
				{
					var jiaoCard:int= jiaoCards[i];
					var temp:CardVector= tempCards.clone();
					//temp.add(jiaoCard);
					//HuVO hu = new HuVO(); 

					var hu:HuVO= null;
					//hu = new HuHelp().getHu(temp, kes, jiaoCard);

					chuVO.jiaos[i] = new JiaoVO(jiaoCard, hu);
				}
				
				sortJiaos(chuVO);
			}
			else
			{
				// tip[playCard] = new ChuVO();
			}
		}

		return tip;
	}

	/**
	 * 将出牌后叫的牌进行一次排序
	 * 
	 * @param vo
	 */
	private function sortJiaos(vo:ChuVO):void{
		var vec:Vector= new Vector();
		var temp:JiaoVO;
		for(var i:int= 0; i < vo.jiaos.length; i++)
		{
			temp = vo.jiaos[i];
			var j:int= 0;
			for(j = 0; j < vec.size(); j++)
			{
				var a:JiaoVO= JiaoVO(vec.elementAt(j));
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

		for(i = 0; i < vec.size(); i++)
		{
			temp = JiaoVO(vec.elementAt(i));
			vo.jiaos[i] = temp;
		}
	}
}
}