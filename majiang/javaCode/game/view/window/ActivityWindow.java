
package game.view.window;

import game.constant.WindowType;
import game.control.WindowManager;
import game.util.CommonUtil;
import ui.UIButton;
import ui.UIObject;
import ui.UIWindow;

public class ActivityWindow extends UIWindow
{

	private UIButton[] _btnTabList;

	private UIButton _btnClose;

	protected void initUI()
	{
		_btnClose = (UIButton)getChildByName("btn_close");
		_btnTabList = new UIButton[3];
		for(int i = 0; i < 3; i++)
		{
			_btnTabList[i] = (UIButton)getChildByName("btn_tab_" + (i + 1));
		}
		_btnClose.setNeighbors(null, _btnTabList[0], null, null);
		for(int i = 0; i < 3; i++)
		{
			int pre = i - 1;
			if(pre < 0)
				pre += 3;
			int next = i + 1;
			if(next >= 3)
				next -= 3;
			_btnTabList[i].setNeighbors(_btnClose, null, _btnTabList[pre], _btnTabList[next]);
		}
		switchFocus(_btnTabList[0]);
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
		{
			WindowManager.getInstance().closeWindow(this);
		}
		else if(_btnTabList[0] == target)
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_GIFT);
		}
		else if(_btnTabList[1] == target)
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_COLLECT);
		}
		else if(_btnTabList[2] == target)
		{
			CommonUtil.showPopupWindow(false, "¾´ÇëÆÚ´ý", null);
		}
	}
}
