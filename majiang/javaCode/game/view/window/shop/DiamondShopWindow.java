
package game.view.window.shop;

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

	private UIButton _btnClose;

	private UIButton[] _btnItemList;

	private UITextBMFont _bfDiamond;

	private int[] _diamondCostList = new int[]{1, 3, 5, 8, 10, 15};

	private int[] _goldGetList = new int[]{3000, 9000, 15000, 24000, 30000, 45000};

	protected void initUI()
	{
		_bfDiamond = (UITextBMFont)getChildByName("bf_diamond");
		_bfDiamond.setAnchor(ANCHOR_BOTTOM_LEFT);
		_btnClose = (UIButton)getChildByName("btn_close");
		_btnItemList = new UIButton[6];
		for(int i = 0; i < 6; i++)
		{
			_btnItemList[i] = (UIButton)getChildByName("btn_item_" + (i + 1));
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

	public void onEnter()
	{
		updateDiamond();
	}

	public void onLeave()
	{

	}

	public void onConfirm(UIObject target)
	{
		if(_btnClose == target)
			WindowManager.getInstance().closeWindow(this);
		else
		{
			for(int i = 0; i < 6; i++)
			{
				if(_btnItemList[i] == target)
				{
					if(Global.diamond >= _diamondCostList[i])
					{
						Global.diamond -= _diamondCostList[i];
						updateDiamond();
						CommonUtil.showPopupWindow(false, "购买积分成功，获得" + _goldGetList[i] + "积分", null);
						Global.userDataVO.gold += _goldGetList[i];
						((HallScene)SceneManager.getInstance().getCurScene()).updateUserInfo();
					}
					else
					{
						CommonUtil.showPopupWindow(false, "钻石不足，无法购买", null);
					}
				}
			}
		}
	}

	private void updateDiamond()
	{
		_bfDiamond.setText("" + Global.diamond);
	}
}
