
package game.model.action;

import game.model.callback.CallbackO;

public final class ActionImmediately extends Action
{

	protected CallbackO _callback;

	public ActionImmediately(CallbackO callback)
	{
		_callback = callback;
	}

	public boolean onStep()
	{
		return true;
	}

	public void onStart()
	{

	}

	public void onComplete()
	{
		_callback.execute();
	}

	public Action getReverseAction()
	{
		return new ActionImmediately(_callback);
	}

	public void onDispose()
	{
		_callback = null;
	}
}
