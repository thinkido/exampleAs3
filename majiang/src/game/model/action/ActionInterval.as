package game.model.action
{
	import flash.utils.getTimer;
	
	public class ActionInterval extends Action
	{
	
		protected var _dur:Number;
	
		protected var _startTime:Number;
	
		public function ActionInterval( dur:Number)
		{
			_dur = dur;
		}
	
		override public function onStart():void
		{
//			_startTime = Stage.current.now();
			_startTime = getTimer();
		}
	
		override public function onComplete():void
		{
			_startTime = 0;
		}
	
		override public function onStep():Boolean
		{
//			return Stage.current.now() - _startTime >= _dur;
			return getTimer() - _startTime >= _dur;
		}
	}
}
