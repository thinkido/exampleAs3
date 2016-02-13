package game.view.window.shop
{
	import game.control.SceneManager;
	import game.control.WindowManager;
	import game.model.Global;
	import game.util.CommonUtil;
	import game.view.scene.HallScene;
	
	import starling.display.Button;
	
	import ui.UIButton;
	import ui.UIObject;
	import ui.UITextBMFont;
	import ui.UIWindow;
	
	public class TicketShopWindow extends UIWindow
	{
		
		private var _btnClose:Button;
		
		private var _btnItemList:Vector.<Button>;
		
		private var _bfTicket:UITextBMFont;
		
		private var _ticketCostList:Vector.<int> = new Vector.<int>;
		
		private var _goldGetList:Vector.<int> = new Vector.<int>;
		
		public function TicketShopWindow()
		{
			this._ticketCostList.push(200, 400, 800, 1500, 2500, 5000);
			this._goldGetList.push(1000, 2000, 5000, 10000, 20000, 50000);
		}
		
		override public function initUI():void
		{
			_bfTicket = getChildByName("bf_ticket") as UITextBMFont;
//			_bfTicket.setAnchor(ANCHOR_BOTTOM_LEFT);
			_btnClose = getChildByName("btn_close") as Button;
			_btnItemList = new Vector.<Button>;
			for(var i:int = 0; i < 6; i++)
			{
				_btnItemList[i] = getChildByName("btn_item_" + (i + 1)) as Button;
			}
			_btnItemList[0].setNeighbors(_btnClose, _btnItemList[3], _btnItemList[2], _btnItemList[1]);
			_btnItemList[1].setNeighbors(_btnClose, _btnItemList[4], _btnItemList[0], _btnItemList[2]);
			_btnItemList[2].setNeighbors(_btnClose, _btnItemList[5], _btnItemList[1], _btnItemList[0]);
			_btnItemList[3].setNeighbors(_btnItemList[0], null, _btnItemList[5], _btnItemList[4]);
			_btnItemList[4].setNeighbors(_btnItemList[1], null, _btnItemList[3], _btnItemList[5]);
			_btnItemList[5].setNeighbors(_btnItemList[2], null, _btnItemList[4], _btnItemList[3]);
			_btnClose.setNeighbors(null, _btnItemList[0], null, null);
			
			switchFocus(_btnItemList[0]);
		}
		
		override public function onEnter():void
		{
			updateTicket();
		}
		
		override public function onLeave():void
		{
			
		}
		
		override public function onConfirm(target:UIObject):void
		{
			if(_btnClose == target)
				WindowManager.getInstance().closeWindow(this);
			else
			{
				for(var i:int = 0; i < 6; i++)
				{
					if(_btnItemList[i] == target)
					{
						if(true)
						{
							Global.userDataVO.score -= _ticketCostList[i];
							updateTicket();
							CommonUtil.showPopupWindow(false, "兑换积分成功，获得" + _goldGetList[i] + "积分", null);
							Global.userDataVO.gold += _goldGetList[i];
							(SceneManager.getInstance().getCurScene() as HallScene).updateUserInfo();
						}
					}
				}
			}
		}
		
		private function updateTicket():void
		{
			_bfTicket.setText("" + Global.userDataVO.score);
		}
	}
}