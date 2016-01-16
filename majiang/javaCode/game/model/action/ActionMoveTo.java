
package game.model.action;

import framework.views.DisplayObject;

public class ActionMoveTo extends ActionMoveBy
{

	public ActionMoveTo(DisplayObject displayObject, int x, int y, long dur)
	{
		super(displayObject, x - displayObject.getX(), y - displayObject.getY(), dur);
	}

	public Action getReverseAction()
	{
		return new ActionMoveTo(_displayObject, _originX, _originY, _dur);
	}
}
