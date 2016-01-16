
package game.model.action;

import java.util.Vector;

public final class ActionConcurrence extends Action
{

	protected Action[] _originActionList;

	protected Vector _actionList;

	public ActionConcurrence(Action[] actionlist)
	{
		_originActionList = actionlist;
		if(_originActionList == null)
			_originActionList = new Action[]{};
	}

	public ActionConcurrence(Vector actionList)
	{
		if(actionList == null)
			_originActionList = new Action[]{};
		else
		{
			int len = actionList.size();
			_originActionList = new Action[len];
			for(int i = 0; i < len; i++)
			{
				_originActionList[i] = (Action)actionList.elementAt(i);
			}
		}
	}

	public void onStart()
	{
		_actionList = new Vector();
		if(_originActionList.length > 0)
		{
			int len = _originActionList.length;
			for(int i = 0; i < len; i++)
			{
				_actionList.addElement(_originActionList[i]);
				_originActionList[i].onStart();
			}
		}
	}

	public boolean onStep()
	{
		int len = _actionList.size();
		if(len == 0)
			return true;
		else
		{
			for(int i = len - 1; i >= 0; i--)
			{
				Action action = (Action)_actionList.elementAt(i);
				if(action.onStep())
				{
					action.onComplete();
					_actionList.removeElement(action);
					if(_actionList.size() == 0)
						return true;
				}
			}
			return false;
		}
	}

	public Action getReverseAction()
	{
		int len = _originActionList.length;
		Action[] actionList = new Action[len];
		for(int i = 0; i < len; i++)
		{
			actionList[i] = _originActionList[len - i - 1].getReverseAction();
		}
		return new ActionConcurrence(actionList);
	}

	public void onComplete()
	{

	}

	public void onDispose()
	{
		int len = _originActionList.length;
		for(int i = 0; i < len; i++)
		{
			_originActionList[i].onDispose();
		}
		_originActionList = null;
		_actionList = null;
	}
}
