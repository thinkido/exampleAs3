
package game.control;

import game.constant.WindowType;
import game.model.Global;
import game.model.callback.ICallback;
import game.model.vo.OpenWindowVO;

import java.util.Vector;

import ui.UIScene;
import ui.UIWindow;

public class WindowManager
{

	private static WindowManager _instance;

	private Vector _taskList;

	private Vector _windowStack;

	private WindowType _curType;

	private UIWindow _curView;

	private Object _args;

	private WindowManager()
	{
		_windowStack = new Vector();
		_taskList = new Vector();
	}

	public static WindowManager getInstance()
	{
		if(_instance == null)
			_instance = new WindowManager();
		return _instance;
	}

	public void openWindow(WindowType WindowType)
	{
		openWindow(WindowType, null);
	}

	public void openWindow(WindowType windowType, Object args)
	{
		OpenWindowVO vo = new OpenWindowVO(windowType, args);
		_taskList.addElement(vo);
		openNext();
	}

	private void openNext()
	{
		if(_taskList.size() > 0 && !LoadingManager.getInstance().isLoading())
		{
			OpenWindowVO vo = (OpenWindowVO)_taskList.elementAt(0);
			_curType = vo.windowType;
			_args = vo.args;
			if(_curType == WindowType.WINDOW_POPUP)
				doOpen();
			else
			{
				LoadingManager.getInstance().showLoading(false, "窗口加载中，请耐心等待", new ICallback()
				{

					public void run()
					{
						doOpen();
					}
				});
			}
		}
	}

	protected void doOpen()
	{
		if(_windowStack.isEmpty())
		{
			UIScene curScene = SceneManager.getInstance().getCurScene();
			if(curScene != null)
				curScene.onStageBlur();
		}
		else
		{
			UIWindow curWindow = getCurWindow();
			curWindow.onStageBlur();
		}
		_curView = _curType.createInstance();
		_curView.releaseRes();
		_curType = null;
		_curView.updateData(_args);
		_args = null;
		_windowStack.addElement(_curView);
		Global.windowLayer.addChild(_curView);
		LoadingManager.getInstance().hideLoading();
		_curView.onStageFocus();
		_curView.onEnter();
		_curView = null;
		_taskList.removeElementAt(0);
		openNext();
	}

	public void closeCurWindow()
	{
		if(!_windowStack.isEmpty())
		{
			UIWindow curWindow = getCurWindow();
			curWindow.onStageBlur();
			curWindow.onLeave();
			_windowStack.removeElement(curWindow);
			Global.windowLayer.removeChild(curWindow);
			curWindow.releaseRes();
			curWindow.onDispose();
			curWindow = null;
			if(!_windowStack.isEmpty())
			{
				curWindow = getCurWindow();
				curWindow.onStageFocus();
			}
			else
			{
				UIScene curScene = SceneManager.getInstance().getCurScene();
				if(curScene != null)
					curScene.onStageFocus();
			}
		}
	}

	public void closeWindow(UIWindow curWindow)
	{
		if(!_windowStack.isEmpty() && _windowStack.contains(curWindow))
		{
			boolean isCur = false;
			if(getCurWindow() == curWindow)
				isCur = true;
			curWindow.onStageBlur();
			curWindow.onLeave();
			_windowStack.removeElement(curWindow);
			Global.windowLayer.removeChild(curWindow);
			curWindow.releaseRes();
			curWindow.onDispose();
			curWindow = null;
			if(isCur)
			{
				if(!_windowStack.isEmpty())
				{
					curWindow = getCurWindow();
					curWindow.onStageFocus();
				}
				else
				{
					UIScene curScene = SceneManager.getInstance().getCurScene();
					if(curScene != null)
						curScene.onStageFocus();
				}
			}
		}
	}

	public void closeAllWindow()
	{
		if(!_windowStack.isEmpty())
		{
			while(!_windowStack.isEmpty())
			{
				UIWindow curWindow = getCurWindow();
				curWindow.onStageBlur();
				curWindow.onLeave();
				_windowStack.removeElement(curWindow);
				Global.windowLayer.removeChild(curWindow);
				curWindow.releaseRes();
				curWindow.onDispose();
				curWindow = null;
			}
			UIScene curScene = SceneManager.getInstance().getCurScene();
			if(curScene != null)
				curScene.onStageFocus();
		}
	}

	public UIWindow getCurWindow()
	{
		if(!_windowStack.isEmpty())
		{
			return (UIWindow)_windowStack.lastElement();
		}
		else
		{
			return null;
		}
	}
}
