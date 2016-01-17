package game.model.action
{
	
	import starling.display.DisplayObject;
	
	public class ActionHideLater extends ActionInterval
	{
	
		private var _displayObject:DisplayObject;
	
		public function ActionHideLater(displayObject:DisplayObject, dur:Number)
		{
			super(dur);
			_displayObject = displayObject;
			_displayObject.setPosition((Global.SCREEN_WIDTH - displayObject.getWidth()) / 2, (Global.SCREEN_HEIGHT - displayObject.getHeight()) / 2 - 30);
		}
	
		public function onStart():void
		{
			Global.effectLayer.addChild(_displayObject);
			super.onStart();
		}
	
		public function onComplete():void
		{
			super.onComplete();
			Global.effectLayer.removeChild(_displayObject);
		}
	
		public function getReverseAction():Action
		{
			return new ActionHideLater(_displayObject, _dur);
		}
	
		public function onDispose():void
		{
			_displayObject = null;
		}
	}
}
