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
		
		public function x():int{
			return _x;
		}
		
		public function setX(x:int):void{
			_x = x;
		}
		
		private var _y:int= 0;
		
		public function y():int{
			return _y;
		}
		
		public function setY(y:int):void{
			_y = y;
		}
		
		private var _w:int= 0;
		
		public function w():int{
			return _w;
		}
		
		public function setW(w:int):void{
			_w = w;
		}
		
		private var _h:int= 0;
		
		public function h():int{
			return _h;
		}
		
		public function setH(h:int):void{
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
		
		public function toString():String{
			var format:String= "[x=%s,y=%s,w=%s,h=%s]";
			var repls:Array= {String.valueOf(_x)
				,String.valueOf(_y)
					,String.valueOf(_w)
					,String.valueOf(_h)};		
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
			
			if (rectA.x() + rectA.w() < rectB.x())
			{
				return null;
			}
			
			if (rectA.x() > rectB.x() + rectB.w())
			{
				return null;
			}
			
			if (rectA.y() + rectA.h() < rectB.y())
			{
				return null;
			}
			
			if (rectA.y() > rectB.y() + rectB.h())
			{
				return null;
			}
			
			intersectX = rectA.x() > rectB.x() ? rectA.x() : rectB.x();
			intersectY = rectA.y() > rectB.y() ? rectA.y() : rectB.y();
			
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
			unionRect.setX(rectA.x() < rectB.x()?rectA.x():rectB.x());
			unionRect.setY(rectA.y() < rectB.y()?rectA.y():rectB.y());
			unionRect.setRight(rectA.right() > rectB.right()?rectA.right():rectB.right());
			unionRect.setBottom(rectA.bottom() > rectB.bottom()?rectA.bottom():rectB.bottom());
			return unionRect;
			
		}
	}
}