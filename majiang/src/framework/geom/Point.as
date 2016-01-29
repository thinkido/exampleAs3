package framework.geom
{
	import flash.geom.Point;
	
	import framework.util.StringUtil;
	
	/**
	 * 
	 * @author Jing
	 *
	 */
	public class Point extends flash.geom.Point
	{
		/**
		 * 获取一个点绕任意点顺时针旋转任意角度后的坐标
		 * @param x
		 * @param y
		 * @param cx
		 * @param cy
		 * @param angle
		 * @return
		 */
		static public function rotatePoint(x:int, y:int, cx:int, cy:int, angle:int):Point{
			//首先换算出正确的角度
			angle = angle % 360;
			if(angle < 0)
			{
				angle = 360+ angle;
			}
			angle = 360- angle;
			
			var newX:int= 0;
			var newY:int= 0;
			
			//角度转换为弧度
	        var radian:Number= angle * Math.PI / 180;
	        var tx:Number= (x- cx) * Math.cos(radian) + (y - cy ) * Math.sin(radian) + cy;  
	        var ty:Number= -(x - cx) * Math.sin(radian) + (y - cy) * Math.cos(radian) + cy;  
	        newX = int(tx);
	        newY = int(ty);
			
			return new Point(newX,newY);
		}
		
		
		/**
		 * 设置X,Y的值ֵ
		 * @param x
		 * @param y
		 */
		public function setPos(x:int, y:int):void{
			this.x = x;
			this.y = y;
		}
		
		public function Point(x:int, y:int)
		{
			this.x = x;
			this.y = y;
		}
		
		public function toString():String{
			var args:Array= new String[2];
			args[0] = this.x.toString();
			args[1] = this.y.toString();
			return StringUtil.format("[x = %s, y = %s]",args);
		}
	}
}