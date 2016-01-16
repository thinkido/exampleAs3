
package jing.game.vo;

import java.util.Vector;

public class GameEndVO
{

	/**
	 * 结果 0：流局 1：赢 2：输
	 */
	public int state = 0;

	/**
	 * 分数的总计改变
	 */
	public int totalScoreChange = 0;

	/**
	 * 底分
	 */
	public int basescore = 0;

	/**
	 * 玩家手上的牌
	 */
	public int[] cards = null;

	public Vector huTypeVec = new Vector();

}
