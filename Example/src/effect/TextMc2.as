package effect 
{
	import com.thinkido.framework.utils.MathUtil;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class TextMc2 extends MovieClip
	{
		private var particleSpringingArea:Number;
		private var textShadowStrength:int;
		private var particleRotationSpeedLowerLimit:int;
		private var textShadowAngle:int;
		private var particleScaleHigherLimit:Number;
		private var particleGlowColorArray:Array;
		private var testObjBitmapData:BitmapData;
		private var particleAngleSpeed:Number;
		private var particleScale:Number;
		private var particleSpringingAreaLowerLimit:Number;
		private var particleRotationSpeed:int;
		private var textBitmapData:BitmapData;
		private var testObjBitmap:Bitmap;
		private var particleAngleSpeedHigherLimit:Number;
		private var textEffectFont:String;
		private var particleCoordinatesCount:int;
		private var particleRotationSpeedHigherLimit:int;
		private var appropriateParticleCoordinates:Array;
		private var textGlowStrength:int;
		private var particleScaleLowerLimit:Number;
		private var textShadowBlur:int;
		private var textBitmap:Bitmap;
		private var particleGlowBlurAndStrengthValuesArray:Object;
		private var particleGlowEffectStrength:int;
		public var testObj_mc:MovieClip;
		private var textGlowColor:uint;
		private var particleAlphaFadeSpeedLowerLimit:Number;
		private var particleYSpeedHigherLimit:Number;
		private var particleGlowEffectBlur:int;
		private var particleAngleSpeedLowerLimit:Number;
		private var randomPosFromArray:Object;
		private var textEffectTextFormat:TextFormat;
		private var textGlowQuality:int;
		private var particleYSpeed:Number;
		private var particleSpringingAreaHigherLimit:Number;
		private var textShadowQuality:int;
		private var particleAlphaFadeSpeed:Number;
		private var particleAlphaFadeSpeedHigherLimit:Number;
		private var textString:String;
		private var text_Color:uint;
		private var textContainerSprite:Sprite;
		private var particleGlowColorChoice:int;
		private var particlesAddedPerFrame:int;
		private var textShadowDistance:int;
		private var particleYSpeedLowerLimit:Number;
		private var textGlowBlur:int;
		public var text_mc:TextField;
		private var particleGlowBlurAndStrengthChoice:int;
		private var text_Size:int;
		private var yPositionOffset:int;
		
		public function TextMc2()
		{
			init();
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
			var _frame:int = 0;
			var _particle2:Particle2 = null;
			while (_frame < particlesAddedPerFrame)
			{
				randomPosFromArray = appropriateParticleCoordinates[int(MathUtil.randomNumber(0, (appropriateParticleCoordinates.length - 1)))];
				particleYSpeed = MathUtil.randomNumber(particleYSpeedLowerLimit, particleYSpeedHigherLimit);
				particleAngleSpeed = MathUtil.randomNumber(particleAngleSpeedLowerLimit, particleAngleSpeedHigherLimit);
				particleSpringingArea = MathUtil.randomNumber(particleSpringingAreaLowerLimit, particleSpringingAreaHigherLimit);
				particleScale = MathUtil.randomNumber(particleScaleLowerLimit, particleScaleHigherLimit);
				particleAlphaFadeSpeed = MathUtil.randomNumber(particleAlphaFadeSpeedLowerLimit, particleAlphaFadeSpeedHigherLimit);
				particleGlowColorChoice = Math.random() * particleGlowColorArray.length;
				particleGlowBlurAndStrengthChoice = Math.random() * particleGlowBlurAndStrengthValuesArray.length;
				particleGlowEffectBlur = particleGlowBlurAndStrengthValuesArray[particleGlowBlurAndStrengthChoice][0];
				particleGlowEffectStrength = particleGlowBlurAndStrengthValuesArray[particleGlowBlurAndStrengthChoice][1];
				particleRotationSpeed = MathUtil.randomNumber(particleRotationSpeedLowerLimit, particleRotationSpeedHigherLimit);
				_particle2 = new Particle2(particleYSpeed, particleAlphaFadeSpeed, particleScale, particleGlowColorArray[particleGlowColorChoice], particleGlowEffectBlur, particleGlowEffectStrength, particleRotationSpeed, particleAngleSpeed, particleSpringingArea, randomPosFromArray._xPos, randomPosFromArray._yPos, this);
				_frame++;
			}
			return;
		}
		
		private function init():void
		{
			var temp1:MovieClip = new TextMc2_AS();
			text_mc = temp1.text_mc ;
			testObj_mc = temp1.testObj_mc ;
			addChild(text_mc);
			addChild(testObj_mc);
			var _loc_1:Boolean = true;
			var _loc_2:Boolean = false;
			this.mouseEnabled = false;
			textString = "Fairy";
			text_Color = 14931948;
			text_Size = 120;
			textGlowColor = 12981466;
			textGlowBlur = 16;
			textGlowStrength = 1;
			textGlowQuality = 3;
			textShadowBlur = 4;
			textShadowDistance = 10;
			textShadowAngle = 90;
			textShadowStrength = 1;
			textShadowQuality = 3;
			yPositionOffset = 9;
			particleCoordinatesCount = 1000;
			particlesAddedPerFrame = 3;
			particleYSpeedLowerLimit = -1;
			particleYSpeedHigherLimit = -0.2;
			particleAngleSpeedLowerLimit = 0.1;
			particleAngleSpeedHigherLimit = 0.3;
			particleSpringingAreaLowerLimit = 1;
			particleSpringingAreaHigherLimit = 7;
			particleAlphaFadeSpeedLowerLimit = 0.06;
			particleAlphaFadeSpeedHigherLimit = 0.1;
			particleScaleLowerLimit = 0.4;
			particleScaleHigherLimit = 0.8;
			particleGlowColorArray = [14723321, 12337649, 12552439, 14314239, 11700991, 13486056, 16777215];
			particleGlowBlurAndStrengthValuesArray = [[8, 4], [16, 5], [16, 6], [8, 7], [8, 8], [16, 9], [16, 10], [16, 11], [16, 12], [16, 13]];
			particleRotationSpeedLowerLimit = -5;
			particleRotationSpeedHigherLimit = 5;
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
			return;
		}
		
		private function formatMyText(param1:TextField, param2:String) : void
		{
			var _loc_3:Boolean = true;
			var _loc_4:Boolean = false;
			param1.defaultTextFormat = textEffectTextFormat;
			param1.embedFonts = true;
			if (_loc_3 || this)
			{
				param1.autoSize = TextFieldAutoSize.LEFT;
				param1.antiAliasType = AntiAliasType.ADVANCED;
				if (_loc_3)
				{
					param1.gridFitType = GridFitType.PIXEL;
					param1.sharpness = 0;
					param1.selectable = false;
				}
			}
			param1.multiline = false;
			param1.wordWrap = false;
			param1.text = param2;
			param1.x = 0;
			param1.y = 0;
			return;
		}
		
	}
}
