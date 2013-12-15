package effect 
{
	import com.thinkido.framework.utils.MathUtil;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Particle4 extends Particle4_AS
	{
		private var yPos:int;
		private var particleScale:Number;
		private var alphaFadeSpeed:Number;
		private var mc:MovieClip;
		private var xPos:int;
		private var randomFrameOfThisParticle:uint;
		private var speedX:Number;
		private var speedY:Number;
		
		public function Particle4($speedX:Number, $speedY:Number, $alphaFadeSpeed:Number, $particleScale:Number, $xPos:int, $yPos:int, $mc:MovieClip)
		{
			speedX = $speedX;
			speedY = $speedY;
			alphaFadeSpeed = $alphaFadeSpeed;
			particleScale = $particleScale;
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
			randomFrameOfThisParticle = MathUtil.randomNumber(1, (this.totalFrames + 1));
			this.gotoAndStop(randomFrameOfThisParticle);
			TextMc4(mc).addChild(this);
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
