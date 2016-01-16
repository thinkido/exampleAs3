
package jing.pai;

import jing.pai.vo.ChuVO;

import java.util.Enumeration;
import java.util.Hashtable;

/**
 * 出牌提示数据
 * 
 * @author Jing
 */
public class ChuTip
{

	private Hashtable _t = null;

	public ChuTip()
	{
		_t = new Hashtable();
	}

	public void put(int card, ChuVO vo)
	{
		String cardStr = String.valueOf(card);
		_t.put(cardStr, vo);
	}

	public ChuVO get(int card)
	{
		String cardStr = String.valueOf(card);
		Object obj = _t.get(cardStr);
		if(null != obj)
		{
			ChuVO chuVO = (ChuVO)obj;
			if(chuVO.jiaos != null && chuVO.jiaos.length > 0)
			{
				return chuVO;
			}
		}
		return null;
	}

	/**
	 * 得到所有可以打出后有叫的牌的数组
	 * 
	 * @return
	 */
	public int[] getPlayCards()
	{
		int[] cards = new int[_t.size()];
		int i = 0;
		for(Enumeration enumobj = _t.keys(); enumobj.hasMoreElements();)
		{
			String str = (String)enumobj.nextElement();
			Integer integer = Integer.valueOf(str);
			cards[i++] = integer.intValue();
		}
		return cards;
	}

	public boolean contains(int card)
	{
		String cardStr = String.valueOf(card);
		if(_t.containsKey(cardStr))
		{
			return true;
		}
		return false;
	}

	public String toString()
	{
		String out = "\n";
		for(Enumeration enumobj = _t.elements(); enumobj.hasMoreElements();)
		{
			ChuVO object = (ChuVO)enumobj.nextElement();
			out += object.toString() + "\n";
		}
		return out;
	}
}
