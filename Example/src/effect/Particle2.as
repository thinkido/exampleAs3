package effect 
{
	import com.thinkido.framework.utils.MathUtil;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	
	public class Particle2 extends Particle2_AS
	{
		private var yPos:int;
		private var angleSpeed:Number;
		private var rotationSpeed:Number;
		private var particleScale:Number;
		private var alphaFadeSpeed:Number;
		private var mc:MovieClip;
		private var glowBlur:int;
		private var xPos:int;
		private var angle:Number = 0;
		private var glowColor:uint;
		private var springingArea:int;
		private var glowStrength:int;
		private var speedY:Number;
		
		public function Particle2($speedY:Number, $alphaFadeSpeed:Number, $particleScale:Number, $glowColor:uint, $glowBlur:int, $glowStrength:int, $rotationSpeed:Number, $angleSpeed:Number, $springingArea:Number, $xPos:int, $yPos:int, $mc:MovieClip)
		{
			angle = 0;
			speedY = $speedY;
			alphaFadeSpeed = $alphaFadeSpeed;
			particleScale = $particleScale;
			glowColor = $glowColor;
			glowBlur = $glowBlur;
			glowStrength = $glowStrength;
			rotationSpeed = $rotationSpeed;
			angleSpeed = $angleSpeed;
			springingArea = $springingArea;
			xPos = $xPos;
			yPos = $yPos;
			mc = $mc;
			this.gotoAndStop(int(MathUtil.randomNumber(1, (this.totalFrames + 1))));
			init();
			return;
		}
		
		private function init() : void
		{
			this.mouseEnabled = false;
			this.x = xPos;
			this.y = yPos;
			this.alpha = 0;
			this.scaleX = (this.scaleY = particleScale);
			this.filters = [new GlowFilter(glowColor, 1, glowBlur, glowBlur, glowStrength, 2, false, false)];
			TextMc2(mc).addChild(this);
			this.addEventListener(Event.ENTER_FRAME, _enterFrameEvent);
		}
		
		private function _enterFrameEvent(event:Event) : void
		{
			this.x = (xPos + (Math.sin(angle) * springingArea));
			angle = (angle + angleSpeed);
			this.y = (this.y + speedY);
			this.rotation = (this.rotation + rotationSpeed);
			this.alpha = (this.alpha + alphaFadeSpeed);
			if (this.alpha >= 0.8)
			{
				alphaFadeSpeed = (alphaFadeSpeed * -1);
			};
			if (this.alpha <= 0)
			{
				this.removeEventListener(Event.ENTER_FRAME, _enterFrameEvent);
				mc.removeChild(this);
			};
		}
		
	}
}
