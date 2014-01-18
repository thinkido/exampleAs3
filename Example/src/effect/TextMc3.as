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
	
	
	public class TextMc3 extends MovieClip
	{
		private var textShadowStrength:int;
		private var sparkParticleGlowBlurAndStrengthValuesArray:Array;
		private var sparkParticleAngleSpeed:Number;
		private var sparkParticleGlowColorChoice:int;
		private var sparkParticleScaleHigherLimit:Number;
		private var textShadowAngle:int;
		private var particleScaleHigherLimit:Number;
		private var sparkParticleAlphaFadeSpeedLowerLimit:Number;
		private var sparkParticleAlphaFadeSpeedHigherLimit:Number;
		private var particleGlowColorArray:Array;
		private var testObjBitmapData:BitmapData;
		private var sparkTimerIntervalLowerLimit:int;
		private var sparkParticleGlowEffectBlur:int;
		private var particleScale:Number;
		private var sparkParticleSpeedYLowerLimit:Number;
		private var sparkParticleSpeedYHigherLimit:Number;
		private var sparkTimer:Timer;
		private var textBitmapData:BitmapData;
		private var sparkParticleScale:Number;
		private var sparkParticleGlowBlurAndStrengthChoice:int;
		private var testObjBitmap:Bitmap;
		private var sparkParticleAngleSpeedHigherLimit:Number;
		private var particleSpeedYLowerLimit:Number;
		private var textEffectFont:String;
		private var sparkParticlesCount:int;
		private var particleCoordinatesCount:int;
		private var appropriateParticleCoordinates:Array;
		private var sparkParticleSpringingAreaHigherLimit:Number;
		private var sparkParticleAngleSpeedLowerLimit:Number;
		private var textGlowStrength:int;
		private var particleScaleLowerLimit:Number;
		private var textShadowBlur:int;
		private var textBitmap:Bitmap;
		private var sparkParticleAlphaFadeSpeed:Number;
		private var particleGlowBlurAndStrengthValuesArray:Array;
		private var randomPosForSparkParticles:Object;
		private var particleSpeedYHigherLimit:Number;
		private var particleGlowEffectStrength:int;
		private var sparkParticlesCountHigherLimit:int;
		public var testObj_mc:MovieClip;
		private var randomPosForParticles:Object;
		private var particleSpeedX:Number;
		private var textGlowColor:uint;
		private var particleAlphaFadeSpeedLowerLimit:Number;
		private var particleSpeedY:Number;
		private var sparkParticlesCountLowerLimit:int;
		private var sparkParticleRotationLowerLimit:Number;
		private var textEffectTextFormat:TextFormat;
		private var particleGlowEffectBlur:int;
		private var textGlowQuality:int;
		private var sparkParticleScaleLowerLimit:Number;
		private var sparkParticleRotationHigherLimit:Number;
		private var sparkParticleSpeedY:Number;
		private var sparkParticleSpringingArea:Number;
		private var textShadowQuality:int;
		private var particleAlphaFadeSpeed:Number;
		private var particleAlphaFadeSpeedHigherLimit:Number;
		private var particleSpeedXHigherLimit:Number;
		private var textString:String;
		private var sparkTimerIntervalHigherLimit:int;
		private var sparkParticleRotationSpeed:Number;
		private var sparkParticleGlowColorArray:Array;
		private var particleGlowColorChoice:int;
		private var text_Color:uint;
		private var textContainerSprite:Sprite;
		private var particleSpeedXLowerLimit:Number;
		private var particlesAddedPerFrame:int;
		private var sparkParticleSpringingAreaLowerLimit:Number;
		private var textShadowDistance:int;
		private var sparkParticleGlowEffectStrength:int;
		private var sparkParticlesWillExist:Boolean;
		private var textGlowBlur:int;
		public var text_mc:TextField;
		private var particleGlowBlurAndStrengthChoice:int;
		private var text_Size:int;
		private var yPositionOffset:int;
		
		public function TextMc3()
		{
			init();
			return;
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
		
		protected function _enterFrame(event:Event) : void
		{
			var _local2:int;
			var _local3:Particle3;
			_local2 = 0;
			while (_local2 < particlesAddedPerFrame)
			{
				randomPosForParticles = appropriateParticleCoordinates[int(MathUtil.randomNumber(0, appropriateParticleCoordinates.length))];
				particleSpeedY = MathUtil.randomNumber(particleSpeedYLowerLimit, particleSpeedYHigherLimit);
				particleSpeedX = MathUtil.randomNumber(particleSpeedXLowerLimit, particleSpeedXHigherLimit);
				particleAlphaFadeSpeed = MathUtil.randomNumber(particleAlphaFadeSpeedLowerLimit, particleAlphaFadeSpeedHigherLimit);
				particleScale = MathUtil.randomNumber(particleScaleLowerLimit, particleScaleHigherLimit);
				particleGlowColorChoice = (Math.random() * particleGlowColorArray.length);
				particleGlowBlurAndStrengthChoice = (Math.random() * particleGlowBlurAndStrengthValuesArray.length);
				particleGlowEffectBlur = particleGlowBlurAndStrengthValuesArray[particleGlowBlurAndStrengthChoice][0];
				particleGlowEffectStrength = particleGlowBlurAndStrengthValuesArray[particleGlowBlurAndStrengthChoice][1];
				_local3 = new Particle3(particleSpeedX, particleSpeedY, particleAlphaFadeSpeed, particleScale, particleGlowColorArray[particleGlowColorChoice], particleGlowEffectBlur, particleGlowEffectStrength, randomPosForParticles._xPos, randomPosForParticles._yPos, this);
				_local2++;
			};
		}
		
		private function init():void
		{
			var temp1:MovieClip = new TextMc3_AS();
			text_mc = temp1.text_mc ;
			testObj_mc = temp1.testObj_mc ;
			addChild(text_mc);
			addChild(testObj_mc);
			this.mouseEnabled = false;
			textString = "by Think.i.do";
			text_Color = 16681763;
			text_Size = 60;
			textGlowColor = 0xFF0000;
			textGlowBlur = 16;
			textGlowStrength = 2;
			textGlowQuality = 3;
			textShadowBlur = 4;
			textShadowDistance = 10;
			textShadowAngle = 90;
			textShadowStrength = 1;
			textShadowQuality = 3;
			yPositionOffset = 9;
			particleCoordinatesCount = 1000;
			particlesAddedPerFrame = 3;
			particleSpeedYLowerLimit = -0.2;
			particleSpeedYHigherLimit = -0.7;
			particleSpeedXLowerLimit = -0.2;
			particleSpeedXHigherLimit = 0.2;
			particleAlphaFadeSpeedLowerLimit = 0.07;
			particleAlphaFadeSpeedHigherLimit = 0.1;
			particleScaleLowerLimit = 0.3;
			particleScaleHigherLimit = 0.9;
			particleGlowColorArray = [0xFF0000, 0xFF8800, 0xFF7700, 0xFF6600, 0xFF5500, 0xFF4400, 0xFF3300, 0xFF2200, 0xFF9900];
			particleGlowBlurAndStrengthValuesArray = [[8, 4], [16, 5], [16, 6], [8, 7], [8, 8], [16, 9], [8, 10], [16, 11], [8, 10]];
			sparkParticlesWillExist = true;
			sparkParticlesCountLowerLimit = 4;
			sparkParticlesCountHigherLimit = 15;
			sparkTimerIntervalLowerLimit = 50;
			sparkTimerIntervalHigherLimit = 200;
			sparkParticleGlowColorArray = [0xFFFF00, 0xFF0000, 0xFF8800, 0xFF7700, 0xFF6600, 0xFF5500, 0xFF4400, 0xFF3300, 0xFF2200, 0xFF9900];
			sparkParticleGlowBlurAndStrengthValuesArray = [[2, 3], [2, 1], [4, 2], [4, 3], [0, 0]];
			sparkParticleSpeedYLowerLimit = -0.5;
			sparkParticleSpeedYHigherLimit = -3;
			sparkParticleAlphaFadeSpeedLowerLimit = 0.006;
			sparkParticleAlphaFadeSpeedHigherLimit = 0.1;
			sparkParticleScaleLowerLimit = 0.3;
			sparkParticleScaleHigherLimit = 0.9;
			sparkParticleRotationLowerLimit = -5;
			sparkParticleRotationHigherLimit = 5;
			sparkParticleAngleSpeedLowerLimit = -0.15;
			sparkParticleAngleSpeedHigherLimit = 0.15;
			sparkParticleSpringingAreaLowerLimit = 7;
			sparkParticleSpringingAreaHigherLimit = 10;
			textEffectTextFormat = new TextFormat(text_mc.defaultTextFormat.font, text_Size, text_Color, false, false, false, null, null, "center");
			trace( text_mc.defaultTextFormat.font );
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
			if (sparkParticlesWillExist == true)
			{
				createSparks();
			};
			return;
		}
		
		private function createSparks() : void
		{
			sparkTimer = new Timer(int(MathUtil.randomNumber(sparkTimerIntervalLowerLimit, sparkTimerIntervalHigherLimit)), 1);
			sparkTimer.addEventListener(TimerEvent.TIMER, _onTimerEvent);
			sparkTimer.start();
		}
		
		private function _onTimerEvent(event:TimerEvent):void
		{
			var _index:int;
			var _sparkParticles3:SparkParticles3;
			sparkParticlesCount = MathUtil.randomNumber(sparkParticlesCountLowerLimit, sparkParticlesCountHigherLimit);
			randomPosForSparkParticles = appropriateParticleCoordinates[int(MathUtil.randomNumber(0, appropriateParticleCoordinates.length))];
			_index = 0;
			while (_index < sparkParticlesCount)
			{
				sparkParticleGlowColorChoice = (Math.random() * sparkParticleGlowColorArray.length);
				sparkParticleGlowBlurAndStrengthChoice = (Math.random() * sparkParticleGlowBlurAndStrengthValuesArray.length);
				sparkParticleGlowEffectBlur = sparkParticleGlowBlurAndStrengthValuesArray[sparkParticleGlowBlurAndStrengthChoice][0];
				sparkParticleGlowEffectStrength = sparkParticleGlowBlurAndStrengthValuesArray[sparkParticleGlowBlurAndStrengthChoice][1];
				sparkParticleSpeedY = MathUtil.randomNumber(sparkParticleSpeedYLowerLimit, sparkParticleSpeedYHigherLimit);
				sparkParticleAlphaFadeSpeed = MathUtil.randomNumber(sparkParticleAlphaFadeSpeedLowerLimit, sparkParticleAlphaFadeSpeedHigherLimit);
				sparkParticleScale = MathUtil.randomNumber(sparkParticleScaleLowerLimit, sparkParticleScaleHigherLimit);
				sparkParticleRotationSpeed = MathUtil.randomNumber(sparkParticleRotationLowerLimit, sparkParticleRotationHigherLimit);
				sparkParticleAngleSpeed = MathUtil.randomNumber(sparkParticleAngleSpeedLowerLimit, sparkParticleAngleSpeedHigherLimit);
				sparkParticleSpringingArea = MathUtil.randomNumber(sparkParticleSpringingAreaLowerLimit, sparkParticleSpringingAreaHigherLimit);
				_sparkParticles3 = new SparkParticles3(sparkParticleSpeedY, sparkParticleGlowColorArray[sparkParticleGlowColorChoice], sparkParticleGlowEffectBlur, sparkParticleGlowEffectStrength, sparkParticleAlphaFadeSpeed, sparkParticleScale, sparkParticleRotationSpeed, sparkParticleAngleSpeed, sparkParticleSpringingArea, MathUtil.randomNumber((randomPosForSparkParticles._xPos - 5), (randomPosForSparkParticles._xPos + 5)), MathUtil.randomNumber((randomPosForSparkParticles._yPos - 5), (randomPosForSparkParticles._yPos + 5)), this);
				_index++;
			};
			createSparks();
		}
		
		private function formatMyText(param1:TextField, param2:String) : void
		{
			var _loc_3:Boolean = false;
			var _loc_4:Boolean = true;
			param1.defaultTextFormat = textEffectTextFormat;
			param1.embedFonts = true;
			param1.autoSize = TextFieldAutoSize.LEFT;
			param1.antiAliasType = AntiAliasType.ADVANCED;
			if (_loc_4 || param1)
			{
				param1.gridFitType = GridFitType.PIXEL;
				if (!_loc_3)
				{
					param1.sharpness = 0;
					param1.selectable = false;
					param1.multiline = false;
					if (!_loc_3)
					{
						param1.wordWrap = false;
					}
				}
			}
			param1.text = param2;
			param1.x = 0;
			param1.y = 0;
			return;
		}
		
	}
}
