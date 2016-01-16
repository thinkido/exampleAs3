
package game.constant;

import game.control.LogManager;
import game.view.scene.gamescene.windows.GameEndWindow;
import game.view.scene.gamescene.windows.PlayerActionWindow;
import game.view.window.ActivityWindow;
import game.view.window.CollectWindow;
import game.view.window.GiftWindow;
import game.view.window.PopupWindow;
import game.view.window.RuleWindow;
import game.view.window.rank.RankWindow;
import game.view.window.shop.DiamondShopWindow;
import game.view.window.shop.ShopWindow;
import game.view.window.shop.TicketShopWindow;
import game.view.window.user.UserWindow;
import ui.UIWindow;

public class WindowType
{

	private Class _cls;

	private String _confName;

	private boolean _isShowDarkBg;

	public WindowType(Class cls, String confName, boolean isShowDarkBg)
	{
		_cls = cls;
		_confName = confName;
		_isShowDarkBg = isShowDarkBg;
	}

	public UIWindow createInstance()
	{
		UIWindow newInstance;
		try
		{
			newInstance = (UIWindow)_cls.newInstance();
			newInstance.buildUI(_confName);
			if(_isShowDarkBg)
				newInstance.addDarkBg();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			newInstance = null;
			LogManager.getInstance().log(e.getMessage(), LogManager.LEVEL_ERROR);
		}
		return newInstance;
	}

	public static final WindowType WINDOW_POPUP = new WindowType(PopupWindow.class, "popupwindow_json", true);

	public static final WindowType WINDOW_GIFT = new WindowType(GiftWindow.class, "gift_window_json", true);

	public static final WindowType WINDOW_USER = new WindowType(UserWindow.class, "user_window_json", true);

	public static final WindowType WINDOW_SHOP = new WindowType(ShopWindow.class, "shop_window_json", true);

	public static final WindowType WINDOW_DIAMOND_SHOP = new WindowType(DiamondShopWindow.class, "diamond_shop_window_json", true);

	public static final WindowType WINDOW_TICKET_SHOP = new WindowType(TicketShopWindow.class, "ticket_shop_window_json", true);

	public static final WindowType WINDOW_RANK = new WindowType(RankWindow.class, "rank_window_json", true);

	public static final WindowType WINDOW_ACTIVITY = new WindowType(ActivityWindow.class, "activity_window_json", true);

	public static final WindowType WINDOW_RULE = new WindowType(RuleWindow.class, "rule_window_json", true);

	public static final WindowType WINDOW_PLAYER_ACTION = new WindowType(PlayerActionWindow.class, "playeraction_window_json", true);

	public static final WindowType WINDOW_GAME_END = new WindowType(GameEndWindow.class, "gameend_window_json", true);
	
	public static final WindowType WINDOW_COLLECT = new WindowType(CollectWindow.class, "collect_window_json", true);
}
