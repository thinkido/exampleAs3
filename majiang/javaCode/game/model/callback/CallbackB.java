
package game.model.callback;

public class CallbackB
{

	private boolean _args;

	private ICallbackB _callback;

	public CallbackB(ICallbackB callback, boolean args)
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
