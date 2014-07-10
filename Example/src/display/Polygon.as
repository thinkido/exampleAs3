package display
{
	import com.thinkido.framework.common.vo.StyleData;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Polygon extends Sprite
	{
		private var _radius:int ;
		
		public var a:Point ;
		public var b:Point ;
		public var c:Point ;
		public var d:Point ;
		public var e:Point ;
		
		public var poly1:PolygonItem ;
		public var poly2:PolygonItem ;
		public var styleData1:StyleData ;
		public var styleData2:StyleData ;
		
		public function Polygon()
		{
			a = new Point();
			b = new Point();
			c = new Point();
			d = new Point();
			e = new Point();
			
			poly1 = new PolygonItem() ;
			poly2 = new PolygonItem() ;
			addChild(poly1);
			addChild(poly2);
			
			styleData1 = new StyleData( 2,0xffff00,0.6, 0xffff00,0.2 );
			styleData2 = new StyleData( 2,0xff0000,0.6, 0xff0000,0.2 );
			poly1.styleData = styleData1 ;
			poly2.styleData = styleData2 ;
		}
		

		public function get radius():int
		{
			return _radius;
		}

		public function set radius(value:int):void
		{
			if( _radius == value ){
				return ;
			}
			_radius = value;
			drawBase() ;
		}
		
		private function drawBase():void{
			this.graphics.clear();
			graphics.lineStyle(2,0x00ff00,0.5);
			var _x:Number ;
			var _y:Number ;
			
			for (var i:int = 0; i < 6 ; i++) 
			{
				var angle:Number = Math.PI * 2 / 5 * i  ;
				_x = Math.cos(angle )*radius ;
				_y = Math.sin(angle )*radius ;
				this.graphics.lineTo( _x , _y );
				this.graphics.lineTo(0,0);
				this.graphics.lineTo( _x , _y );
			}
			graphics.endFill() ;
			this.rotation = -90 ;
		}
		/**
		 *  
		 * @param data 10个半径数组,前5个数是第一个半径,后5个数是第二个半径
		 * 
		 */
		public function draw( data:Array ):void{
			poly1.draw( data.slice(0,5) );
			poly2.draw( data.slice(4) );
		}
		
	}
}