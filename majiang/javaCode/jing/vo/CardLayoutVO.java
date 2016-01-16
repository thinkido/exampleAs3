
package jing.vo;

import framework.geom.Point;

/**
 * 卡牌布局的VO
 * 
 * @author Jing
 */
public class CardLayoutVO
{

	/**
	 * 使用的牌组图片前缀
	 */
	public String cardPrefix = null;

	/**
	 * 起点X
	 */
	public int startX = 0;

	/**
	 * 起点Y
	 */
	public int startY = 0;

	/**
	 * 方向
	 */
	public String dir = null;

	/**
	 * 牌与牌之间的间隔
	 */
	public int gap = 0;

	/**
	 * 组中麻将之间的间隔
	 */
	public int combinGap = 0;
	
	/**
	 * 组合中的杠，上面那个的Y轴偏移
	 */
	public int combinGangOffY = 0;

	/**
	 * 换行的牌数阈值
	 */
	public int warpCount = 999;

	/**
	 * 换行后的偏移坐标量
	 */
	public Point warp = null;
}
