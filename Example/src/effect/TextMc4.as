package effect 
{
	import com.thinkido.framework.utils.MathUtil;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	public class TextMc4 extends MovieClip
	{
		private var breakOffParticleSpringingArea:Number;
		private var textShadowStrength:int;
		private var textShadowAngle:int;
		private var particleScaleHigherLimit:Number;
		private var breakOffParticleScaleHigherLimit:Number;
		private var snowSpotScaleLowerLimit:Number;
		private var breakOffParticleSpringingAreaLowerLimit:Number;
		private var breakOffParticleRotationHigherLimit:Number;
		private var breakOffParticleScale:Number;
		private var breakOffParticleAngleSpeedHigherLimit:Number;
		private var testObjBitmapData:BitmapData;
		private var breakOffParticlesExist:Boolean;
		private var breakOffParticleAngleSpeed:Number;
		private var particleScale:Number;
		private var breakOffParticleRotationSpeed:Number;
		private var textBitmapData:BitmapData;
		private var breakOffParticleSpeedYLowerLimit:Number;
		private var testObjBitmap:Bitmap;
		private var breakOffParticleRotationLowerLimit:Number;
		private var particleSpeedYLowerLimit:Number;
		private var textEffectFont:String;
		private var particleCoordinatesCount:int;
		private var breakOffParticlesCount:int;
		private var appropriateParticleCoordinates:Array;
		private var breakOffParticleScaleLowerLimit:Number;
		private var snowSpotGlowStrength:int;
		private var textGlowStrength:int;
		private var particleScaleLowerLimit:Number;
		private var textShadowBlur:int;
		private var snowSpotScaleHigherLimit:Number;
		private var textBitmap:Bitmap;
		private var snowSpotCount:int;
		private var particleSpeedYHigherLimit:Number;
		private var randomPosForBreakOffParticles:Object;
		private var breakOffParticleSpeedYHigherLimit:Number;
		private var snowSpotAlphaHighestValue:Number;
		public var testObj_mc:MovieClip;
		private var randomPosForParticles:Object;
		private var particleSpeedX:Number;
		private var textGlowColor:uint;
		private var particleAlphaFadeSpeedLowerLimit:Number;
		private var particleSpeedY:Number;
		private var breakOffTimer:Timer;
		private var breakOffParticleAlphaFadeSpeedLowerLimit:Number;
		private var textEffectTextFormat:TextFormat;
		private var breakOffParticleAngleSpeedLowerLimit:Number;
		private var textGlowQuality:int;
		private var breakOffParticlesCountLowerLimit:int;
		private var breakOffParticleSpeedY:Number;
		private var breakOffParticlesCountHigherLimit:int;
		private var snowSpotYOffset:int;
		private var breakOffParticleAlphaFadeSpeedHigherLimit:Number;
		private var textShadowQuality:int;
		private var particleAlphaFadeSpeed:Number;
		private var particleAlphaFadeSpeedHigherLimit:Number;
		private var particleSpeedXHigherLimit:Number;
		private var textString:String;
		private var breakOffParticleSpringingAreaHigherLimit:Number;
		private var snowSpotsExist:Boolean;
		private var breakOffParticleAlphaFadeSpeed:Number;
		private var text_Color:uint;
		private var breakOffTimerIntervalHigherLimit:int;
		private var textContainerSprite:Sprite;
		private var randomPosForSnowSpot:Object;
		private var particleSpeedXLowerLimit:Number;
		private var particlesAddedPerFrame:int;
		private var textShadowDistance:int;
		private var snowSpotGlowBlur:int;
		private var textGlowBlur:int;
		public var text_mc:TextField;
		private var snowSpotAlphaLowestValue:Number;
		private var text_Size:int;
		private var breakOffTimerIntervalLowerLimit:int;
		private var yPositionOffset:int;
		
		public function TextMc4()
		{
			var _loc_1:Boolean = true;
			var _loc_2:Boolean = false;
			if (_loc_1)
			{
			}
			init();
			return;
		}
		
		private function createSnowSpots():void
		{
			var _local1:Array;
			var _local2:int;
			var _local3:int;
			var _local4:SnowSpot4_AS;
			_local1 = [1, -1];
			while (_local3 < snowSpotCount)
			{
				_local4 = new SnowSpot4_AS();
				_local4.filters = [new GlowFilter(0xFFFFFF, 1, snowSpotGlowBlur, snowSpotGlowBlur, snowSpotGlowStrength, 3, false, false)];
				_local4.alpha = MathUtil.randomNumber(snowSpotAlphaLowestValue, snowSpotAlphaHighestValue);
				_local4.gotoAndStop(int(((Math.random() * _local4.totalFrames) + 1)));
				_local2 = int((Math.random() * _local1.length));
				_local4.scaleX = (_local1[_local2] * MathUtil.randomNumber(snowSpotScaleLowerLimit, snowSpotScaleHigherLimit));
				_local4.scaleY = Math.abs(_local4.scaleX);
				randomPosForSnowSpot = appropriateParticleCoordinates[int(MathUtil.randomNumber(0, (appropriateParticleCoordinates.length - 1)))];
				_local4.x = randomPosForSnowSpot._xPos;
				_local4.y = (randomPosForSnowSpot._yPos + snowSpotYOffset);
				addChild(_local4);
				_local3++;
			};
		}
		
		private function createAppropriatePositionsForParticlesAccordingToTextBitmap() : void
		{
			var _index:int;
			var _w:int;
			var _h:int;
			appropriateParticleCoordinates = new Array();
			_index = 0;
			while (_index < particleCoordinatesCount)
			{
				_w = MathUtil.randomNumber(0, this.width);
				_h = MathUtil.randomNumber(0, this.height); 
				testObjBitmap = new Bitmap(testObjBitmapData);
				textContainerSprite.addChild(testObjBitmap);
				testObjBitmap.x = _w;
				testObjBitmap.y = _h;
				if (!textBitmapData.hitTest(new Point(textBitmap.x, textBitmap.y), 1, testObjBitmapData, new Point(testObjBitmap.x, testObjBitmap.y), 1))
				{
					textContainerSprite.removeChild(testObjBitmap);
				}
				else
				{
					textContainerSprite.removeChild(testObjBitmap);
					appropriateParticleCoordinates.push({
						"_xPos":_w,
						"_yPos":(_h + yPositionOffset)
					});
				};
				_index++;
			};
			return;
		}
		
		private function createBreakOffParticles() : void
		{
			breakOffTimer = new Timer(int(MathUtil.randomNumber(breakOffTimerIntervalLowerLimit, breakOffTimerIntervalHigherLimit)), 1);
			breakOffTimer.addEventListener(TimerEvent.TIMER, _onTimerEvent);
			breakOffTimer.start();
		}
		
		protected function _enterFrame(event:Event) : void
		{
			var _local2:int;
			var _local3:Particle4;
			_local2 = 0;
			while (_local2 < particlesAddedPerFrame)
			{
				randomPosForParticles = appropriateParticleCoordinates[int(MathUtil.randomNumber(0, (appropriateParticleCoordinates.length - 1)))];
				particleSpeedY = MathUtil.randomNumber(particleSpeedYLowerLimit, particleSpeedYHigherLimit);
				particleSpeedX = MathUtil.randomNumber(particleSpeedXLowerLimit, particleSpeedXHigherLimit);
				particleAlphaFadeSpeed = MathUtil.randomNumber(particleAlphaFadeSpeedLowerLimit, particleAlphaFadeSpeedHigherLimit);
				particleScale = MathUtil.randomNumber(particleScaleLowerLimit, particleScaleHigherLimit);
				_local3 = new Particle4(particleSpeedX, particleSpeedY, particleAlphaFadeSpeed, particleScale, randomPosForParticles._xPos, randomPosForParticles._yPos, this);
				_local2++;
			};
		}
		
		private function init():void
		{
			var temp1:MovieClip = new TextMc4_AS();
			text_mc = temp1.text_mc ;
			testObj_mc = temp1.testObj_mc ;
			addChild(text_mc);
			addChild(testObj_mc);
			var _loc_1:Boolean = true;
			var _loc_2:Boolean = false;
			this.mouseEnabled = false;
			textString = "SNOW";
			text_Color = 16711680;
			text_Size = 100;
			textGlowColor = 13421772;
			textGlowBlur = 8;
			textGlowStrength = 2;
			textGlowQuality = 3;
			textShadowBlur = 4;
			textShadowDistance = 10;
			textShadowAngle = 90;
			textShadowStrength = 1;
			textShadowQuality = 3;
			yPositionOffset = 0;
			particleCoordinatesCount = 1000;
			particlesAddedPerFrame = 4;
			particleSpeedYLowerLimit = 0.4;
			particleSpeedYHigherLimit = 0.7;
			particleSpeedXLowerLimit = -0.1;
			particleSpeedXHigherLimit = 0.1;
			particleAlphaFadeSpeedLowerLimit = 0.02;
			particleAlphaFadeSpeedHigherLimit = 0.1;
			particleScaleLowerLimit = 0.25;
			particleScaleHigherLimit = 0.6;
			breakOffParticlesExist = true;
			breakOffParticlesCountLowerLimit = 5;
			breakOffParticlesCountHigherLimit = 45;
			breakOffTimerIntervalLowerLimit = 50;
			breakOffTimerIntervalHigherLimit = 1500;
			breakOffParticleSpeedYLowerLimit = 1;
			breakOffParticleSpeedYHigherLimit = 4;
			breakOffParticleAlphaFadeSpeedLowerLimit = 0.006;
			breakOffParticleAlphaFadeSpeedHigherLimit = 0.05;
			breakOffParticleScaleLowerLimit = 0.3;
			breakOffParticleScaleHigherLimit = 0.9;
			breakOffParticleRotationLowerLimit = -8;
			breakOffParticleRotationHigherLimit = 8;
			breakOffParticleAngleSpeedLowerLimit = -0.12;
			breakOffParticleAngleSpeedHigherLimit = 0.12;
			breakOffParticleSpringingAreaLowerLimit = 7;
			breakOffParticleSpringingAreaHigherLimit = 10;
			snowSpotsExist = true;
			snowSpotCount = 1000;
			snowSpotScaleLowerLimit = 0.3;
			snowSpotScaleHigherLimit = 2.3;
			snowSpotYOffset = 0;
			snowSpotAlphaLowestValue = 0.1;
			snowSpotAlphaHighestValue = 1;
			snowSpotGlowBlur = 2;
			snowSpotGlowStrength = 1;
			textEffectTextFormat = new TextFormat(text_mc.defaultTextFormat.font, text_Size, text_Color, false, false, false, null, null, "center");
			formatMyText(this.text_mc, textString);
			textContainerSprite = new Sprite();
			textContainerSprite.addChild(this.text_mc);
			textBitmapData = new BitmapData(textContainerSprite.width, textContainerSprite.height, true, 0);
			textBitmapData.draw(textContainerSprite);
			textBitmap = new Bitmap(textBitmapData);
			textContainerSprite.removeChild(this.text_mc);
			textContainerSprite.addChild(textBitmap);
			addChild(textContainerSprite);
			testObjBitmapData = new BitmapData(testObj_mc.width, testObj_mc.height, true, 0);
			testObjBitmapData.draw(testObj_mc);
			removeChild(testObj_mc);
			createAppropriatePositionsForParticlesAccordingToTextBitmap();
			textContainerSprite.removeChild(textBitmap);
			textContainerSprite.addChild(text_mc);
			textContainerSprite.filters = [new GlowFilter(textGlowColor, 1, textGlowBlur, textGlowBlur, textGlowStrength, textGlowQuality, false, false), new DropShadowFilter(textShadowDistance, textShadowAngle, 0, 1, textShadowBlur, textShadowBlur, textShadowStrength, textShadowQuality, false, false, false)];
			addEventListener(Event.ENTER_FRAME, _enterFrame);
			if (breakOffParticlesExist == true)
			{
				createBreakOffParticles();
			};
			if (snowSpotsExist == true)
			{
				createSnowSpots();
			};
			return;
		}
		
		private function _onTimerEvent(event:TimerEvent):void
		{
			var _index:int;
			var _particle:BreakOffSnowParticle4;
			breakOffParticlesCount = MathUtil.randomNumber(breakOffParticlesCountLowerLimit, breakOffParticlesCountHigherLimit);
			randomPosForBreakOffParticles = appropriateParticleCoordinates[int(MathUtil.randomNumber(0, (appropriateParticleCoordinates.length - 1)))];
			_index = 0;
			while (_index < breakOffParticlesCount)
			{
				breakOffParticleSpeedY = MathUtil.randomNumber(breakOffParticleSpeedYLowerLimit, breakOffParticleSpeedYHigherLimit);
				breakOffParticleAlphaFadeSpeed = MathUtil.randomNumber(breakOffParticleAlphaFadeSpeedLowerLimit, breakOffParticleAlphaFadeSpeedHigherLimit);
				breakOffParticleScale = MathUtil.randomNumber(breakOffParticleScaleLowerLimit, breakOffParticleScaleHigherLimit);
				breakOffParticleRotationSpeed = MathUtil.randomNumber(breakOffParticleRotationLowerLimit, breakOffParticleRotationHigherLimit);
				breakOffParticleAngleSpeed = MathUtil.randomNumber(breakOffParticleAngleSpeedLowerLimit, breakOffParticleAngleSpeedHigherLimit);
				breakOffParticleSpringingArea = MathUtil.randomNumber(breakOffParticleSpringingAreaLowerLimit, breakOffParticleSpringingAreaHigherLimit);
				_particle = new BreakOffSnowParticle4(breakOffParticleSpeedY, breakOffParticleAlphaFadeSpeed, breakOffParticleScale, breakOffParticleRotationSpeed, breakOffParticleAngleSpeed, breakOffParticleSpringingArea, MathUtil.randomNumber((randomPosForBreakOffParticles._xPos - 5), (randomPosForBreakOffParticles._xPos + 5)), MathUtil.randomNumber((randomPosForBreakOffParticles._yPos - 5), (randomPosForBreakOffParticles._yPos + 5)), this);
				_index++;
			};
			createBreakOffParticles();
		}
		
		private function formatMyText(param1:TextField, param2:String) : void
		{
			var _loc_3:Boolean = false;
			var _loc_4:Boolean = true;
			param1.defaultTextFormat = textEffectTextFormat;
			param1.embedFonts = true;
			param1.autoSize = TextFieldAutoSize.LEFT;
			param1.antiAliasType = AntiAliasType.ADVANCED;
			if (!(_loc_3 && _loc_3))
			{
				param1.gridFitType = GridFitType.PIXEL;
				param1.sharpness = 0;
				param1.selectable = false;
				param1.multiline = false;
				param1.wordWrap = false;
				param1.text = param2;
				param1.x = 0;
			}
			param1.y = 0;
			return;
		}
		
	}
}
