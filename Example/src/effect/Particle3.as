package effect 
{
	import com.thinkido.framework.utils.MathUtil;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	
	public class Particle3 extends Particle3_AS
	{
		private var glowEffectBlur:int;
		private var mc:MovieClip;
		private var yPos:int;
		private var particleScale:Number;
		private var alphaFadeSpeed:Number;
		private var glowEffectColor:uint;
		private var xPos:int;
		private var randomFrameOfThisParticle:uint;
		private var glowEffectStrength:int;
		private var speedX:Number;
		private var speedY:Number;
		
		public function Particle3($speedX:Number, $speedY:Number, $alphaFadeSpeed:Number, $particleScale:Number, $glowEffectColor:uint, $glowEffectBlur:int, $glowEffectStrength:int, $xPos:int, $yPos:int, $mc:MovieClip)
		{
			speedX = $speedX;
			speedY = $speedY;
			alphaFadeSpeed = $alphaFadeSpeed;
			particleScale = $particleScale;
			glowEffectColor = $glowEffectColor;
			glowEffectBlur = $glowEffectBlur;
			glowEffectStrength = $glowEffectStrength;
			xPos = $xPos;
			yPos = $yPos;
			mc = $mc;
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
			this.filters = [new GlowFilter(glowEffectColor, 1, glowEffectBlur, glowEffectBlur, glowEffectStrength, 2, false, false)];
			randomFrameOfThisParticle = MathUtil.randomNumber(1, (this.totalFrames + 1));
			this.gotoAndStop(randomFrameOfThisParticle);
			TextMc3(mc).addChild(this);
			this.addEventListener(Event.ENTER_FRAME, _enterFrameEvent);
		}
		private function _enterFrameEvent(event:Event) : void
		{
			this.x = (this.x + speedX);
			this.y = (this.y + speedY);
			this.alpha = (this.alpha + this.alphaFadeSpeed);
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
