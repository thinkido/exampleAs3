package effect 
{
	import com.thinkido.framework.utils.MathUtil;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	
	public class Particle1 extends Particle1_AS
	{
		private var yPos:int;
		private var particleScale:Number;
		private var alphaFadeSpeed:Number;
		private var blurQuality:Number;
		private var mc:MovieClip;
		private var xPos:int;
		private var blurX:Number;
		private var blurY:Number;
		private var speedY:Number;
		
		public function Particle1($speedY:Number, $alphaFadeSpeed:Number, $particleScale:Number, $blurX:int, $blurY:int, $blurQuality:Number, $xPos:int, $yPos:int, $mc:MovieClip)
		{
			speedY = $speedY;
			alphaFadeSpeed = $alphaFadeSpeed;
			particleScale = $particleScale;
			blurX = $blurX;
			blurY = $blurY;
			blurQuality = $blurQuality;
			xPos = $xPos;
			yPos = $yPos;
			mc = $mc;
			init();
			return;
		}
		
		private function init() : void
		{
			this.mouseEnabled = false;
			this.gotoAndStop(int(MathUtil.randomNumber(1, (this.totalFrames + 1))));
			this.x = xPos;
			this.y = yPos;
			this.alpha = 0;
			this.scaleX = (this.scaleY = particleScale);
			this.filters = [new BlurFilter(blurX, blurY, blurQuality)];
			mc.addChild(this);
			this.addEventListener(Event.ENTER_FRAME, _enterFrameEvent);
		}
		
		private function _enterFrameEvent(event:Event) : void
		{
			this.y = (this.y + speedY);
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
			return;
		}
		
	}
}
