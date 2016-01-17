package game.model.action
{
	
	import starling.display.DisplayObject;
	
	public class ActionMoveTo extends ActionMoveBy
	{
	
		public function ActionMoveTo(displayObject:DisplayObject, x:int, y:int, dur:Number)
		{
			super(displayObject, x - displayObject.x, y - displayObject.y, dur);
		}
	
		override public function getReverseAction():Action
		{
			return new ActionMoveTo(_displayObject, _originX, _originY, _dur);
		}
	}
}
