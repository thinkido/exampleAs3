package framework.geom
{
	import framework.util.StringUtil;
	
	/**
	 * 使用的矩形对象
	 * @author Jing
	 *
	 */
	public class Rectangle
	{
		private var _x:int= 0;
		
		public function get x():int{
			return _x;
		}
		
		public function set x(x:int):void{
			_x = x;
		}
		
		private var _y:int= 0;
		
		public function get y():int{
			return _y;
		}
		
		public function set y(y:int):void{
			_y = y;
		}
		
		private var _w:int= 0;
		
		public function get width():int{
			return _w;
		}
		
		public function set width(w:int):void{
			_w = w;
		}
		
		private var _h:int= 0;
		
		public function get height():int{
			return _h;
		}
		
		public function set height(h:int):void{
			_h = h;
		}
		
		public function right():int{
			return _x + _w;
		}
		
		/**
		 * 设置矩形的右边框的位置，为导致修改h，会导致w小于0的设置无效
		 * @param right
		 */
		public function setRight(right:int):void{
			if(right >= _x)
			{
				_w = right - _x;
			}
		}
		
		public function bottom():int{
			return _y + _h;
		}
		
		/**
		 * 设置矩形的右边框的位置，为导致修改h，会导致h小于0的设置无效
		 * @param bottom
		 */
		public function setBottom(bottom:int):void{
			if(bottom >= _y)
			{
				_h = bottom - _y;
			}
		}
		
		public function toString():String
		{
			var format:String= "[x=%s,y=%s,w=%s,h=%s]";
			var repls:Array= [_x.toString(),_y.toString(),_w.toString(),_h.toString()];		
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
			_x = x;
			_y = y;
			_w = w;
			_h = h;
		}
		
		/**
		 * 得到矩形的相交区域，没有相交则返回null
		 * @param rectA
		 * @param rectB
		 * @return
		 *
		 */
		static public function getIntersectRect(rectA:Rectangle, rectB:Rectangle):Rectangle{
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
			
			var intersectRight:int= rectA.right() < rectB.right() ? rectA.right() : rectB.right();
			var intersectBottom:int= rectA.bottom() < rectB.bottom() ? rectA.bottom() : rectB.bottom();
			var intersectW:int= intersectRight - intersectX;
			var intersectH:int= intersectBottom - intersectY;
			var intersectRect:Rectangle= new Rectangle(intersectX, intersectY, intersectW, intersectH);
			return intersectRect;
		}
		
		/**
		 * 得到刚好完整包括了两个矩形的矩形区域
		 * @param rectA
		 * @param rectB
		 * @return
		 */
		static public function getUnionRect(rectA:Rectangle, rectB:Rectangle):Rectangle{
			var unionRect:Rectangle= new Rectangle(0, 0, 0, 0);
			unionRect.x = rectA.x < rectB.x ? rectA.x : rectB.x;
			unionRect.y = rectA.y < rectB.y ? rectA.y : rectB.y;
			unionRect.setRight(rectA.right() > rectB.right()?rectA.right():rectB.right());
			unionRect.setBottom(rectA.bottom() > rectB.bottom()?rectA.bottom():rectB.bottom());
			return unionRect;
			
		}
	}
}