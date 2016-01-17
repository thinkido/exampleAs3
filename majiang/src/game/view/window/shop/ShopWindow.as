package game.view.window.shop
{
	import game.control.WindowManager;
	
	import starling.display.Button;
	
	import ui.UIObject;
	import ui.UIWindow;
	
	public class ShopWindow extends UIWindow
	{
		
		private var _btnClose:Button;
		
		private var _btnDiamondBuy:Button;
		
		private var _btnTicketBuy:Button;
		
		override protected function initUI():void
		{
			_btnClose = getChildByName("btn_close") as Button;
			_btnDiamondBuy = getChildByName("btn_diamond_shop") as Button;
			_btnTicketBuy = getChildByName("btn_ticket_shop") as Button;
			
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
		
		public function onConfirm( target:UIObject):void
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
