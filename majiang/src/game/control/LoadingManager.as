package game.control
{
	import game.view.inline.LoadingView;
	
	import managers.LayerManager;

	public class LoadingManager
	{
	
		private static var _instance:LoadingManager;
	
		private var _loadingWindow:LoadingView;
	
		private var _loadingScene:LoadingView;
	
		private var _curLoadingView:LoadingView;
	
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
	
		public function showLoading(isLoadingScene:Boolean, text:String, callback:Function):void
		{
			_isLoading = true;
			_curLoadingView = isLoadingScene ? _loadingScene : _loadingWindow;
			_curLoadingView.update(text, callback);
			LayerManager.topLayer.addChild(_curLoadingView);
		}
	
		public function hideLoading():void
		{
			LayerManager.topLayer.removeChild(_curLoadingView);
			_curLoadingView = null;
			_isLoading = false;
		}
	
		public function getCurLoadingView():LoadingView
		{
			return _curLoadingView;
		}
	}
}