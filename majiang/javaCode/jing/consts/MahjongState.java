
package jing.consts;

/**
 * 麻将的状态
 * 
 * @author Jing
 */
public class MahjongState
{

	/**
	 * 普通
	 */
	static public final int NORMAL = 0;

	/**
	 * 选中
	 */
	static public final int SELECTED = 1;

	/**
	 * 发光 碰、杠提示 选中的牌在桌面上的提示
	 */
	static public final int GLOW = 2;

	/**
	 * 禁止交互状态
	 */
	static public final int DISABLE = 4;
	
	/**
	 * 最后出的一张牌
	 */
	static public final int LAST_CHU = 5;
}
