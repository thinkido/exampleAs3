package com.thinkido.framework.display
{
	import com.greensock.TweenLite;
	import com.thinkido.framework.common.vo.StyleData;
	import com.thinkido.framework.utils.DrawUtil;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class PolygonItem extends Sprite
	{
		private var _radius:int ;
		
		public var a:Point ;
		public var b:Point ;
		public var c:Point ;
		public var d:Point ;
		public var e:Point ;
		
		public function PolygonItem()
		{
			a = new Point();
			b = new Point();
			c = new Point();
			d = new Point();
			e = new Point();
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

			var itemAngle:Number = Math.PI * 2 / 5;
			var angle:Number = itemAngle * 0 ;
			a.x = Math.cos(angle )*radius ;
			a.y = Math.sin(angle)*radius;
			angle = itemAngle * 1 ;
			b.x = Math.cos(angle )*radius ;
			b.y = Math.sin(angle)*radius;
			angle = itemAngle * 2 ;
			c.x = Math.cos(angle )*radius ;
			c.y = Math.sin(angle)*radius;
			angle = itemAngle * 3 ;
			d.x = Math.cos(angle )*radius ;
			d.y = Math.sin(angle)*radius;
			angle = itemAngle * 4 ;
			e.x = Math.cos(angle )*radius ;
			e.y = Math.sin(angle)*radius;
		}
		
		public function draw( data:Array ):void{
			var itemAngle:Number = Math.PI * 2 / 5;
			var angle:Number = itemAngle * 0 ;
			TweenLite.to( a , 0.5 ,{x: Math.cos(angle )*data[0] ,y: Math.sin(angle)*data[0] }) ;
			angle = itemAngle * 1 ;
			TweenLite.to( b , 0.5 ,{x: Math.cos(angle )*data[1] ,y: Math.sin(angle)*data[1] }) ;
			angle = itemAngle * 2 ;
			TweenLite.to( c , 0.5 ,{x: Math.cos(angle )*data[2] ,y: Math.sin(angle)*data[2] }) ;
			angle = itemAngle * 3 ;
			TweenLite.to( d , 0.5 ,{x: Math.cos(angle )*data[3] ,y: Math.sin(angle)*data[3] }) ;
			angle = itemAngle * 4 ;
			TweenLite.to( e , 0.5 ,{x: Math.cos(angle )*data[4] ,y: Math.sin(angle)*data[4] , onUpdate: reDraw }) ;
		}
		public var styleData:StyleData ;
		private function reDraw():void{
			this.graphics.clear();
			this.graphics.lineStyle( styleData.lineThickness ,styleData.lineColor,styleData.lineAlpha);
			this.graphics.beginFill( styleData.fillColor ,styleData.fillAlpha ) ;
			this.graphics.moveTo( a.x ,a.y );
			this.graphics.lineTo( b.x ,b.y );
			this.graphics.lineTo( c.x ,c.y );
			this.graphics.lineTo( d.x ,d.y );
			this.graphics.lineTo( e.x ,e.y );
			this.graphics.lineTo( a.x ,a.y );
			this.graphics.endFill() ;
		}
			
	}
}