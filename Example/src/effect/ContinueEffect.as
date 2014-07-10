package effect
{
	import flash.display.Sprite;
	
	import lm.mui.controls.GImage;
	
	public class ContinueEffect extends Sprite
	{
		private var eff:GImage ;
		public function ContinueEffect()
		{
			super();
			eff = new GImage();
			eff.width = this.stage.stageWidth ;
			eff.height = this.stage.stageHeight ;
			eff.imgUrl = "" ;
			addChild(eff);
		
		}
		
		
		
	}
}