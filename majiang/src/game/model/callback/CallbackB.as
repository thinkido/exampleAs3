package game.model.callback
{
	public class CallbackB
	{
	
		private var _args:Boolean;
	
		private var _callback:ICallbackB;
	
		public function CallbackB(callback:ICallbackB, args:Boolean)
		{
			_callback = callback;
			_args = args;
		}
	
		public function execute():void
		{
			if(_callback != null)
				_callback.run(_args);
		}
	}
}
