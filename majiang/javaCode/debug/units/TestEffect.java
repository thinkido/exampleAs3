
package debug.units;

import framework.consts.EventType;
import framework.consts.KeyType;
import framework.events.EventDispatcher;
import framework.events.IEventListener;
import framework.resources.Res;
import framework.resources.SpriteSheet;
import framework.views.MovieClip;
import framework.views.Sprite;
import framework.views.Stage;

public class TestEffect extends Sprite implements IEventListener
{

	private SpriteSheet gang;

	private SpriteSheet hu;

	private SpriteSheet peng;

	public TestEffect()
	{
		gang = Res.actively.getSheet("eft_gang_json");
		hu = Res.actively.getSheet("eft_hu_json");
		peng = Res.actively.getSheet("eft_peng_json");
		Stage.current.keyboard.addEventListener(EventType.EVENT_KEY_PRESSED, this);
	}

	public void onReciveEvent(byte type, EventDispatcher dispatcher, Object data)
	{
		MovieClip mc = null;
		int code = ((Integer)data).intValue();
		switch(code)
		{
			case KeyType.UP:
				mc = new MovieClip(gang, 40);
				break;
			case KeyType.DOWN:
				mc = new MovieClip(hu, 40);
				break;
			case KeyType.LEFT:
				mc = new MovieClip(peng, 40);
				break;
			default:
				return;				
		}

		this.addChild(mc);
		mc.setAnchor(ANCHOR_CENTER);
		mc.setPosition(320, 530 / 2);
		mc.setAutoDispose(true);
	}
}
