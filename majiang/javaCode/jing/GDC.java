
package jing;

import jing.configs.CardLayout;

/**
 * 游戏数据中心
 * 
 * @author Jing
 */
public class GDC
{

	/**
	 * 游戏牌局布局
	 */
	public static CardLayout cl = null;

	static public void trace(String str)
	{
		boolean enable = false;
		if(enable)
		{
			System.out.println(str);
		}
	}

}
