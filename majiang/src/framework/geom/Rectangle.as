package framework.geom
{
	import flash.geom.Rectangle;
	
	import framework.util.StringUtil;
	
	/**
	 * 使用的矩形对象
	 * @author Jing
	 *
	 */
	public class Rectangle extends flash.geom.Rectangle
	{
			
		override public function toString():String
		{
			var format:String= "[x=%s,y=%s,w=%s,h=%s]";
			var repls:Array= [x.toString(),y.toString(),width.toString(),height.toString()];		
			return StringUtil.format(format, repls);			
		}
		
		/**
		 * 
		 * @param x XλÖÃ
		 * @param y YλÖÃ
		 * @param w ¿í¶È
		 * @param h ¸߶È
		 */
		public function Rectangle(x:int, y:int, w:int, h:int)
		{
			super(w,y,w,h);
		}
		
		/**
		 * 得到矩形的相交区域，没有相交则返回null
		 * @param rectA
		 * @param rectB
		 * @return
		 *
		 */
		static public function getIntersectRect(rectA:framework.geom.Rectangle, rectB:framework.geom.Rectangle):framework.geom.Rectangle{
			var intersectX:int;
			var intersectY:int;
			
			if (rectA.x + rectA.width < rectB.x)
			{
				return null;
			}
			
			if (rectA.x > rectB.x + rectB.width)
			{
				return null;
			}
			
			if (rectA.y + rectA.height < rectB.y)
			{
				return null;
			}
			
			if (rectA.y > rectB.y + rectB.height)
			{
				return null;
			}
			
			intersectX = rectA.x > rectB.x ? rectA.x : rectB.x;
			intersectY = rectA.y > rectB.y ? rectA.y : rectB.y;
			
			var intersectRight:int= rectA.right < rectB.right ? rectA.right : rectB.right;
			var intersectBottom:int= rectA.bottom < rectB.bottom ? rectA.bottom : rectB.bottom;
			var intersectW:int= intersectRight - intersectX;
			var intersectH:int= intersectBottom - intersectY;
			var intersectRect:framework.geom.Rectangle = new framework.geom.Rectangle(intersectX, intersectY, intersectW, intersectH);
			return intersectRect;
		}
		
		/**
		 * 得到刚好完整包括了两个矩形的矩形区域
		 * @param rectA
		 * @param rectB
		 * @return
		 */
		static public function getUnionRect(rectA:framework.geom.Rectangle, rectB:framework.geom.Rectangle):framework.geom.Rectangle{
			var unionRect:framework.geom.Rectangle = new framework.geom.Rectangle(0, 0, 0, 0);
			unionRect.x = rectA.x < rectB.x ? rectA.x : rectB.x;
			unionRect.y = rectA.y < rectB.y ? rectA.y : rectB.y;
			unionRect.right = rectA.right > rectB.right?rectA.right:rectB.right;
			unionRect.bottom = rectA.bottom > rectB.bottom?rectA.bottom:rectB.bottom;
			return unionRect;
			
		}
	}
}