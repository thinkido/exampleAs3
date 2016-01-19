
package jing.pai.vo;

import jing.pai.consts.GBHuType;

public class HuVO
{

	/**
	 * ��������
	 */
	public int[] types = null;

	/**
	 * �����ܷ���
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
		return "[ ����: " + fan + " , ����: " + strTypes + " ]";
	}
}
