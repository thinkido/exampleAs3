
package game.model.action;

public class ActionRepeatForever extends Action
{

	protected Action _action;

	public ActionRepeatForever(Action action)
	{
		_action = action;
	}

	public void onStart()
	{
		_action.onStart();
	}

	public void onComplete()
	{

	}

	public boolean onStep()
	{
		if(_action.onStep())
		{
			_action.onComplete();
			_action.onStart();
		}
		return false;
	}

	public Action getReverseAction()
	{
		return new ActionRepeatForever(_action);
	}

	public void onDispose()
	{
		_action.onDispose();
		_action = null;
	}
}
