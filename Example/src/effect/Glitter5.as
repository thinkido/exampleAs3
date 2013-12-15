package effect 
{
    import com.thinkido.framework.utils.MathUtil;
    
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.filters.GlowFilter;
    

    public class Glitter5 extends Glitter5_AS
    {
        private var yPos:int;
        private var angleSpeed:Number;
        private var rotationSpeed:Number;
        private var alphaFadeSpeed:Number;
        private var breakOffSnowScale:Number;
        private var mc:MovieClip;
        private var glowBlur:int;
        private var xPos:int;
        private var randomFrameOfThisParticle:int;
        private var angle:Number = 0;
        private var glowColor:uint;
        private var springingArea:int;
        private var glowStrength:int;

        public function Glitter5($glowColor:uint, $glowBlur:int, $glowStrength:int, $alphaFadeSpeed:Number, $breakOffSnowScale:Number, $rotationSpeed:Number, $angleSpeed:Number, $springingArea:Number, $xPos:int, $yPos:int, $mc:MovieClip)
        {
            angle = 0;
                glowColor = $glowColor;
                glowBlur = $glowBlur;
                glowStrength = $glowStrength;
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
			randomFrameOfThisParticle = MathUtil.randomNumber(1, (this.totalFrames + 1));
			this.gotoAndStop(randomFrameOfThisParticle);
			this.x = xPos;
			this.y = yPos;
			this.alpha = 0;
			this.scaleX = (this.scaleY = breakOffSnowScale);
			this.filters = [new GlowFilter(glowColor, 1, glowBlur, glowBlur, glowStrength, 2, false, false)];
			TextMc5(mc).addChild(this);
			this.addEventListener(Event.ENTER_FRAME, _enterFrameEvent);
        }

        private function _enterFrameEvent(event:Event) : void
        {
			this.rotation = (this.rotation + rotationSpeed);
			this.alpha = (this.alpha + this.alphaFadeSpeed);
			if (this.alpha >= 1)
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
