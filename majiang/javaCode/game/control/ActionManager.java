
package game.control;

import java.util.Enumeration;
import java.util.Vector;

import framework.consts.EventType;
import framework.events.EventDispatcher;
import framework.events.IEventListener;
import framework.views.Stage;
import game.model.action.Action;

public class ActionManager implements IEventListener
{

	private static ActionManager _instance;

	private Vector _actionList;

	private boolean _busy;

	public static ActionManager getInstance()
	{
		if(null == _instance)
			_instance = new ActionManager();
		return _instance;
	}

	private ActionManager()
	{
		_busy = false;
		_actionList = new Vector();
	}

	public void doAction(Action action)
	{
		if(action != null)
		{
			_actionList.addElement(action);
			action.onStart();
			if(!_busy)
			{
				_busy = true;
				Stage.current.notice.addEventListener(EventType.EVENT_STAGE_ENTER_FRAME, this);
			}
		}
	}

	public void dropAction(Action action)
	{
		if(_actionList.contains(action))
		{
			action.onDispose();
			_actionList.removeElement(action);
			if(_busy && _actionList.size() <= 0)
			{
				_busy = false;
				Stage.current.notice.removeEventListener(EventType.EVENT_STAGE_ENTER_FRAME, this);
			}
		}
	}

	public void onReciveEvent(byte type, EventDispatcher dispatcher, Object data)
	{
		for(Enumeration enumobj = _actionList.elements(); enumobj.hasMoreElements();)
		{
			Action action = (Action)enumobj.nextElement();
			if(action.onStep())
			{
				action.onComplete();
				dropAction(action);
			}
		}
	}
}
