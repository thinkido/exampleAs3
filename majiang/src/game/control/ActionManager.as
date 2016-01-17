package game.control
{
	
	import framework.consts.EventType;
	import framework.events.IEventListener;
	import framework.views.Stage;
	
	import game.model.action.Action;
	
	import java.util.Enumeration;
	import java.util.Vector;
	
	import starling.events.EventDispatcher;
	
	public class ActionManager implements IEventListener
	{
	
		private static var _instance:ActionManager;
	
		private var _actionList:Array;
	
		private var _busy:Boolean;
	
		public static function getInstance():ActionManager
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
	
		public function doAction(action:Action):void
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
	
		public function dropAction(action:Action):void
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
	
		public function onReciveEvent(type:byte, dispatcher:EventDispatcher, data:Object):void
		{
			/*for(Enumeration enumobj = _actionList.elements(); enumobj.hasMoreElements();)
			{
				Action action = (Action)enumobj.nextElement();
				if(action.onStep())
				{
					action.onComplete();
					dropAction(action);
				}
			}*/
			for each( var action:Action in _actionList)
			{
				if(action.onStep())
				{
					action.onComplete();
					dropAction(action);
				}
			}
		}
	}
}
