package effect 
{
	import com.thinkido.framework.utils.MathUtil;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	
	public class SparkParticles3 extends SparkParticles3_AS
	{
		private var yPos:int;
		private var angleSpeed:Number;
		private var rotationSpeed:Number;
		private var alphaFadeSpeed:Number;
		private var sparkScale:Number;
		private var mc:MovieClip;
		private var glowBlur:int;
		private var xPos:int;
		private var randomFrameOfThisParticle:int;
		private var angle:Number = 0;
		private var glowColor:uint;
		private var springingArea:int;
		private var glowStrength:int;
		private var speedY:Number;
		
		public function SparkParticles3($speedY:Number, $glowColor:uint, $glowBlur:int, $glowStrength:int, $alphaFadeSpeed:Number, $sparkScale:Number, param7:Number, $angleSpeed:Number, $springingArea:Number, $xPos:int, $yPos:int, $mc:MovieClip)
		{
			angle = 0;
			speedY = $speedY;
			glowColor = $glowColor;
			glowBlur = $glowBlur;
			glowStrength = $glowStrength;
			alphaFadeSpeed = $alphaFadeSpeed;
			sparkScale = $sparkScale;
			rotationSpeed = param7;
			angleSpeed = $angleSpeed;
			springingArea = $springingArea;
			xPos = $xPos;
			yPos = $yPos;
			mc = $mc;
			init();
			return;
		}
		
		private function init() : void
		{
			this.mouseEnabled = false;
			randomFrameOfThisParticle = MathUtil.randomNumber(1, (this.totalFrames + 1));
			this.gotoAndStop(randomFrameOfThisParticle);
			this.x = xPos;
			this.y = yPos;
			this.alpha = 1;
			this.scaleX = (this.scaleY = sparkScale);
			this.filters = [new GlowFilter(glowColor, 1, glowBlur, glowBlur, glowStrength, 2, false, false)];
			TextMc3(mc).addChild(this);
			this.addEventListener(Event.ENTER_FRAME, _enterFrameEvent);
		}
		
		private function _enterFrameEvent(_arg1:Event):void
		{
			this.x = (xPos + (Math.sin(angle) * springingArea));
			angle = (angle + angleSpeed);
			this.y = (this.y + speedY);
			this.rotation = (this.rotation + rotationSpeed);
			this.alpha = (this.alpha - this.alphaFadeSpeed);
			if (this.alpha <= 0)
			{
				this.removeEventListener(Event.ENTER_FRAME, _enterFrameEvent);
				mc.removeChild(this);
			};
		}
		
	}
}
