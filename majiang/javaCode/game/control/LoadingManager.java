
package game.control;

import game.model.Global;
import game.model.callback.ICallback;
import game.view.inline.LoadingView;

public class LoadingManager
{

	private static LoadingManager _instance;

	private LoadingView _loadingWindow;

	private LoadingView _loadingScene;

	private LoadingView _curLoadingView;

	private ICallback _callback;

	private ICallback _nextframeCallback = new ICallback()
	{

		public void run()
		{
			if(_callback != null)
				_callback.run();
		}
	};

	private boolean _isLoading;

	public void init(String loadingWindowJson, String loadingSceneJson)
	{
		_loadingWindow = new LoadingView();
		_loadingWindow.buildUI(loadingWindowJson);
		_loadingScene = new LoadingView();
		_loadingScene.buildUI(loadingSceneJson);
		_loadingWindow.releaseRes();
		_loadingScene.releaseRes();
	}

	public static LoadingManager getInstance()
	{
		if(_instance == null)
			_instance = new LoadingManager();
		return _instance;
	}

	public boolean isLoading()
	{
		return _isLoading;
	}

	public void showLoading(boolean isLoadingScene, String text, ICallback callback)
	{
		_isLoading = true;
		_callback = callback;
		_curLoadingView = isLoadingScene ? _loadingScene : _loadingWindow;
		_curLoadingView.update(text, _nextframeCallback);
		Global.loadingLayer.addChild(_curLoadingView);
	}

	public void hideLoading()
	{
		Global.loadingLayer.removeChild(_curLoadingView);
		_curLoadingView = null;
		_callback = null;
		_isLoading = false;
	}

	public LoadingView getCurLoadingView()
	{
		return _curLoadingView;
	}
}