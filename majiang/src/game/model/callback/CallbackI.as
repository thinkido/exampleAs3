package game.model.callback
{
	public class CallbackI
	{
	
		private var _args:int;
	
		private var _callback:ICallbackI;
	
		public function CallbackI(callback:ICallbackI, args:int)
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
