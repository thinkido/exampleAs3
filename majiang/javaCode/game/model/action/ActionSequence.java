
package game.model.action;

import java.util.Vector;

public class ActionSequence extends Action
{

	protected Action[] _actionList;

	protected int _curActionIndex;

	public ActionSequence(Action[] actionList)
	{
		_actionList = actionList;
		if(_actionList == null)
			_actionList = new Action[]{};
	}

	public ActionSequence(Vector actionList)
	{
		if(actionList == null)
			_actionList = new Action[]{};
		else
		{
			int len = actionList.size();
			_actionList = new Action[len];
			for(int i = 0; i < len; i++)
			{
				_actionList[i] = (Action)actionList.elementAt(i);
			}
		}
	}

	public void onStart()
	{
		_curActionIndex = 0;
		_actionList[0].onStart();
	}

	public void onComplete()
	{

	}

	public boolean onStep()
	{
		if(_actionList.length <= _curActionIndex)
			return true;
		else if(_actionList[_curActionIndex].onStep())
		{
			_actionList[_curActionIndex].onComplete();
			_curActionIndex++;
			if(_actionList.length <= _curActionIndex)
				return true;
			else
				_actionList[_curActionIndex].onStart();
		}
		return false;
	}

	public Action getReverseAction()
	{
		int len = _actionList.length;
		Action[] actionList = new Action[len];
		for(int i = 0; i < len; i++)
		{
			actionList[i] = _actionList[len - i - 1].getReverseAction();
		}
		return new ActionSequence(actionList);
	}

	public void onDispose()
	{
		int len = _actionList.length;
		for(int i = 0; i < len; i++)
		{
			_actionList[i].onDispose();
		}
		_actionList = null;
	}
}
