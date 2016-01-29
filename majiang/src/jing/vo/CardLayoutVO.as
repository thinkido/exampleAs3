package jing.vo
{
	import flash.geom.Point;

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
		public var cardPrefix:String= null;
	
		/**
		 * 起点X
		 */
		public var startX:int= 0;
	
		/**
		 * 起点Y
		 */
		public var startY:int= 0;
	
		/**
		 * 方向
		 */
		public var dir:String= null;
	
		/**
		 * 牌与牌之间的间隔
		 */
		public var gap:int= 0;
	
		/**
		 * 组中麻将之间的间隔
		 */
		public var combinGap:int= 0;
		
		/**
		 * 组合中的杠，上面那个的Y轴偏移
		 */
		public var combinGangOffY:int= 0;
	
		/**
		 * 换行的牌数阈值
		 */
		public var warpCount:int= 999;
	
		/**
		 * 换行后的偏移坐标量
		 */
		public var warp:Point= null;
	}
}