package game.model.action
{
	
	public class ActionSequence extends Action
	{
	
		protected var _actionList:Vector.<Action>;
	
		protected var _curActionIndex:int;
	
		public function ActionSequence( actionList:Vector.<Action>)
		{
			_actionList = actionList;
			if(_actionList == null)
				_actionList = new Vector.<Action>;
		}
	
		public function ActionSequence_2(actionList:Array):void
		{
			if(actionList == null)
				_actionList = new Vector.<Action>;
			else
			{
				var len:int = actionList.size();
				_actionList = new Action[len];
				for(var i:int = 0; i < len; i++)
				{
					_actionList[i] = actionList[i] ;
				}
			}
		}
	
		override public function onStart():void
		{
			_curActionIndex = 0;
			_actionList[0].onStart();
		}
	
		override public function onComplete():void
		{
	
		}
	
		override public function onStep():Boolean
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
	
		override public function getReverseAction():Action
		{
			var len:int = _actionList.length;
			var actionList:Vector.<Action> = new Vector.<Action>;
			for(var i:int = 0; i < len; i++)
			{
				actionList[i] = _actionList[len - i - 1].getReverseAction();
			}
			return new ActionSequence(actionList);
		}
	
		override public function onDispose():void
		{
			var len:int = _actionList.length;
			for(var i:int = 0; i < len; i++)
			{
				_actionList[i].onDispose();
			}
			_actionList = null;
		}
	}
}