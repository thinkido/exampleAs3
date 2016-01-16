
package game.model.action;

import game.model.callback.CallbackO;

public class ActionWaitTo extends ActionInterval
{

	protected CallbackO _beforeCallback;

	protected CallbackO _afterCallback;

	public ActionWaitTo(long dur, CallbackO beforeCallback, CallbackO afterCallback)
	{
		super(dur);
		_beforeCallback = beforeCallback;
		_afterCallback = afterCallback;
	}

	public void onStart()
	{
		if(_beforeCallback != null)
			_beforeCallback.execute();
		super.onStart();
	}

	public void onComplete()
	{
		if(_afterCallback != null)
			_afterCallback.execute();
	}

	public Action getReverseAction()
	{
		return new ActionWaitTo(_dur, _afterCallback, _beforeCallback);
	}

	public void onDispose()
	{
		_beforeCallback = null;
		_afterCallback = null;
	}
}
