package game.control
{
	import game.constant.SceneType;
	import game.model.Global;
	import game.model.action.Action;
	import game.model.action.ActionImmediately;
	import game.model.action.ActionMoveBy;
	import game.model.action.ActionSequence;
	import game.model.callback.CallbackO;
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
						Global.sceneLayer.removeChild(_curView);
						_curView.releaseRes();
						_curView.onDispose();
						_curView = null;
						Global.sceneLayer.addChild(_curSceneCache);
						startSwitch();
						LoadingManager.getInstance().getCurLoadingView().setPosition(640, 0);
						
						/*ActionManager.getInstance().doAction(new ActionSequence({new ActionMoveBy(LoadingManager.getInstance().getCurLoadingView(), -640, 0, SWITCH_TIME),
								new ActionImmediately(new CallbackO(new CallbackO_A(_curSceneCache), null))}));*/
						
						var callback:CallbackO = new CallbackO(new CallbackO_A(_curSceneCache), null);
						var actionImm:ActionImmediately = new ActionImmediately(callback);
						var moveBy:ActionMoveBy = new ActionMoveBy(LoadingManager.getInstance().getCurLoadingView(), -640, 0, SWITCH_TIME);
						var vect:Vector.<Action> = new Vector.<Action>();
//						vect.push({moveBy, actionImm});
						var sequence:ActionSequence = new ActionSequence(vect);
						ActionManager.getInstance().doAction(sequence);
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
		
		protected function startSwitch():void
		{
			/*LoadingManager.getInstance().showLoading(true, "场景加载中，请耐心等待", new ICallback()
				{
					
					public void run()
					{
						doSwitch();
					}
				});*/
			
			LoadingManager.getInstance().showLoading(true, "场景加载中，请耐心等待", new Callback_B(doSwitch));
		}
		
		protected function doSwitch():void
		{
			_curView = _curType.createInstance();
			_curView.releaseRes();
			_curView.updateData(_args);
			_args = null;
			Global.sceneLayer.addChild(_curView);
			/*LoadingManager.getInstance().showLoading(true, "场景加载完毕，即将呈现", new ICallback()
				{
					
					public void run()
					{
						finishSwitch();
					}
				});*/
			LoadingManager.getInstance().showLoading(true, "场景加载完毕，即将呈现", new Callback_B(finishSwitch));
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
			
			var callbackO:ICallbackO = new CallbackO_B(_curView);
			var actionImm:ActionImmediately = new ActionImmediately( new CallbackO(callbackO, null));
			var moveBy:ActionMoveBy = new ActionMoveBy(LoadingManager.getInstance().getCurLoadingView(), -640, 0, SWITCH_TIME);
			var vect:Vector.<Action> = new Vector.<Action>;
			vect.push();
			var sequence:ActionSequence = new ActionSequence(vect);
			ActionManager.getInstance().doAction(sequence);
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
import game.control.LoadingManager;
import game.control.WindowManager;
import game.model.Global;
import game.model.callback.ICallback;
import game.model.callback.ICallbackO;

import starling.display.Image;

import ui.UIScene;
import ui.UIWindow;

class CallbackO_A implements ICallbackO
{
	private var _curSceneCache:Image;
	
	public function CallbackO_A(img:Image)
	{
		_curSceneCache = img;
	}
	
	public function run(data:Object):void
	{
		Global.sceneLayer.removeChild(_curSceneCache);
		_curSceneCache = null;
	}
}

class CallbackO_B implements ICallbackO
{
	private var _curView:UIScene
	
	public function CallbackO_B($scene:UIScene)
	{
		_curView = $scene;
	}
	
	public function run( data:Object):void
	{
		LoadingManager.getInstance().hideLoading();
		var curWindow:UIWindow = WindowManager.getInstance().getCurWindow();
		if(curWindow == null)
			_curView.onStageFocus();
		else
			curWindow.onStageFocus();
		_curView.onEnter();
	}
}

class Callback_B implements ICallback
{
	private var func:Function;
	
	public function Callback_B(myFunc:Function):void
	{
		func = myFunc;
	}
	public function run():void
	{
		if(this.func)
		{
			this.func();
		}
//		doSwitch();
	}
}