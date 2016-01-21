package game.control
{
	public class LoadingManager
	{
	
		private static var _instance:LoadingManager;
	
		private var _loadingWindow:LoadingView;
	
		private var _loadingScene:LoadingView;
	
		private var _curLoadingView:LoadingView;
	
		private var _callback:ICallback;
	
		private var _nextframeCallback:ICallback = new ICallback()
		{
	
			public function run():void
			{
				if(_callback != null)
					_callback.run();
			}
		};
	
		private var _isLoading:Boolean;
	
		public function init(loadingWindowJson:String, loadingSceneJson:String):void
		{
			_loadingWindow = new LoadingView();
			_loadingWindow.buildUI(loadingWindowJson);
			_loadingScene = new LoadingView();
			_loadingScene.buildUI(loadingSceneJson);
			_loadingWindow.releaseRes();
			_loadingScene.releaseRes();
		}
	
		public static function getInstance():LoadingManager
		{
			if(_instance == null)
				_instance = new LoadingManager();
			return _instance;
		}
	
		public function isLoading():Boolean
		{
			return _isLoading;
		}
	
		public function showLoading(isLoadingScene:Boolean, text:String, callback:ICallback):void
		{
			_isLoading = true;
			_callback = callback;
			_curLoadingView = isLoadingScene ? _loadingScene : _loadingWindow;
			_curLoadingView.update(text, _nextframeCallback);
			Global.loadingLayer.addChild(_curLoadingView);
		}
	
		public function hideLoading():void
		{
			Global.loadingLayer.removeChild(_curLoadingView);
			_curLoadingView = null;
			_callback = null;
			_isLoading = false;
		}
	
		public function getCurLoadingView():LoadingView
		{
			return _curLoadingView;
		}
	}
}