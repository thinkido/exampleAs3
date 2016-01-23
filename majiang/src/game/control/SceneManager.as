package game.control
{
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
				Global.sceneLayer.removeChild(_curView);
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
		
		public function switchScene(SceneType:SceneType):void
		{
			switchScene(SceneType, null);
		}
		
		public function switchScene_a(sceneType:SceneType, args:Object):void
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
								
								public function run(data:Object):void
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
				trace("正在加载其他场景，请稍后重试", "LogManager.LEVEL_WARNING");
			}
		}
		
		protected function startSwitch():void
		{
			LoadingManager.getInstance().showLoading(true, "场景加载中，请耐心等待", new ICallback()
				{
					
					public void run()
					{
						doSwitch();
					}
				});
		}
		
		protected function doSwitch():void
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
		
		protected function finishSwitch():void
		{
			ActionManager.getInstance().doAction(
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
				}, null))}));
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