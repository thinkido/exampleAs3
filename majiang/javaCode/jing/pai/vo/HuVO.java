
package jing.pai.vo;

import jing.pai.consts.GBHuType;

public class HuVO
{

	/**
	 * 胡的牌型
	 */
	public int[] types = null;
	public int len;

	public HuVO() {
		types = new int[100];
	}
	/**
	 * 胡的总番数
	 */
	public int all_fan = 0;
	
	public void add_result(int type, int fan) {
		if (len >= types.length) {
			System.out.println("add_result "+len);
		} else {
			types[len] = type;
			len++;
			this.all_fan += fan;
		}
	}

	public String toString()
	{
		String strTypes = "";
		for(int i = 0; i < types.length; i++)
		{
			int type = types[i];
			String typeDesc = " { " + type + " : " + GBHuType.HU_TXT[type] + " }";
			strTypes += typeDesc;
		}
		return "[ 番数: " + all_fan + " , 类型: " + strTypes + " ]";
	}
}
