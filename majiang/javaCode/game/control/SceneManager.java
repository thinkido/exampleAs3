
package game.control;

import framework.views.Bitmap;
import game.constant.SceneType;
import game.model.Global;
import game.model.action.Action;
import game.model.action.ActionImmediately;
import game.model.action.ActionMoveBy;
import game.model.action.ActionSequence;
import game.model.callback.CallbackO;
import game.model.callback.ICallback;
import game.model.callback.ICallbackO;
import game.util.CommonUtil;
import ui.UIScene;
import ui.UIWindow;

public class SceneManager
{

	private static final long SWITCH_TIME = 400;

	private static SceneManager _instance;

	private SceneType _curType;

	private UIScene _curView;

	private Object _args;

	private Bitmap _curSceneCache;

	private SceneManager()
	{
	}

	public void reset()
	{
		if(null != _curView)
		{
			_curView.onStageBlur();
			_curView.onLeave();
			Global.sceneLayer.removeChild(_curView);
			_curView.releaseRes();
			_curView.onDispose();
			_curView = null;
			_curType = null;
		}
	}

	public static SceneManager getInstance()
	{
		if(_instance == null)
			_instance = new SceneManager();
		return _instance;
	}

	public void switchScene(SceneType SceneType)
	{
		switchScene(SceneType, null);
	}

	public void switchScene(SceneType sceneType, Object args)
	{
		if(!LoadingManager.getInstance().isLoading())
		{
			if(_curType != sceneType)
			{
				_curType = sceneType;
				_args = args;
				UIWindow curWindow = WindowManager.getInstance().getCurWindow();
				if(null != curWindow)
				{
					curWindow.onStageBlur();
				}
				if(null != _curView)
				{
					_curSceneCache = CommonUtil.getSnapShot();
					_curView.onStageBlur();
					_curView.onLeave();
					Global.sceneLayer.removeChild(_curView);
					_curView.releaseRes();
					_curView.onDispose();
					_curView = null;
					Global.sceneLayer.addChild(_curSceneCache);
					startSwitch();
					LoadingManager.getInstance().getCurLoadingView().setPosition(640, 0);
					ActionManager.getInstance().doAction(new ActionSequence(new Action[]{new ActionMoveBy(LoadingManager.getInstance().getCurLoadingView(), -640, 0, SWITCH_TIME), new ActionImmediately(new CallbackO(new ICallbackO()
					{

						public void run(Object data)
						{
							Global.sceneLayer.removeChild(_curSceneCache);
							_curSceneCache = null;
						}
					}, null))}));
				}
				else
				{
					startSwitch();
				}
			}
		}
		else
		{
			LogManager.getInstance().log("正在加载其他场景，请稍后重试", LogManager.LEVEL_WARNING);
		}
	}

	protected void startSwitch()
	{
		LoadingManager.getInstance().showLoading(true, "场景加载中，请耐心等待", new ICallback()
		{

			public void run()
			{
				doSwitch();
			}
		});
	}

	protected void doSwitch()
	{
		_curView = _curType.createInstance();
		_curView.releaseRes();
		_curView.updateData(_args);
		_args = null;
		Global.sceneLayer.addChild(_curView);
		LoadingManager.getInstance().showLoading(true, "场景加载完毕，即将呈现", new ICallback()
		{

			public void run()
			{
				finishSwitch();
			}
		});
	}

	protected void finishSwitch()
	{
		ActionManager.getInstance().doAction(new ActionSequence(new Action[]{new ActionMoveBy(LoadingManager.getInstance().getCurLoadingView(), -640, 0, SWITCH_TIME), new ActionImmediately(new CallbackO(new ICallbackO()
		{

			public void run(Object data)
			{
				LoadingManager.getInstance().hideLoading();
				UIWindow curWindow = WindowManager.getInstance().getCurWindow();
				if(curWindow == null)
					_curView.onStageFocus();
				else
					curWindow.onStageFocus();
				_curView.onEnter();
			}
		}, null))}));
	}

	public UIScene getCurScene()
	{
		return _curView;
	}

	public SceneType getCurSceneType()
	{
		return _curType;
	}
}
