
package game.model.action;

public final class ActionRepeat extends Action
{

	protected int _repeatTotal;

	protected int _repeatNum;

	protected Action _action;

	public ActionRepeat(Action action, int repeatNum)
	{
		_action = action;
		_repeatTotal = repeatNum;
	}

	public boolean onStep()
	{
		if(_repeatNum >= _repeatTotal)
			return true;
		else if(_action.onStep())
		{
			_repeatNum++;
			_action.onComplete();
			if(_repeatNum >= _repeatTotal)
				return true;
			else
			{
				_action.onStart();
			}
		}
		return false;
	}

	public void onStart()
	{
		_repeatNum = 0;
		_action.onStart();
	}

	public void onComplete()
	{

	}

	public Action getReverseAction()
	{
		return new ActionRepeat(_action.getReverseAction(), _repeatTotal);
	}

	public void onDispose()
	{
		_action.onDispose();
		_action = null;
	}
}
