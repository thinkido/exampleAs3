
package game.view.window;

import framework.resources.Res;
import game.control.WindowManager;
import ui.UIButton;
import ui.UIImageView;
import ui.UIObject;
import ui.UIWindow;

public class RuleWindow extends UIWindow
{

	private int TAB_LENGTH = 4;

	private String[] TYPE_STRING_LIST = new String[]{"aboutus", "rule", "score", "type"};

	private int[] CONTENT_LEN_LIST = new int[]{1, 5, 1, 38};

	private int _curTab;

	private int[] _curIndexList = new int[TAB_LENGTH];

	private UIButton[] _btnTabList = new UIButton[TAB_LENGTH];

	private UIButton _btnClose;

	private UIImageView _imgContent;

	private UIButton _btnPageUp;

	private UIButton _btnPageDown;

	protected void initUI()
	{
		_imgContent = (UIImageView)getChildByName("img_content");
		_imgContent.setAnchor(ANCHOR_CENTER);
		_btnClose = (UIButton)getChildByName("btn_close");
		_btnPageUp = (UIButton)getChildByName("btn_page_up");
		_btnPageDown = (UIButton)getChildByName("btn_page_down");
		for(int i = 0; i < TAB_LENGTH; i++)
		{
			_btnTabList[i] = (UIButton)getChildByName("btn_tab_" + (i + 1));
			_curIndexList[i] = 0;
		}
		_curTab = 0;
	}

	public void onEnter()
	{
		updateTab();
		updateContent();
	}

	public void onLeave()
	{

	}

	public void onConfirm(UIObject target)
	{
		if(target == _btnClose)
			WindowManager.getInstance().closeWindow(this);
	}

	public void onMove(byte dir)
	{
		if(_selected == _btnClose)
		{
			if(dir == DIR_DOWN)
			{
				switchFocus(_btnTabList[_curTab]);
			}
		}
		else
		{
			if(dir == DIR_DOWN)
				goNext();
			else if(dir == DIR_UP)
			{
				if(goPre())
				{
					switchFocus(_btnClose);
				}
			}
			else if(dir == DIR_LEFT)
			{
				goLeft();
			}
			else if(dir == DIR_RIGHT)
			{
				goRight();
			}
		}
	}

	public void onDispose()
	{
		super.onDispose();
		TYPE_STRING_LIST = null;
		CONTENT_LEN_LIST = null;
		_curIndexList = null;
		_btnTabList = null;
		_btnClose = null;
		_imgContent = null;
	}

	private boolean goPre()
	{
		if(_curIndexList[_curTab] > 0)
		{
			_curIndexList[_curTab]--;
			updateContent();
			return false;
		}
		else
			return true;
	}

	private void goNext()
	{
		if(_curIndexList[_curTab] < CONTENT_LEN_LIST[_curTab] - 1)
		{
			_curIndexList[_curTab]++;
			updateContent();
		}
	}

	private void goRight()
	{
		_curTab++;
		if(_curTab >= TAB_LENGTH)
			_curTab -= TAB_LENGTH;
		updateTab();
		updateContent();
	}

	private void goLeft()
	{
		_curTab--;
		if(_curTab < 0)
			_curTab += TAB_LENGTH;
		updateTab();
		updateContent();
	}

	private void updateTab()
	{
		for(int i = 0; i < TAB_LENGTH; i++)
		{
			boolean isCur = i == _curTab;
			if(isCur)
				switchFocus(_btnTabList[i]);
		}
	}

	private void updateContent()
	{
		String filename = "img_txt_" + TYPE_STRING_LIST[_curTab] + "_" + (_curIndexList[_curTab] + 1) + "_png";
		_imgContent.setTexture(Res.actively.getTexture(filename));
		Res.actively.release(filename);
		if(_curIndexList[_curTab] < CONTENT_LEN_LIST[_curTab] - 1)
			_btnPageDown.setState(STATE_NORMAL);
		else
			_btnPageDown.setState(STATE_DISABLE);
		if(_curIndexList[_curTab] > 0)
			_btnPageUp.setState(STATE_NORMAL);
		else
			_btnPageUp.setState(STATE_DISABLE);
	}

}
