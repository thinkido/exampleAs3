
package game.model.action;

import framework.views.DisplayObject;
import game.model.Global;

public class ActionHideLater extends ActionInterval
{

	private DisplayObject _displayObject;

	public ActionHideLater(DisplayObject displayObject, long dur)
	{
		super(dur);
		_displayObject = displayObject;
		_displayObject.setPosition((Global.SCREEN_WIDTH - displayObject.getWidth()) / 2, (Global.SCREEN_HEIGHT - displayObject.getHeight()) / 2 - 30);
	}

	public void onStart()
	{
		Global.effectLayer.addChild(_displayObject);
		super.onStart();
	}

	public void onComplete()
	{
		super.onComplete();
		Global.effectLayer.removeChild(_displayObject);
	}

	public Action getReverseAction()
	{
		return new ActionHideLater(_displayObject, _dur);
	}

	public void onDispose()
	{
		_displayObject = null;
	}
}
