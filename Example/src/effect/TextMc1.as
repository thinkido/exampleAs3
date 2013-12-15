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
	
	public class TextMc1 extends MovieClip
	{
		private var textShadowStrength:int;
		private var particleXBlur:Number;
		private var textShadowAngle:int;
		private var particleScaleHigherLimit:Number;
		private var particleBlurQuality:Number;
		private var testObjBitmapData:BitmapData;
		private var particleScale:Number;
		private var textBitmapData:BitmapData;
		private var testObjBitmap:Bitmap;
		private var textEffectFont:String;
		private var particleCoordinatesCount:int;
		private var appropriateParticleCoordinates:Array;
		private var textGlowStrength:int;
		private var particleScaleLowerLimit:Number;
		private var textShadowBlur:int;
		private var textBitmap:Bitmap;
		public var testObj_mc:MovieClip;
		private var textGlowColor:uint;
		private var particleAlphaFadeSpeedLowerLimit:Number;
		private var particleYSpeedHigherLimit:Number;
		private var randomPosFromArray:Object;
		private var textEffectTextFormat:TextFormat;
		private var textGlowQuality:int;
		private var particleYSpeed:Number;
		private var textShadowQuality:int;
		private var particleAlphaFadeSpeed:Number;
		private var particleAlphaFadeSpeedHigherLimit:Number;
		private var particleYBlur:Number;
		private var textString:String;
		private var text_Color:uint;
		private var textContainerSprite:Sprite;
		private var particlesAddedPerFrame:int;
		private var textShadowDistance:int;
		private var particleYSpeedLowerLimit:Number;
		private var textGlowBlur:int;
		public var text_mc:TextField;
		private var text_Size:int;
		private var yPositionOffset:int;
		
		public function TextMc1()
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
				while (true)
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
						break;
					};
				};
				_index++;
			};
			return;
		}
		
		protected function _enterFrame(event:Event) : void
		{
			var _index:int;
			var _particle:Particle1;
			_index = 0;
			while (_index < particlesAddedPerFrame)
			{
				randomPosFromArray = appropriateParticleCoordinates[int(MathUtil.randomNumber(0, (appropriateParticleCoordinates.length - 1)))];
				particleYSpeed = MathUtil.randomNumber(particleYSpeedLowerLimit, particleYSpeedHigherLimit);
				particleAlphaFadeSpeed = MathUtil.randomNumber(particleAlphaFadeSpeedLowerLimit, particleAlphaFadeSpeedHigherLimit);
				particleScale = MathUtil.randomNumber(particleScaleLowerLimit, particleScaleHigherLimit);
				_particle = new Particle1(particleYSpeed, particleAlphaFadeSpeed, particleScale, particleXBlur, particleYBlur, particleBlurQuality, randomPosFromArray._xPos, randomPosFromArray._yPos, this);
				_index++;
			};
		}
		
		private function init():void
		{
			var temp1:MovieClip = new TextMc1_AS();
			text_mc = temp1.text_mc ;
			testObj_mc = temp1.testObj_mc ;
			addChild(text_mc);
			addChild(testObj_mc);
			this.mouseEnabled = false;
			textString = "SMOKE";
			text_Color = 14106650;
			text_Size = 80;
			textGlowColor = 13421772;
			textGlowBlur = 8;
			textGlowStrength = 3;
			textGlowQuality = 3;
			textShadowBlur = 4;
			textShadowDistance = 10;
			textShadowAngle = 90;
			textShadowStrength = 1;
			textShadowQuality = 3;
			particleCoordinatesCount = 1000;
			particlesAddedPerFrame = 10;
			particleYSpeedLowerLimit = -0.2;
			particleYSpeedHigherLimit = -0.7;
			particleAlphaFadeSpeedLowerLimit = 0.06;
			particleAlphaFadeSpeedHigherLimit = 0.1;
			particleScaleLowerLimit = 0.1;
			particleScaleHigherLimit = 0.8;
			particleXBlur = 4;
			particleYBlur = 8;
			particleBlurQuality = 1;
			yPositionOffset = 9;
			textEffectTextFormat = new TextFormat(text_mc.defaultTextFormat.font, 90, 14106650, false, false, false, null, null, "left");
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
		
		private function formatMyText($tf:TextField, $content:String) : void
		{
			var _loc_3:Boolean = true;
			var _loc_4:Boolean = false;
			if (!_loc_4)
			{
				$tf.defaultTextFormat = textEffectTextFormat;
				if (!(_loc_4 && _loc_3))
				{
					$tf.embedFonts = true;
					$tf.gridFitType = GridFitType.PIXEL;
					$tf.sharpness = 0;
				}
				$tf.antiAliasType = AntiAliasType.ADVANCED;
				$tf.autoSize = TextFieldAutoSize.LEFT;
				$tf.selectable = false;
				if (_loc_3)
				{
					$tf.multiline = false;
				}
				$tf.wordWrap = false;
				$tf.text = $content;
				$tf.x = 0;
			}
			$tf.y = 0;
			return;
		}
		
	}
}
