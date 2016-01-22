package jing.pai
{
import jing.pai.vo.ChuVO;

import java.util.Enumeration;
import java.util.Hashtable;

/**
 * ³öÅÆÌáʾÊý¾Ý
 * 
 * @author Jing
 */
public class ChuTip
{

	private var _t:Hashtable= null;

	public function ChuTip()
	{
		_t = new Hashtable();
	}

	public function put(card:int, vo:ChuVO):void{
		var cardStr:String= String.valueOf(card);
		_t.put(cardStr, vo);
	}

	public function get(card:int):ChuVO{
		var cardStr:String= String.valueOf(card);
		var obj:Object= _t.get(cardStr);
		if(null != obj)
		{
			var chuVO:ChuVO= ChuVO(obj);
			if(chuVO.jiaos != null && chuVO.jiaos.length > 0)
			{
				return chuVO;
			}
		}
		return null;
	}

	/**
	 * µõ½ËùÓпÉÒԴò³öºóÓнеÄÅƵÄÊý×é
	 * 
	 * @return
	 */
	public int[] getPlayCards()
	{
		var cards:Array= new int[_t.size()];
		var i:int= 0;
		for(var enumobj:Enumeration= _t.keys(); enumobj.hasMoreElements();)
		{
			var str:String= String(enumobj.nextElement());
			var integer:Integer= Integer.valueOf(str);
			cards[i++] = integer.intValue();
		}
		return cards;
	}

	public function contains(card:int):Boolean{
		var cardStr:String= String.valueOf(card);
		if(_t.containsKey(cardStr))
		{
			return true;
		}
		return false;
	}

	public function toString():String{
		var out:String= "\n";
		for(var enumobj:Enumeration= _t.elements(); enumobj.hasMoreElements();)
		{
			var object:ChuVO= ChuVO(enumobj.nextElement());
			out += object.toString() + "\n";
		}
		return out;
	}
}
}