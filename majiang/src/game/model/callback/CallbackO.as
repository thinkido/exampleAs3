package game.model.callback
{
	public class CallbackO
	{
		private var _args:Object;
		private var _callback:ICallbackO;
		
		public function CallbackO(callback:ICallbackO, args:Object)
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
