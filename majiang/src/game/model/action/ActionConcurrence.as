package game.model.action
{
	
	
	public final class ActionConcurrence extends Action
	{
	
		protected var _originActionList:Vector.<Action>;
	
		protected var _actionList:Array;
	
		public function ActionConcurrence( actionlist:Vector.<Action>)
		{
			_originActionList = actionlist;
			if(_originActionList == null)
				_originActionList = new Vector.<Action>;
		}
	
		public function ActionConcurrence_2(actionList:Array):void
		{
			if(actionList == null)
				_originActionList = new Vector.<Action>;
			else
			{
				var len:int = actionList.length;
				_originActionList = new Action[len];
				for(var i:int = 0; i < len; i++)
				{
					_originActionList[i] = actionList[i];
				}
			}
		}
	
		override public function onStart():void
		{
			_actionList = [];
			if(_originActionList.length > 0)
			{
				var len:int = _originActionList.length;
				for(var i:int = 0; i < len; i++)
				{
					_actionList.addElement(_originActionList[i]);
					_originActionList[i].onStart();
				}
			}
		}
	
		override public function onStep():Boolean
		{
			var len:int = _actionList.size();
			if(len == 0)
				return true;
			else
			{
				for(var i:int = len - 1; i >= 0; i--)
				{
					var action:Action = _actionList[i] as Action
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
	
		override public function getReverseAction():Action
		{
			var len:int = _originActionList.length;
			var actionList:Vector.<Action> = new Vector.<Action>;
			for(var i:int = 0; i < len; i++)
			{
				actionList[i] = _originActionList[len - i - 1].getReverseAction();
			}
			return new ActionConcurrence(actionList);
		}
	
		override public function onComplete():void
		{
	
		}
	
		override public function onDispose():void
		{
			var len:int = _originActionList.length;
			for(var i:int = 0; i < len; i++)
			{
				_originActionList[i].onDispose();
			}
			_originActionList = null;
			_actionList = null;
		}
	}
}
