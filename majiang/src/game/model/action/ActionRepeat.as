package game.model.action
{
	public final class ActionRepeat extends Action
	{
	
		protected var _repeatTotal:int;
	
		protected var _repeatNum:int;
	
		protected var _action:Action;
	
		public function ActionRepeat( action:Action, repeatNum:int)
		{
			_action = action;
			_repeatTotal = repeatNum;
		}
	
		override public function onStep():Boolean
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
	
		override public function onStart():void
		{
			_repeatNum = 0;
			_action.onStart();
		}
	
		override public function onComplete():void
		{
	
		}
	
		override public function getReverseAction():Action
		{
			return new ActionRepeat(_action.getReverseAction(), _repeatTotal);
		}
	
		override public function onDispose():void
		{
			_action.onDispose();
			_action = null;
		}
	}
}
