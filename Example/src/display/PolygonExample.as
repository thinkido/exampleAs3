package display
{
	import com.thinkido.example.Application;
	import com.thinkido.framework.manager.TimerManager;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class PolygonExample extends Application
	{
		private var polygon:Polygon ;
		public function PolygonExample()
		{
			super();
		}
		protected override function initApp():void
		{
			polygon = new Polygon();
			addChild(polygon);
			polygon.x = 200 ;
			polygon.y = 200 ;
			polygon.radius = 100 ;
			polygon.draw([100,80,50,90,30,30,100,80,50,90]);
//			this.addEventListener(MouseEvent.CLICK,changeRadiu);
			TimerManager.createTimer(1000,int.MAX_VALUE,changeRadiu);
		}
		
		private var arr:Array = [100,80,50,90,30,40,100,80,50,90] ;
			
		protected function changeRadiu(event:MouseEvent = null):void
		{
			polygon.draw( func5(arr) );
		}
		
		private function func5(myArr:Array):Array{
			var rnd:int;
			var tmp:*;
			var len:int = myArr.length;
			for(var i:uint = 0;i<len;i++){
				tmp = myArr[i];
				rnd = Math.random()*len;
				myArr[i] = myArr[rnd];
				myArr[rnd] = tmp;
			}
			return myArr;
		}
	}
}