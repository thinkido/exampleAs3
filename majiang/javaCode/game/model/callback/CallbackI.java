
package game.model.callback;

public class CallbackI
{

	private int _args;

	private ICallbackI _callback;

	public CallbackI(ICallbackI callback, int args)
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
