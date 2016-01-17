package game.model.action
{
	import flash.utils.getTimer;
	
	import starling.display.DisplayObject;
	
	public class ActionMoveBy extends ActionInterval
	{
	
		protected var _displayObject:DisplayObject;
	
		protected var _originX:int;
	
		protected var _originY:int;
	
		protected var _disX:int;
	
		protected var _disY:int;
	
		public function ActionMoveBy(displayObject:DisplayObject,  xMove:int, yMove:int, dur:Number)
		{
			super(dur);
			_displayObject = displayObject;
			_disX = xMove;
			_disY = yMove;
		}
	
		override public function onStep():Boolean
		{
			var timePast:Number = getTimer() - _startTime;
			var rate:Number = 1.0 * timePast / _dur;
			var xPoint:int = _originX + (int)(rate * _disX);
			var yPoint:int = _originY + (int)(rate * _disY);
			if(_disX >= 0 && xPoint > _originX + _disX || _disX < 0 && xPoint < _originX + _disX)
				xPoint = _originX + _disX;
			if(_disY >= 0 && yPoint > _originY + _disY || _disY < 0 && yPoint < _originY + _disY)
				yPoint = _originY + _disY;
//			_displayObject.setPosition(xPoint, yPoint);
			_displayObject.x = xPoint;
			_displayObject.y = yPoint;
			return timePast >= _dur;
		}
	
		override public function onStart():void
		{
			_originX = _displayObject.x;
			_originY = _displayObject.y;
			super.onStart();
		}
	
		override public function onComplete():void
		{
	
		}
	
		override public function getReverseAction():Action
		{
			return new ActionMoveBy(_displayObject, -_disX, -_disY, _dur);
		}
	
		override public function onDispose():void
		{
			_displayObject = null;
		}
	
	}
}
