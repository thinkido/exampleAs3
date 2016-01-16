
package game.model.action;

import framework.views.DisplayObject;
import framework.views.Stage;

public class ActionMoveBy extends ActionInterval
{

	protected DisplayObject _displayObject;

	protected int _originX;

	protected int _originY;

	protected int _disX;

	protected int _disY;

	public ActionMoveBy(DisplayObject displayObject, int xMove, int yMove, long dur)
	{
		super(dur);
		_displayObject = displayObject;
		_disX = xMove;
		_disY = yMove;
	}

	public boolean onStep()
	{
		long timePast = Stage.current.now() - _startTime;
		double rate = 1.0 * timePast / _dur;
		int xPoint = _originX + (int)(rate * _disX);
		int yPoint = _originY + (int)(rate * _disY);
		if(_disX >= 0 && xPoint > _originX + _disX || _disX < 0 && xPoint < _originX + _disX)
			xPoint = _originX + _disX;
		if(_disY >= 0 && yPoint > _originY + _disY || _disY < 0 && yPoint < _originY + _disY)
			yPoint = _originY + _disY;
		_displayObject.setPosition(xPoint, yPoint);
		return timePast >= _dur;
	}

	public void onStart()
	{
		_originX = _displayObject.getX();
		_originY = _displayObject.getY();
		super.onStart();
	}

	public void onComplete()
	{

	}

	public Action getReverseAction()
	{
		return new ActionMoveBy(_displayObject, -_disX, -_disY, _dur);
	}

	public void onDispose()
	{
		_displayObject = null;
	}

}
