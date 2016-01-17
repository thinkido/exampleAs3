package game.model.action
{
	
	
	public class ActionWaitTo extends ActionInterval
	{
	
		protected var _beforeCallback:CallbackO;
	
		protected var _afterCallback:CallbackO;
	
		public function ActionWaitTo( dur:Number, beforeCallback:CallbackO, afterCallback:CallbackO)
		{
			super(dur);
			_beforeCallback = beforeCallback;
			_afterCallback = afterCallback;
		}
	
		override public function onStart():void
		{
			if(_beforeCallback != null)
				_beforeCallback.execute();
			super.onStart();
		}
	
		override public function onComplete():void
		{
			if(_afterCallback != null)
				_afterCallback.execute();
		}
	
		override public function getReverseAction():Action
		{
			return new ActionWaitTo(_dur, _afterCallback, _beforeCallback);
		}
	
		override public function onDispose():void
		{
			_beforeCallback = null;
			_afterCallback = null;
		}
	}
}
