package effect 
{
	import com.thinkido.framework.common.vo.StyleData;
	import com.thinkido.framework.utils.DrawUtil;
	import com.thinkido.framework.utils.MathUtil;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	
	public class TextMc5 extends MovieClip
	{
		private var glitterParticlesExist:Boolean;
		private var textShadowStrength:int;
		private var glitterTimerIntervalHigherLimit:int;
		private var textShadowAngle:int;
		private var glitterParticleScaleLowerLimit:Number;
		private var glitterParticleAlphaFadeSpeed:Number;
		private var glitterParticleAlphaFadeSpeedHigherLimit:Number;
		private var glitterParticleRotationHigherLimit:Number;
		private var jewellerysExist:Boolean;
		private var testObjBitmapData:BitmapData;
		private var glitterTimer:Timer;
		private var textBitmapData:BitmapData;
		private var jewelleryCount:int;
		private var testObjBitmap:Bitmap;
		private var glitterParticleGlowBlurAndStrengthChoice:int;
		private var glitterParticleScaleHigherLimit:Number;
		private var glitterParticleScale:Number;
		private var glitterParticleAngleSpeedHigherLimit:Number;
		private var glitterParticleSpeedYHigherLimit:Number;
		private var textEffectFont:String;
		private var particleCoordinatesCount:int;
		private var jewelleryYOffset:int;
		private var randomPosForJewellery:Object;
		private var appropriateParticleCoordinates:Array;
		private var glitterParticleAlphaFadeSpeedLowerLimit:Number;
		private var glitterParticleRotationLowerLimit:Number;
		private var textGlowStrength:int;
		private var textShadowBlur:int;
		private var glitterParticleSpringingAreaLowerLimit:Number;
		private var glitterParticleSpeedY:Number;
		private var textBitmap:Bitmap;
		private var glitterParticleSpeedYLowerLimit:Number;
		private var glitterParticleGlowColorArray:Array;
		private var jewelleryAlphaLowestValue:Number;
		private var glitterParticleSpringingAreaHigherLimit:Number;
		public var testObj_mc:MovieClip;
		private var glitterParticleGlowColorChoice:int;
		private var textGlowColor:uint;
		private var glitterParticleAngleSpeedLowerLimit:Number;
		private var randomPosForGlitterParticles:Object;
		private var glitterParticleGlowEffectStrength:int;
		private var jewelleryPositionsArray:Array;
		private var glitterParticleSpringingArea:Number;
		private var textEffectTextFormat:TextFormat;
		private var textGlowQuality:int;
		private var jewelleryGlowColorArray:Array;
		private var jewelleryScaleLowerLimit:Number;
		private var glitterTimerIntervalLowerLimit:int;
		private var jewelleryXOffset:int;
		private var glitterParticleGlowBlurAndStrengthValuesArray:Array;
		private var glitterParticleAngleSpeed:Number;
		private var textShadowQuality:int;
		private var textString:String;
		private var jewelleryAlphaHighestValue:Number;
		private var text_Color:uint;
		private var glitterParticleRotationSpeed:Number;
		private var textContainerSprite:Sprite;
		private var textShadowDistance:int;
		private var jewelleryGlowBlurAndStrengthValuesArray:Array;
		private var glitterParticleGlowEffectBlur:int;
		private var textGlowBlur:int;
		private var jewelleryScaleHigherLimit:Number;
		public var text_mc:TextField;
		private var jewelleryParticleGlowColorChoice:int;
		private var text_Size:int;
		private var yPositionOffset:int;
		private var jewelleryParticleGlowBlurAndStrengthChoice:int;
		
		public function TextMc5()
		{
			init();
			return;
		}
		
		private function createAppropriatePositionsForParticlesAccordingToTextBitmap() : void
		{
			var _index:int;
			var _x:int;
			var _y:int;
			appropriateParticleCoordinates = new Array();
			_index = 0;
			while (_index < particleCoordinatesCount)
			{
				_x = MathUtil.randomNumber(0, this.width);
				_y = MathUtil.randomNumber(0, this.height);
				testObjBitmap = new Bitmap(testObjBitmapData);
				textContainerSprite.addChild(testObjBitmap);
				testObjBitmap.x = _x ;
				testObjBitmap.y = _y ;
				if (!textBitmapData.hitTest(new Point(textBitmap.x, textBitmap.y), 1, testObjBitmapData, new Point(testObjBitmap.x, testObjBitmap.y), 1))
				{
					textContainerSprite.removeChild(testObjBitmap);
				}
				else
				{
					textContainerSprite.removeChild(testObjBitmap);
					appropriateParticleCoordinates.push({
						"_xPos":_x,
						"_yPos":(_y + yPositionOffset)
					});
				};
				_index++;
			};
			return;
		}
		
		private function init():void
		{
			var temp1:MovieClip = new TextMc5_AS();
			text_mc = temp1.text_mc ;
			testObj_mc = temp1.testObj_mc ;
			addChild(text_mc);
			addChild(testObj_mc);
			this.mouseEnabled = false;
			textString = "Thinkido";
			text_Color = 9078674;
			text_Size = 120;
			textGlowColor = 0xFFFFFF;
			textGlowBlur = 32;
			textGlowStrength = 0;
			textGlowQuality = 3;
			textShadowBlur = 4;
			textShadowDistance = 10;
			textShadowAngle = 90;
			textShadowStrength = 1;
			textShadowQuality = 3;
			yPositionOffset = 0;
			particleCoordinatesCount = 3000;
			glitterParticlesExist = true;
			glitterTimerIntervalLowerLimit = 100;
			glitterTimerIntervalHigherLimit = 500;
			glitterParticleGlowColorArray = [0xFF0000, 5733369, 16094472, 16727821, 0xE8008F, 0xFFFF00];
			glitterParticleGlowBlurAndStrengthValuesArray = [[16, 3], [16, 2], [20, 3]];
			glitterParticleSpeedYLowerLimit = 0;
			glitterParticleSpeedYHigherLimit = 0;
			glitterParticleAlphaFadeSpeedLowerLimit = 0.03;
			glitterParticleAlphaFadeSpeedHigherLimit = 0.06;
			glitterParticleScaleLowerLimit = 1;
			glitterParticleScaleHigherLimit = 2;
			glitterParticleRotationLowerLimit = -2;
			glitterParticleRotationHigherLimit = 2;
			glitterParticleAngleSpeedLowerLimit = -0.12;
			glitterParticleAngleSpeedHigherLimit = 0.12;
			glitterParticleSpringingAreaLowerLimit = 7;
			glitterParticleSpringingAreaHigherLimit = 10;
			jewellerysExist = true;
			jewelleryCount = 450;
			jewelleryScaleLowerLimit = 0.5;
			jewelleryScaleHigherLimit = 0.7;
			jewelleryYOffset = 2;
			jewelleryXOffset = 2;
			jewelleryAlphaLowestValue = 1;
			jewelleryAlphaHighestValue = 1;
			jewelleryGlowColorArray = [0xFFFFFF, 0xFFFFFF, 0xFF0000, 5733369, 16094472, 16727821, 0xE8008F, 0xFFFF00];
			jewelleryGlowBlurAndStrengthValuesArray = [[16, 1], [16, 2], [8, 2], [8, 3], [16, 5], [16, 3]];
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
			if (jewellerysExist == true)
			{
				createJewelleryParticles();
			};
			if (glitterParticlesExist == true)
			{
				createglitterParticles();
			};
		}
		
		private function createglitterParticles() : void
		{
			glitterTimer = new Timer(int(MathUtil.randomNumber(glitterTimerIntervalLowerLimit, glitterTimerIntervalHigherLimit)), 1);
			glitterTimer.addEventListener(TimerEvent.TIMER, _onTimerEvent);
			glitterTimer.start();
		}
		
		private function _onTimerEvent(event:TimerEvent): void
		{
			var _loc_3:Boolean = true;
			var _loc_4:Boolean = false;
			var _glitter5:Glitter5 = null;
			if (jewellerysExist)
			{
				randomPosForGlitterParticles = jewelleryPositionsArray[int(MathUtil.randomNumber(0, jewelleryPositionsArray.length))];
			}
			else
			{
				randomPosForGlitterParticles = appropriateParticleCoordinates[int(MathUtil.randomNumber(0, appropriateParticleCoordinates.length))];
			};
			glitterParticleGlowColorChoice = (Math.random() * glitterParticleGlowColorArray.length);
			glitterParticleGlowBlurAndStrengthChoice = (Math.random() * glitterParticleGlowBlurAndStrengthValuesArray.length);
			glitterParticleGlowEffectBlur = glitterParticleGlowBlurAndStrengthValuesArray[glitterParticleGlowBlurAndStrengthChoice][0];
			glitterParticleGlowEffectStrength = glitterParticleGlowBlurAndStrengthValuesArray[glitterParticleGlowBlurAndStrengthChoice][1];
			glitterParticleSpeedY = MathUtil.randomNumber(glitterParticleSpeedYLowerLimit, glitterParticleSpeedYHigherLimit);
			glitterParticleAlphaFadeSpeed = MathUtil.randomNumber(glitterParticleAlphaFadeSpeedLowerLimit, glitterParticleAlphaFadeSpeedHigherLimit);
			glitterParticleScale = MathUtil.randomNumber(glitterParticleScaleLowerLimit, glitterParticleScaleHigherLimit);
			glitterParticleRotationSpeed = MathUtil.randomNumber(glitterParticleRotationLowerLimit, glitterParticleRotationHigherLimit);
			glitterParticleAngleSpeed = MathUtil.randomNumber(glitterParticleAngleSpeedLowerLimit, glitterParticleAngleSpeedHigherLimit);
			glitterParticleSpringingArea = MathUtil.randomNumber(glitterParticleSpringingAreaLowerLimit, glitterParticleSpringingAreaHigherLimit);
			_glitter5 = new Glitter5(glitterParticleGlowColorArray[glitterParticleGlowColorChoice], glitterParticleGlowEffectBlur, glitterParticleGlowEffectStrength, glitterParticleAlphaFadeSpeed, glitterParticleScale, glitterParticleRotationSpeed, glitterParticleAngleSpeed, glitterParticleSpringingArea, randomPosForGlitterParticles._xPos + jewelleryXOffset, randomPosForGlitterParticles._yPos + jewelleryYOffset, this);
			createglitterParticles();
			return;
		}
		
		private function createJewelleryParticles(): void
		{
			var _local1:Array;
			var _local2:int;
			var _local3:int;
			var _local4:int;
			var _local5:Jewellery5_AS;
			jewelleryPositionsArray = new Array();
			_local1 = [1, -1];
			_local4 = 0;
			var _tempIndex:int ;
			while (_local4 < jewelleryCount)
			{
				_local5 = new Jewellery5_AS();
				jewelleryParticleGlowColorChoice = (Math.random() * jewelleryGlowColorArray.length);
				jewelleryParticleGlowBlurAndStrengthChoice = (Math.random() * jewelleryGlowBlurAndStrengthValuesArray.length);
				jewelleryGlowBlurAndStrengthValuesArray[jewelleryParticleGlowBlurAndStrengthChoice][0];
				jewelleryGlowBlurAndStrengthValuesArray[jewelleryParticleGlowBlurAndStrengthChoice][1];
				_local5.filters = [new GlowFilter(uint(jewelleryGlowColorArray[jewelleryParticleGlowColorChoice]), 1, jewelleryGlowBlurAndStrengthValuesArray[jewelleryParticleGlowBlurAndStrengthChoice][0], jewelleryGlowBlurAndStrengthValuesArray[jewelleryParticleGlowBlurAndStrengthChoice][0], jewelleryGlowBlurAndStrengthValuesArray[jewelleryParticleGlowBlurAndStrengthChoice][1], 3, false, false), new DropShadowFilter(2, 45, 0, 1, 1, 1, 1, 3, false, false, false)];
				_local5.alpha = MathUtil.randomNumber(jewelleryAlphaLowestValue, jewelleryAlphaHighestValue);
				_local5.gotoAndStop(int(((Math.random() * _local5.totalFrames) + 1)));
				_local2 = int((Math.random() * _local1.length));
				_local5.scaleX = (_local1[_local2] * MathUtil.randomNumber(jewelleryScaleLowerLimit, jewelleryScaleHigherLimit));
				_local5.scaleY = Math.abs(_local5.scaleX);
				_tempIndex = MathUtil.randomNumber(0, appropriateParticleCoordinates.length) ;
				randomPosForJewellery = appropriateParticleCoordinates[_tempIndex];
				if( randomPosForJewellery ==null ){
					continue ;
				}
				_local5.x = (randomPosForJewellery._xPos + jewelleryXOffset);
				_local5.y = (randomPosForJewellery._yPos + jewelleryYOffset);
				jewelleryPositionsArray.push(randomPosForJewellery);
				addChild(_local5);
				_local4++;
			};
			return;
		}
		
		private function formatMyText(param1:TextField, param2:String) : void
		{
			param1.defaultTextFormat = textEffectTextFormat;
			param1.embedFonts = true;
			param1.autoSize = TextFieldAutoSize.LEFT;
			param1.antiAliasType = AntiAliasType.ADVANCED;
			param1.gridFitType = GridFitType.PIXEL;
			param1.sharpness = 0;
			param1.selectable = false;
			param1.multiline = false;
			param1.wordWrap = false;
			param1.text = param2;
			param1.x = 0;
			param1.y = 0;
			return;
		}
		
	}
}
