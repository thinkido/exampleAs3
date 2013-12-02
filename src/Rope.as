package
{
	import com.thinkido.example.Application;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Rope extends Application
	{
		private var mass:Number = 6;
		private var len:Number = 3;
		/**
		 * 绳子总段数 
		 */		
		private var div:Number = 10;
		private var massDiv:Number;
		private var lenDiv:Number;
		private var cX:Number = 300;
		private var cY:Number = 200;
		private var cR:Number = 30;
		private var g:Number = 9.81;
		/**
		 * 总长度 == len* pm
		 */		
		private var pm:Number = 20;
		private var dt:Number = 0.0166667;
		private var pX:Array;
		private var pY:Array;
		private var oX:Array;
		private var oY:Array;
		private var aX:Array;
		private var aY:Array;
		private var mS:Shape;
		private var drag:Boolean;
		private var mc:MovieClip;
		private var xPoint:Number = 700;
		private var yPoint:Number = 0;
		
		
		[Embed(source="../asset/rope1.jpg")]
		private var RopeClass:Class ;
		
		public function Rope()
		{
		}
		
		override protected function initApp():void{
			massDiv = mass / div;
			lenDiv = len / div;
			pX = [];
			pY = [];
			oX = [];
			oY = [];
			aX = [];
			aY = [];
			mS = new Shape();
			var _index:uint = 0;
			while (_index <= div)
			{
				pX[_index] = 10 + lenDiv * pm * _index;
				pY[_index] = 10;
				oX[_index] = 10 + lenDiv * pm * _index;
				oY[_index] = 10;
				pX[_index]= xPoint;
				pY[_index]= 10 + lenDiv * pm * _index;
				oX[_index]= xPoint;
				oY[_index]= 10 + lenDiv * pm * _index;
				aX[_index] = yPoint;
				aY[_index] = yPoint;
				_index = _index + 1;
			}
			addChild(mS);
			mc = new MovieClip() ;
			mc.graphics.beginFill(0xff0000,0.7);
			mc.graphics.drawCircle(0,0,5);
			mc.graphics.endFill() ;
			addChild(mc);
			addEventListener(Event.ENTER_FRAME, frame);
			mc.addEventListener(MouseEvent.MOUSE_DOWN,downHandler);
			mc.addEventListener(MouseEvent.MOUSE_UP,upHandler);
			pX[0] = xPoint ;
			pY[0] = yPoint ;
			return;
		}
		private function downHandler(event:MouseEvent):void{
			drag=true;
		}
		private function upHandler(event:MouseEvent):void
		{
			drag=false;
		}
		private var ropeBmd:Bitmap ;
		public function frame(event:Event) : void
		{
			
			accForces();
			verlet();
			var _index:uint = 0;
			while (_index <= (div - 1))
			{
				satConstraints();
				_index = _index + 1;
			}
			if( ropeBmd == null ){
				ropeBmd = new RopeClass();
			}
			mS.graphics.clear();
			mS.graphics.lineStyle(10, 0, 2);
			mS.graphics.lineBitmapStyle(ropeBmd.bitmapData);
			mS.graphics.moveTo(0, 0);
			mS.graphics.moveTo(pX[0], pY[0]);

			pX[0] = xPoint ;
			pY[0] = yPoint ;
			if(drag){
				pX[(pX.length - 1)] = stage.mouseX;
				pY[(pY.length - 1)] = stage.mouseY;
			}
			mc.x=pX[(pX.length - 1)];
			mc.y=pY[(pY.length - 1)];
			var _index1:uint = 0;
			while (_index1 <= div)
			{
				mS.graphics.lineTo(pX[_index1], pY[_index1]);
				_index1 = _index1 + 1;
			}
			return;
		}
		
		public function verlet() : void
		{
			var _px:Number = NaN;
			var _py:Number = NaN;
			var _index:uint = 0;
			while (_index <= div)
			{
				_px = pX[_index];
				pX[_index] = pX[_index] + (0.99 * pX[_index] - 0.99 * oX[_index] + aX[_index] * pm * dt * dt);
				_py = pY[_index];
				pY[_index] = pY[_index] + (0.99 * pY[_index] - 0.99 * oY[_index] + aY[_index] * pm * dt * dt);
				oX[_index] = _px;
				oY[_index] = _py;
				_index +=  1;
			}
			return;
		}
		public function accForces() : void
		{
			var _index:uint = 1;
			while (_index <= div)
			{
				aY[_index] = g;
				_index = _index + 1;
			}
			return;
		}
		
		public function satConstraints() : void
		{
			var _xp:Number = NaN;
			var _yp:Number = NaN;
			var _dis:Number = NaN;
			var _part:Number = NaN;
			var _index:uint = 1;
			while (_index <= div)
			{
				_xp = (pX[_index] - pX[(_index - 1)]) / pm;
				_yp = (pY[_index] - pY[(_index - 1)]) / pm;
				_dis = Math.sqrt(_xp * _xp + _yp * _yp);
				_part = _dis - lenDiv;
				pX[_index] = pX[_index] - _xp / _dis * 0.5 * pm * _part;
				pY[_index] = pY[_index] - _yp / _dis * 0.5 * pm * _part;
				pX[(_index - 1)] = pX[(_index - 1)] + _xp / _dis * 0.5 * pm * _part;
				pY[(_index - 1)] = pY[(_index - 1)] + _yp / _dis * 0.5 * pm * _part;
				_index = _index + 1;
			}
			return;
		}
		
		public function checkColl() : void
		{
			var _dx:Number = NaN;
			var _dy:Number = NaN;
			var _dis:Number = NaN;
			var _part:Number = NaN;
			var _index:uint = 0;
			while (_index <= div)
			{
				_dx = pX[_index] - cX;
				_dy = pY[_index] - cY;
				_dis = Math.sqrt(_dx * _dx + _dy * _dy);
				_part = _dis - cR;
				if (_part < 0)
				{
					pX[_index] = pX[_index] + (-_dx) / _dis * _part;
					pY[_index] = pY[_index] + (-_dy) / _dis * _part;
				}
				_index = _index + 1;
			}
			return;
		}
	}
}