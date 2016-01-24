package game.model.action
{
	import game.model.callback.CallbackO;
	
	
	public final class ActionImmediately extends Action
	{
	
		protected var _callback:CallbackO;
	
		public function ActionImmediately(callback:CallbackO)
		{
			_callback = callback;
		}
	
		override public function onStep():Boolean
		{
			return true;
		}
	
		override public function onStart():void
		{
	
		}
	
		override public function onComplete():void
		{
			_callback.execute();
		}
	
		override public function getReverseAction():Action
		{
			return new ActionImmediately(_callback);
		}
	
		override public function onDispose():void
		{
			_callback = null;
		}
	}
}
