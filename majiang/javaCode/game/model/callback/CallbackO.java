package game.model.callback;



public class CallbackO
{
	private Object _args;
	private ICallbackO _callback;
	
	public CallbackO(ICallbackO callback,Object args)
	{
		_callback = callback;
		_args = args;
	}
	
	public void execute()
	{
		if(_callback != null)
			_callback.run(_args);
	}
}
