package temp
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	public class TempRipeButton extends MovieClip
	{
		public var your_text:TextField ;
		public function TempRipeButton()
		{
			var mc:MovieClip = new MovieClip();
			mc.graphics.beginFill(0xffcc33,0.8);
			mc.graphics.drawRect(0,0,40,20);
			mc.graphics.endFill() ;
			your_text = new TextField();
			mc.addChild(your_text);
		}
	}
}