package game.view.window.shop
{	
	import game.control.SceneManager;
	import game.control.WindowManager;
	import game.model.Global;
	import game.util.CommonUtil;
	import game.view.scene.HallScene;
	
	import ui.UIButton;
	import ui.UIObject;
	import ui.UITextBMFont;
	import ui.UIWindow;
	
	public class DiamondShopWindow extends UIWindow
	{
		
		private var _btnClose:UIButton;
		
		private var _btnItemList:Vector.<UIButton>;
		
		private var _bfDiamond:UITextBMFont;
		
		private var _diamondCostList:Vector.<int> = new Vector.<int>;
		
		private var _goldGetList:Vector.<int> = new Vector.<int>;
		
		public function DiamondShopWindow()
		{
			this._diamondCostList.push(1, 3, 5, 8, 10, 15);
			this._goldGetList.push(3000, 9000, 15000, 24000, 30000, 45000);
		}
		
		override public function initUI():void
		{
			_bfDiamond = getChildByName("bf_diamond") as UITextBMFont;
//			_bfDiamond.setAnchor(ANCHOR_BOTTOM_LEFT);
			_btnClose = getChildByName("btn_close") as UIButton;
			_btnItemList = new Vector.<UIButton>;
			for(var i:int = 0; i < 6; i++)
			{
				_btnItemList[i] = getChildByName("btn_item_" + (i + 1)) as UIButton;
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
			updateDiamond();
		}
		
		override public function onLeave():void
		{
			
		}
		
		override public function onConfirm( target:UIObject):void
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
							Global.diamond -= _diamondCostList[i];
							updateDiamond();
							CommonUtil.showPopupWindow(false, "购买积分成功，获得" + _goldGetList[i] + "积分", null);
							Global.userDataVO.gold += _goldGetList[i];
							(SceneManager.getInstance().getCurScene() as HallScene).updateUserInfo();
						}
					}
				}
			}
		}
		
		private function updateDiamond():void
		{
			_bfDiamond.setText("" + Global.diamond);
		}
	}
}