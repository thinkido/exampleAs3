package game.model.action
{
	public class ActionRepeatForever extends Action
	{
	
		protected var _action:Action;
	
		public function ActionRepeatForever(action:Action)
		{
			_action = action;
		}
	
		override public function onStart():void
		{
			_action.onStart();
		}
	
		override public function onComplete():void
		{
	
		}
	
		override public function onStep():Boolean
		{
			if(_action.onStep())
			{
				_action.onComplete();
				_action.onStart();
			}
			return false;
		}
	
		override public function getReverseAction():Action
		{
			return new ActionRepeatForever(_action);
		}
	
		override public function onDispose():void
		{
			_action.onDispose();
			_action = null;
		}
	}
}
