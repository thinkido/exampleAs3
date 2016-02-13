package game.control
{
	import com.greensock.TweenMax;
	
	import flash.utils.setTimeout;
	
	import game.constant.SceneType;
	import game.model.Global;
	import game.model.action.Action;
	import game.model.action.ActionImmediately;
	import game.model.action.ActionMoveBy;
	import game.model.action.ActionSequence;
	import game.util.CommonUtil;
	import game.view.inline.LoadingView;
	
	import managers.LayerManager;
	
	import starling.display.Image;
	
	import ui.UIScene;
	import ui.UIWindow;
	
	public class SceneManager
	{
		
		private static var SWITCH_TIME:Number = 400;
		
		private static var _instance:SceneManager;
		
		private var _curType:SceneType;
		
		private var _curView:UIScene;
		
		private var _args:Object;
		
		private var _curSceneCache:Image;
		
		public function SceneManager():void
		{
		}
		
		public function reset():void
		{
			if(null != _curView)
			{
				_curView.onStageBlur();
				_curView.onLeave();
				LayerManager.sceneLayer.removeChild(_curView);
				_curView.releaseRes();
				_curView.onDispose();
				_curView = null;
				_curType = null;
			}
		}
		
		public static function getInstance():SceneManager
		{
			if(_instance == null)
				_instance = new SceneManager();
			return _instance;
		}
				
		public function switchScene(sceneType:SceneType, args:Object = null):void
		{
			if(!LoadingManager.getInstance().isLoading())
			{
				if(_curType != sceneType)
				{
					_curType = sceneType;
					_args = args;
					var curWindow:UIWindow = WindowManager.getInstance().getCurWindow();
					if(null != curWindow)
					{
						curWindow.onStageBlur();
					}
					if(null != _curView)
					{
						_curSceneCache = Global.root() ; // CommonUtil.getSnapShot();
						_curView.onStageBlur();
						_curView.onLeave();
						LayerManager.sceneLayer.removeChild(_curView);
						_curView.releaseRes();
						_curView.onDispose();
						_curView = null;
						LayerManager.sceneLayer.addChild(_curSceneCache);
						startSwitch();
//						LoadingManager.getInstance().getCurLoadingView().setPosition(640, 0);
						var loadingView:LoadingView = LoadingManager.getInstance().getCurLoadingView();
						loadingView.x = 640;
						loadingView.y = 0;
						
						TweenMax.to( LoadingManager.getInstance().getCurLoadingView(), SWITCH_TIME / 1000, { "x":LoadingManager.getInstance().getCurLoadingView().x - 640, 
							"onComplete":onMoveComplete, "onCompleteParams":[_curSceneCache] } );
					}
					else
					{
						startSwitch();
					}
				}
			}else
			{
				trace("正在加载其他场景，请稍后重试", "LogManager.LEVEL_WARNING");
			}
		}
		
		private function onMoveComplete( img:Image ):void
		{
			LayerManager.sceneLayer.removeChild(img);
		}
		
		protected function startSwitch():void
		{
			/*LoadingManager.getInstance().showLoading(true, "场景加载中，请耐心等待", new ICallback()
				{
					
					public void run()
					{
						doSwitch();
					}
				});*/
			
			LoadingManager.getInstance().showLoading(true, "场景加载中，请耐心等待", doSwitch);
		}
		
		protected function doSwitch():void
		{
			_curView = _curType.createInstance();
			_curView.releaseRes();
			_curView.updateData(_args);
			_args = null;
			LayerManager.sceneLayer.addChild(_curView);
			/*LoadingManager.getInstance().showLoading(true, "场景加载完毕，即将呈现", new ICallback()
				{
					
					public void run()
					{
						finishSwitch();
					}
				});*/
			LoadingManager.getInstance().showLoading(true, "场景加载完毕，即将呈现", finishSwitch);
		}
		
		protected function finishSwitch():void
		{
			/*ActionManager.getInstance().doAction(
				new ActionSequence(
					new Action[]{
						new ActionMoveBy(LoadingManager.getInstance().getCurLoadingView(), -640, 0, SWITCH_TIME), new ActionImmediately(new CallbackO(new ICallbackO()
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
				}, null))}));*/
			
			TweenMax.to( LoadingManager.getInstance().getCurLoadingView(), SWITCH_TIME / 1000, { "x":LoadingManager.getInstance().getCurLoadingView().x - 640, 
				"onComplete":onMoveCompleteB, "onCompleteParams":[_curView] } );
		}
		
		private function onMoveCompleteB( view:UIScene ):void
		{
			LoadingManager.getInstance().hideLoading();
			var curWindow:UIWindow = WindowManager.getInstance().getCurWindow();
			if(curWindow == null)
				view.onStageFocus();
			else
				curWindow.onStageFocus();
			view.onEnter();
		}

		
		public function getCurScene():UIScene
		{
			return _curView;
		}
		
		public function  getCurSceneType():SceneType
		{
			return _curType;
		}
	}
}