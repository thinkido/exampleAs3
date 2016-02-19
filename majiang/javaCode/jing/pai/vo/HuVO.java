
package jing.pai.vo;

import java.util.Hashtable;

import jing.pai.consts.GBHuType;

public class HuVO
{

	/**
	 * 胡的牌型
	 */
	public int[] types = null;
	public int[] fans = null;
	public int len;

	public HuVO() {
		types = new int[20];
		fans = new int[20];
	}
	/**
	 * 胡的总番数
	 */
	public int all_fan = 0;
	
	public void sortByFan() {
		for (int i = 0; i < types.length - 1 && types[i] != 0 ; i++) {
			for (int j = i + 1; j < types.length && types[j] != 0 ; j++) {
				if (types[i] < types[j]) {
					int tmp = types[i];
					types[i] = types[j];
					types[j] = tmp;
					
					int tmp2 = fans[i];
					fans[i] = fans[j];
					fans[j] = tmp2;
				}
			}
		}
	}
	
	public void filt() {
		int[] newTypes = new int[20];
		int m = 0;
		all_fan = 0;
		
		for (int i = 0; i < types.length && types[i] != 0 ; i++) {
			int found = 0;
			for (int j = 0; j < i; j++) {
				for (int k = 1; k <= 5; k++) {
					Hashtable huTypeFilter = GBHuType.getHuTypeFilterMap();
					if ((new Integer(types[i])).equals(huTypeFilter.get(new Integer(types[j] + k * 1000)))) {
						found = 1;
						break;
					}
				}
				if (found != 0) break;
			}
			if (found == 0) {
				newTypes[m] = types[i];
				m++;
				all_fan += fans[i];
			}
		}
		fans=null;
		types = newTypes;
		len = m;
	}
	
	public void add_result(int type, int fan) {
		if (len >= types.length) {
			System.out.println("failed to add_result "+len);
		} else {
			types[len] = type;
			fans[len] = fan;
			len++;
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
