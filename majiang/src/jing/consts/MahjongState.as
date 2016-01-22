package jing.consts
{
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
	static public const NORMAL:int= 0;

	/**
	 * 选中
	 */
	static public const SELECTED:int= 1;

	/**
	 * 发光 碰、杠提示 选中的牌在桌面上的提示
	 */
	static public const GLOW:int= 2;

	/**
	 * 禁止交互状态
	 */
	static public const DISABLE:int= 4;
	
	/**
	 * 最后出的一张牌
	 */
	static public const LAST_CHU:int= 5;
}
}