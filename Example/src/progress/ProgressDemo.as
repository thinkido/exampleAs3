package progress
{
	import com.thinkido.example.Application;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import ui.progress.WelcomeProgress;
	
	public class ProgressDemo extends Application
	{
		
		public static const CARTOON_END:String = "Welcome_cartoon_end" ;
		public function ProgressDemo()
		{
			
		}

		protected override function initApp():void
		{
			super.initApp();
			var wel:WelcomeProgress = new WelcomeProgress();
			this.addChild(wel) ;
			wel.start();
			this.dispatchEvent( new Event(CARTOON_END));
			wel.addEventListener(CARTOON_END,dotest);
		}

		
		protected function dotest(event:Event):void
		{
			trace("tset");
		}
	}
}