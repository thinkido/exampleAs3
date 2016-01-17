
package jing.pai.vo;

import jing.pai.consts.GBHuType;

public class HuVO
{

	/**
	 * 胡的牌型
	 */
	public int[] types = null;

	/**
	 * 胡的总番数
	 */
	public int fan = 0;

	public String toString()
	{
		String strTypes = "";
		for(int i = 0; i < types.length; i++)
		{
			int type = types[i];
			String typeDesc = " { " + type + " : " + GBHuType.HU_TXT[type] + " }";
			strTypes += typeDesc;
		}
		return "[ 番数: " + fan + " , 类型: " + strTypes + " ]";
	}
}
