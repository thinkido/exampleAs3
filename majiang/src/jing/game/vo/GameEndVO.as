package jing.game.vo
{
import java.util.Vector;

public class GameEndVO
{

	/**
	 * ½á¹û 0£ºÁ÷¾Ö 1£ºӮ 2£ºÊä
	 */
	public var state:int= 0;

	/**
	 * ·ÖÊýµÄ×ܼƸıä
	 */
	public var totalScoreChange:int= 0;

	/**
	 * µ׷Ö
	 */
	public var basescore:int= 0;

	/**
	 * Íæ¼ÒÊÖÉϵÄÅÆ
	 */
	public var cards:Array= null;

	public var huTypeVec:Vector= new Vector();

}
}