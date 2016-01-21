package jing.vo
{
import framework.geom.Point;

/**
 * ¿¨ÅƲ¼¾ֵÄVO
 * 
 * @author Jing
 */
public class CardLayoutVO
{

	/**
	 * ʹÓõÄÅÆ×éͼƬǰ׺
	 */
	public var cardPrefix:String= null;

	/**
	 * ÆðµãX
	 */
	public var startX:int= 0;

	/**
	 * ÆðµãY
	 */
	public var startY:int= 0;

	/**
	 * ·½Ïò
	 */
	public var dir:String= null;

	/**
	 * ÅÆÓëÅÆ֮¼äµļä¸ô
	 */
	public var gap:int= 0;

	/**
	 * ×éÖÐÂ齫֮¼äµļä¸ô
	 */
	public var combinGap:int= 0;
	
	/**
	 * ×éºÏÖеĸܣ¬ÉÏÃæÄǸöµÄYÖáƫÒÆ
	 */
	public var combinGangOffY:int= 0;

	/**
	 * »»ÐеÄÅÆÊýãÐֵ
	 */
	public var warpCount:int= 999;

	/**
	 * »»ÐкóµÄƫÒÆ×ø±êÁ¿
	 */
	public var warp:Point= null;
}
}