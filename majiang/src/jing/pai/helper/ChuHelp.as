package jing.pai.helper
{
import jing.pai.ChuTip;
import jing.pai.model.CardKe;
import jing.pai.model.CardVector;
import jing.pai.vo.ChuVO;
import jing.pai.vo.HuVO;
import jing.pai.vo.JiaoVO;

import java.util.Vector;

/**
 * ³öÅưïÖú
 * 
 * @author Jing
 */
public class ChuHelp
{
	public function check(cards:Array, kes:Array):ChuTip{
		var tip:ChuTip= new ChuTip();
		// ·ֱðȥµôһÕÅÅƣ¬Ȼºó¼ÆËãʣÏµÄÅÆÊǷñ×é³ɽÐ
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

			// ½«Õâ¸öÁÙʱÅÆÐÍÓÃÀ´¼ì²éÊǷñÓнÐ
			var jiaoCards:Array= new JiaoHelp().getJiao(tempCards);
			if(jiaoCards != null && jiaoCards.length > 0)
			{
				var chuVO:ChuVO= new ChuVO(playCard, jiaoCards.length);
				tip.put(playCard, chuVO);
				// ÓнÐ,Ëã³ö¸÷ÖֽеÄÇé¿öÏ¶ÔӦµĺúµÄÅÆÐÍ
				for(var i:int= 0; i < jiaoCards.length; i++)
				{
					var jiaoCard:int= jiaoCards[i];
					var temp:CardVector= tempCards.clone();
					//temp.add(jiaoCard);
					//HuVO hu = new HuVO(); 
					var hu:HuVO=new HuHelp().getHu(temp, kes, jiaoCard);

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
	 * ½«³öÅƺó½еÄÅƽøÐÐһ´ÎÅÅÐò
	 * 
	 * @param vo
	 */
	private function sortJiaos(vo:ChuVO):void{
		var vec:Vector= new Vector();
		for(var i:int= 0; i < vo.jiaos.length; i++)
		{
			var temp:JiaoVO= vo.jiaos[i];
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

		for(var i:int= 0; i < vec.size(); i++)
		{
			var temp:JiaoVO= JiaoVO(vec.elementAt(i));
			vo.jiaos[i] = temp;
		}
	}
}
}