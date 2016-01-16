package framework.geom
{
	import flash.geom.Point;
	
	public class KPoint extends Point
	{
		public function KPoint(x:Number=0, y:Number=0)
		{
			super(x, y);
		}
		/**
		 * 获取一个点绕任意点顺时针旋转任意角度后的坐标
		 * @param x
		 * @param y
		 * @param cx
		 * @param cy
		 * @param angle
		 * @return
		 */
		public static function rotatePoint(x:int,y:int,cx:int,cy:int,angle:int):KPoint
		{
			//首先换算出正确的角度
			angle = angle % 360;
			if(angle < 0)
			{
				angle = 360 + angle;
			}
			angle = 360 - angle;
			
			var newX:int = 0;
			var newY:int = 0;
			
			//角度转换为弧度
			var  radian:Number = angle * Math.PI / 180;
			var  tx:Number = (x- cx) * Math.cos(radian) + (y - cy ) * Math.sin(radian) + cy;  
			var  ty:Number = -(x - cx) * Math.sin(radian) + (y - cy) * Math.cos(radian) + cy;  
			newX = (int)tx;
			newY = (int)ty;
			
			return new KPoint(newX,newY);
		}
	}
}