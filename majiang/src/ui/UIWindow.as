package ui
{
	import game.control.WindowManager;
	import game.model.Global;
	
	import starling.display.Image;
	
	public class UIWindow extends UICurrentView
	{
	
		public function addDarkBg():void
		{
			addChildAt(new Image(Global.imgDarkBg), 0);
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
