package framework.util
{
	import starling.display.DisplayObject;

	public class ViewUtil
	{
		public function ViewUtil()
		{
		}
		/**
		 * 将显示对象a移动后和b以中心点对齐
		 * 
		 * @param a
		 * @param b
		 */
		static public function setCenter(a:DisplayObject, b:DisplayObject):void
		{
			var x:int = b.x + ((b.width - a.width) >> 1);
			var y:int = b.y + ((b.height - a.height) >> 1);
//			a.setPosition(x, y);
			a.x = x ;
			a.y = y ;
		}
	}
}