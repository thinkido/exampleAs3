package game.view.window.shop
{
	import game.constant.WindowType;
	import game.control.WindowManager;
	
	import ui.UIButton;
	import ui.UIObject;
	import ui.UIWindow;
	
	public class ShopWindow extends UIWindow
	{
		
		private var _btnClose:UIButton;
		
		private var _btnDiamondBuy:UIButton;
		
		private var _btnTicketBuy:UIButton;
		
		override public function initUI():void
		{
			_btnClose = getChildByName("btn_close") as UIButton;
			_btnDiamondBuy = getChildByName("btn_diamond_shop") as UIButton;
			_btnTicketBuy = getChildByName("btn_ticket_shop") as UIButton;
			
			_btnClose.setNeighbors(null, _btnDiamondBuy, null, null);
			_btnDiamondBuy.setNeighbors(_btnClose, null, _btnTicketBuy, _btnTicketBuy);
			_btnTicketBuy.setNeighbors(_btnClose, null, _btnDiamondBuy, _btnDiamondBuy);
			
			switchFocus(_btnDiamondBuy);
		}
		
		override public function onEnter():void
		{
			
		}
		
		override public function onLeave():void
		{
			
		}
		
		override public function onConfirm( target:UIObject):void
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
}
