package jing.game.vo
{
import java.util.Vector;

public class GameEndVO
{

	/**
	 * 结果 0：流局 1：赢 2：输
	 */
	public var state:int= 0;

	/**
	 * 分数的总计改变
	 */
	public var totalScoreChange:int= 0;

	/**
	 * 底分
	 */
	public var basescore:int= 0;

	/**
	 * 玩家手上的牌
	 */
	public var cards:Array= null;

	public var huTypeVec:Vector= new Vector();

}
}