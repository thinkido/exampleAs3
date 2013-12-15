package effect 
{
    import com.thinkido.framework.utils.MathUtil;
    
    import flash.display.MovieClip;
    import flash.events.Event;
    

    public class BreakOffSnowParticle4 extends BreakOffSnowParticle4_AS
    {
        private var yPos:int;
        private var angleSpeed:Number;
        private var rotationSpeed:Number;
        private var alphaFadeSpeed:Number;
        private var breakOffSnowScale:Number;
        private var mc:MovieClip;
        private var xPos:int;
        private var randomFrameOfThisParticle:int;
        private var angle:Number = 0;
        private var springingArea:int;
        private var speedY:Number;

        public function BreakOffSnowParticle4($speedY:Number, $alphaFadeSpeed:Number, $breakOffSnowScale:Number, $rotationSpeed:Number, $angleSpeed:Number, $springingArea:Number, $xPos:int, $yPos:int, $mc:MovieClip)
        {
            angle = 0;
            speedY = $speedY;
            alphaFadeSpeed = $alphaFadeSpeed;
            breakOffSnowScale = $breakOffSnowScale;
            rotationSpeed = $rotationSpeed;
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
            randomFrameOfThisParticle = MathUtil.random(1, (this.totalFrames + 1));
            this.gotoAndStop(randomFrameOfThisParticle);
            this.x = xPos;
            this.y = yPos;
            this.alpha = 1;
            this.scaleY = breakOffSnowScale;
            this.scaleX = breakOffSnowScale;
			TextMc4(mc).addChild(this);
            this.addEventListener(Event.ENTER_FRAME, _enterFrameEvent);
            return;
        }
		private var particale:MovieClip ;
		
        private function _enterFrameEvent(event:Event) : void
        {
			this.x = (xPos + (Math.sin(angle) * springingArea));
			angle = (angle + angleSpeed);
			this.y = (this.y + speedY);
			this.alpha = (this.alpha - this.alphaFadeSpeed);
			if (this.alpha <= 0)
			{
				this.removeEventListener(Event.ENTER_FRAME, _enterFrameEvent);
				mc.removeChild(this);
			};
        }

    }
}
