
package game.model.action;

import framework.resources.SpriteSheet;
import framework.views.Bitmap;
import game.model.Global;

public class ActionPlane extends Action
{

	private Bitmap _imgPlane;

	private Bitmap[] _imgSmokeList = new Bitmap[2];

	private boolean _flag;

	public ActionPlane(SpriteSheet ss)
	{
		_imgPlane = new Bitmap(ss.getTexture("plane"));
		_imgSmokeList[0] = new Bitmap(ss.getTexture("smoke_0"));
		_imgSmokeList[1] = new Bitmap(ss.getTexture("smoke_1"));
	}

	public void onStart()
	{
		_imgPlane.setPosition(Global.SCREEN_WIDTH, Global.SCREEN_HEIGHT / 2 - 40);
		setSmokePostion();
		Global.effectLayer.addChild(_imgSmokeList[0]);
		Global.effectLayer.addChild(_imgSmokeList[1]);
		Global.effectLayer.addChild(_imgPlane);
	}

	public void onComplete()
	{
		Global.effectLayer.removeChild(_imgPlane);
		Global.effectLayer.removeChild(_imgSmokeList[0]);
		Global.effectLayer.removeChild(_imgSmokeList[1]);
	}

	public boolean onStep()
	{
		_imgPlane.setPosition(_imgPlane.getX() - 35, _imgPlane.getY());
		_flag = !_flag;
		setSmokePostion();
		if(_imgSmokeList[0].getX() <= -_imgSmokeList[0].getWidth())
			return true;
		return false;
	}

	public Action getReverseAction()
	{
		return null;
	}

	private void setSmokePostion()
	{
		int x = _imgPlane.getX();
		int y = _imgPlane.getY();
		_imgSmokeList[0].setPosition(x + 130, y + 60);
		_imgSmokeList[0].setVisible(_flag);
		_imgSmokeList[1].setPosition(x + 130, y + 60);
		_imgSmokeList[1].setVisible(!_flag);
	}

	public void onDispose()
	{
		_imgPlane = null;
		_imgSmokeList = null;
	}
}
