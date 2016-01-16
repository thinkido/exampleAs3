package framework.util
{
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
			var x:int = b.getX() + ((b.getWidth() - a.getWidth()) >> 1);
			var y:int = b.getY() + ((b.getHeight() - a.getHeight()) >> 1);
			a.setPosition(x, y);
		}
	}
}