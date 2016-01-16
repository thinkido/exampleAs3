
package jing.pai.vo;

import jing.pai.consts.HuType;

public class HuVO
{

	/**
	 * ºúµÄÅÆÐÍ
	 */
	public int type1 = 0;

	public String toString()
	{
		return "[ " + type1 + " : " + HuType.HU_DESC[type1] + " ]";
	}
}
