
package game.model.action;

import framework.views.Stage;

public abstract class ActionInterval extends Action
{

	protected long _dur;

	protected long _startTime;

	public ActionInterval(long dur)
	{
		_dur = dur;
	}

	public void onStart()
	{
		_startTime = Stage.current.now();
	}

	public void onComplete()
	{
		_startTime = 0;
	}

	public boolean onStep()
	{
		return Stage.current.now() - _startTime >= _dur;
	}
}
