package
{
	import com.thinkido.example.Application;
	
	import fl.controls.Slider;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import temp.TempRipeButton;
	
	public class Rope1 extends Application
	{
		private var rope:Shape;
		private var px:Array;
		public var joins:int = 24;
		public var spring:Number = 0.9;
		private var py:Array;
		public var sliderDist:Slider;
		public var sliderJoins:Slider;
		private var oldx:Array;
		private var oldy:Array;
		public var button01:MovieClip;
		public var button02:MovieClip;
		public var button03:MovieClip;
		public var button04:MovieClip;
		public var button05:MovieClip;
		public var button06:MovieClip;
		public var button07:MovieClip;
		public var button08:MovieClip;
		public var button09:MovieClip;
		private var ax:Array;
		private var ay:Array;
		public var sliderWeight:Slider;
		public var sliderSpring:Slider;
		public var buttonN:Number = 2;
		public var gravity:Number = 40;
		public var sliderGrav:Slider;
		public var distance:int = 1;
		public var weight:Number = 40;
		public var friction:Number = 0.97;
		public var sliderFriction:Slider;
		
		public function Rope1()
		{
		}
		
		override protected function initApp():void{
			px = new Array();
			py = new Array();
			oldx = new Array();
			oldy = new Array();
			ax = new Array();
			ay = new Array();
			rope = new Shape();
			init();
			createRope();
			createBox();
			return;
		}
		
		public function sliderF(event:Event) : void
		{
			gravity = 1 + 5 * 2;
			friction = 1 - 3 / 100;
			spring = 0.95 + 0 / 150;
//			gravity = 1 + sliderGrav.value * 2;
//			friction = 1 - sliderFriction.value / 100;
//			spring = 0.95 + sliderSpring.value / 150;
//			trace(spring);
//			if (buttonN == 2)
//			{
//				weight = 2 + sliderWeight.value * 4;
//			}
//			if (buttonN == 1)
//			{
//				button01.alpha = 0.5;
//				button02.alpha = 1;
//			}
//			if (buttonN == 2)
//			{
//				button01.alpha = 1;
//				button02.alpha = 0.5;
//			}
			return;
		}
		
		public function frictionF()
		{
			var _loc_2:Number = NaN;
			var _loc_3:Number = NaN;
			var _index:int = 0;
			while (_index <= joins)
			{
				_loc_2 = px[_index];
				_loc_3 = py[_index];
				px[_index] = px[_index] + (px[_index] - oldx[_index]) * friction;
				py[_index] = py[_index] + (py[_index] - oldy[_index]) * spring;
				oldx[_index] = _loc_2;
				oldy[_index] = _loc_3;
				_index++;
			}
			return;
		}
		
		public function createRope() : void
		{
			var _index:uint = 0;
			while (_index <= joins)
			{
				px[_index] = 0;
				py[_index] = 0;
				oldx[_index] = 0;
				oldy[_index] = 0;
				ax[_index] = 0;
				ay[_index] = 0;
				_index = _index + 1;
			}
			addChild(rope);
			addEventListener(Event.ENTER_FRAME, enterF);
			return;
		}
		
		public function buttonClicked(event:MouseEvent) : void
		{
			switch(event.target)
			{
				case button01:
				{
					buttonN = 1;
					break;
				}
				case button02:
				{
					buttonN = 2;
					createBox();
					button09.your_text.text = "weight";
					sliderWeight.maximum = 10;
					sliderWeight.value = 2;
					break;
				}
				case button08:
				{
					joins = 5 + sliderJoins.value * 3;
					distance = 1 + sliderDist.value;
					createRope();
					break;
				}
				default:
				{
					break;
				}
			}
			return;
		}
		
		public function enterF(event:Event) : void
		{
			var _dis:Number = NaN;
			var _alpha:Number = NaN;
			forcesF();
			frictionF();
			tensionF();
			collisionF();
			px[0] = mouseX;
			py[0] = mouseY;
			rope.graphics.clear();
			rope.graphics.lineStyle(1, 13421772, 0.5);
			rope.graphics.moveTo(px[0], py[0]);
			var _index:int = 0;
			while (_index <= joins)
			{
				_dis = Math.sqrt(ax[_index] * ax[_index] + ay[_index] * ay[_index]);
				_alpha = 0.5 + _dis / 20;
				rope.graphics.lineStyle(1, 13421772, _alpha);
				rope.graphics.lineTo(px[_index], py[_index]);
				_index++;
			}
			return;
		}
		
		public function createBox():void
		{
			var _box:Shape = new Shape();
			_box.graphics.beginFill(16750848, 1);
			_box.graphics.drawRect(-5, -5, 10, 10);
			_box.graphics.endFill();
			addChild(_box);
			_box.addEventListener(Event.ENTER_FRAME, boxF);
			return;
		}
		
		public function tensionF()
		{
			var _loc_3:Number = NaN;
			var _loc_4:Number = NaN;
			var _loc_5:Number = NaN;
			var _loc_6:Number = NaN;
			var _loc_1:* = distance / joins;
			var _index:int = 1;
			while (_index <= joins)
			{
				_loc_3 = (px[_index] - px[(_index - 1)]) / 100;
				_loc_4 = (py[_index] - py[(_index - 1)]) / 100;
				_loc_5 = Math.sqrt(_loc_3 * _loc_3 + _loc_4 * _loc_4);
				_loc_6 = _loc_5 - _loc_1;
				ax[_index] = _loc_3 / _loc_5 * 0.5 * 100 * _loc_6;
				ay[_index] = _loc_4 / _loc_5 * 0.5 * 100 * _loc_6;
				px[_index] = px[_index] - ax[_index];
				py[_index] = py[_index] - ay[_index];
				px[(_index - 1)] = px[(_index - 1)] + ax[_index];
				py[(_index - 1)] = py[(_index - 1)] + ay[_index];
				_index++;
			}
			return;
		}
		
		public function collisionF()
		{
			var _loc_1:uint = 0;
			while (_loc_1 < joins)
			{
				
				if (py[_loc_1] > stage.stageHeight)
				{
					py[_loc_1] = stage.stageHeight;
				}
				_loc_1 = _loc_1 + 1;
			}
			return;
		}
		
		public function boxF(event:Event) : void
		{
			event.target.x = px[joins];
			event.target.y = py[joins];
			var _loc_2:* = px[joins] - px[(joins - 1)];
			var _loc_3:* = py[joins] - py[(joins - 1)];
			event.target.rotation = 90 - Math.atan2(_loc_2, _loc_3) * (180 / Math.PI);
			event.target.scaleX = 1 + weight / 5;
			event.target.scaleY = 1 + weight / 5;
			if (buttonN == 1)
			{
				event.target.removeEventListener(Event.ENTER_FRAME, boxF);
				removeChild(event.target as DisplayObject);
			}
			return;
		}
		
		public function forcesF()
		{
			var _loc_1:int = 1;
			while (_loc_1 <= joins)
			{
				
				py[_loc_1] = py[_loc_1] + gravity * 1 / 36;
				_loc_1++;
			}
			if (buttonN == 2)
			{
				py[joins] = py[joins] + weight * 1 / 36;
			}
			return;
		}
		
		private function init():void
		{
//			button01 = new TempRipeButton();
//			button02 = new TempRipeButton();
//			button03 = new TempRipeButton();
//			button04 = new TempRipeButton();
//			button05 = new TempRipeButton();
//			button06 = new TempRipeButton();
//			button07 = new TempRipeButton();
//			button08 = new TempRipeButton();
//			
//			button01.addEventListener(MouseEvent.CLICK, buttonClicked);
//			button02.addEventListener(MouseEvent.CLICK, buttonClicked);
//			button08.addEventListener(MouseEvent.CLICK, buttonClicked);
//			button01.your_text.text = "normal rope";
//			button02.your_text.text = "with weight";
//			button08.your_text.text = "apply";
//			button03.your_text.text = "gravity";
//			button04.your_text.text = "friction";
//			button05.your_text.text = "spring";
//			button06.your_text.text = "number of joins";
//			button07.your_text.text = "join distance";
//			sliderGrav.maximum = 10;
//			sliderGrav.value = 5;
//			sliderFriction.maximum = 10;
//			sliderFriction.value = 3;
//			sliderSpring.maximum = 10;
//			sliderSpring.value = 0;
//			sliderJoins.maximum = 10;
//			sliderJoins.value = 5;
//			sliderDist.maximum = 10;
//			sliderDist.value = 0;
			addEventListener(Event.ENTER_FRAME, sliderF);
			return;
		}
	}
}