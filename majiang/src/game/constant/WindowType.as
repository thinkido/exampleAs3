
package game.constant;

import game.control.LogManager;
import game.view.scene.gamescene.windows.GameEndWindow;
import game.view.scene.gamescene.windows.PlayerActionWindow;
import game.view.window.ActivityWindow;
import game.view.window.CollectWindow;
import game.view.window.GiftWindow;
import game.view.window.PopupWindow;
import game.view.window.rank.RankWindow;
import game.view.window.rule.RuleWindow;
import game.view.window.shop.DiamondShopWindow;
import game.view.window.shop.ShopWindow;
import game.view.window.shop.TicketShopWindow;
import game.view.window.user.UserWindow;

import ui.UIWindow;

public class WindowType
{
	public static var WINDOW_POPUP:WindowType = new WindowType(PopupWindow.class, "popupwindow_json", true);
		
	public static var WINDOW_GIFT:WindowType = new WindowType(GiftWindow.class, "gift_window_json", true);
			
	public static var WINDOW_USER:WindowType = new WindowType(UserWindow.class, "user_window_json", true);
				
	public static var WINDOW_SHOP:WindowType = new WindowType(ShopWindow.class, "shop_window_json", true);
					
	public static var WINDOW_DIAMOND_SHOP:WindowType = new WindowType(DiamondShopWindow.class, "diamond_shop_window_json", true);
						
	public static var WINDOW_TICKET_SHOP:WindowType = new WindowType(TicketShopWindow.class, "ticket_shop_window_json", true);
							
	public static var WINDOW_RANK:WindowType = new WindowType(RankWindow.class, "rank_window_json", true);
								
	public static var WINDOW_ACTIVITY:WindowType = new WindowType(ActivityWindow.class, "activity_window_json", true);
									
	public static var WINDOW_RULE:WindowType = new WindowType(RuleWindow.class, "rule_window_json", true);
										
	public static var WINDOW_PLAYER_ACTION:WindowType = new WindowType(PlayerActionWindow.class, "playeraction_window_json", true);
											
	public static var WINDOW_GAME_END:WindowType = new WindowType(GameEndWindow.class, "gameend_window_json", true);
												
	public static var WINDOW_COLLECT:WindowType = new WindowType(CollectWindow.class, "collect_window_json", true);

	private var _cls:Class;

	private var _confName:String;

	private var _isShowDarkBg:Boolean;

	public function WindowType( cls:Class, confName:String, isShowDarkBg:String):void
	{
		_cls = cls;
		_confName = confName;
		_isShowDarkBg = isShowDarkBg;
	}

	public function createInstance():UIWindow
	{
		var newInstance:UIWindow;
		try
		{
			newInstance = _cls.newInstance() as UIWindow;
			newInstance.buildUI(_confName);
			if(_isShowDarkBg)
				newInstance.addDarkBg();
		}
		catch( e:Error)
		{
			e.printStackTrace();
			newInstance = null;
			LogManager.getInstance().log(e.getMessage(), LogManager.LEVEL_ERROR);
		}
		return newInstance;
	}
}