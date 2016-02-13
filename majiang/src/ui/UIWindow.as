package ui
{
	import game.control.WindowManager;
	
	import managers.ResManager;
	
	import starling.display.Image;
	
	public class UIWindow extends UICurrentView
	{
	
		public function addDarkBg():void
		{
//			addChildAt(new Image(Global.imgDarkBg), 0);
			this.addChildAt(new Image(ResManager.imgDarkBg), 0);
		}
	
		/**
		 * их╗п
		 */
		override public function onGoBack():void
		{
			WindowManager.getInstance().closeCurWindow();
		}
	}
}
