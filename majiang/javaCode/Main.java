import framework.views.Stage;
import game.GameEntry;
import game.model.Global;

import javax.microedition.lcdui.Display;
import javax.microedition.midlet.MIDlet;
import javax.microedition.midlet.MIDletStateChangeException;

public class Main extends MIDlet
{

	protected void destroyApp(boolean arg0) throws MIDletStateChangeException
	{
		this.notifyDestroyed();
	}

	protected void pauseApp()
	{

	}

	protected void startApp()
	{
		Global.account = getAppProperty("Account");
		Global.adAccount = getAppProperty("adAccount");
		Global.nickname = getAppProperty("NickName");
		Global.returnURL = getAppProperty("ReturnURL");
		Global.diamond = Integer.valueOf(null == getAppProperty("diamond") ? "0" : getAppProperty("diamond")).intValue();
		Display display = Display.getDisplay(this);
		Stage stage = new Stage(GameEntry.class, 25, 0x666666, Global.SCREEN_WIDTH, Global.SCREEN_HEIGHT);
		display.setCurrent(stage);
	}

}
