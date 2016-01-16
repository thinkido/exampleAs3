
package game.view.window.shop;

import game.constant.WindowType;
import game.control.WindowManager;
import ui.UIButton;
import ui.UIObject;
import ui.UIWindow;

public class ShopWindow extends UIWindow
{

	private UIButton _btnClose;
	
	private UIButton _btnDiamondBuy;

	private UIButton _btnTicketBuy;

	protected void initUI()
	{
		_btnClose = (UIButton)getChildByName("btn_close");
		_btnDiamondBuy = (UIButton)getChildByName("btn_diamond_shop");
		_btnTicketBuy = (UIButton)getChildByName("btn_ticket_shop");
		
		_btnClose.setNeighbors(null, _btnDiamondBuy, null, null);
		_btnDiamondBuy.setNeighbors(_btnClose, null, _btnTicketBuy, _btnTicketBuy);
		_btnTicketBuy.setNeighbors(_btnClose, null, _btnDiamondBuy, _btnDiamondBuy);
		
		switchFocus(_btnDiamondBuy);
	}

	public void onEnter()
	{

	}

	public void onLeave()
	{

	}

	public void onConfirm(UIObject target)
	{
		if(_btnClose == target)
			WindowManager.getInstance().closeWindow(this);
		else if(_btnDiamondBuy == target)
		{
			WindowManager.getInstance().closeWindow(this);
			WindowManager.getInstance().openWindow(WindowType.WINDOW_DIAMOND_SHOP);
		}
		else if(_btnTicketBuy == target)
		{
			WindowManager.getInstance().closeWindow(this);
			WindowManager.getInstance().openWindow(WindowType.WINDOW_TICKET_SHOP);
		}
	}

}
