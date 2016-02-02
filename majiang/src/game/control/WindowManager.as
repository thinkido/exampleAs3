package game.control
{
	
	import game.constant.WindowType;
	import game.model.Global;
	import game.model.vo.OpenWindowVO;
	
	import ui.UIScene;
	import ui.UIWindow;
	
	public class WindowManager
	{
	
		private static var _instance:WindowManager;
	
		private var _taskList:Array;
	
		private var _windowStack:Array;
	
		private var _curType:WindowType;
	
		private var _curView:UIWindow;
	
		private var _args:Object;
	
		public function WindowManager()
		{
			_windowStack = [];
			_taskList = [];
		}
	
		public static function getInstance():WindowManager
		{
			if(_instance == null)
				_instance = new WindowManager();
			return _instance;
		}
	
		public function openWindow(windowType:WindowType, args:Object = null):void
		{
			var vo:OpenWindowVO = new OpenWindowVO(windowType, args);
//			_taskList.addElement(vo);
			_taskList.push(vo);
			openNext();
		}
	
		private function openNext():void
		{
			if(_taskList.length > 0 && !LoadingManager.getInstance().isLoading())
			{
//				var vo:OpenWindowVO = (OpenWindowVO)_taskList.elementAt(0);
				var vo:OpenWindowVO = _taskList[0] as OpenWindowVO;
				_curType = vo.windowType;
				_args = vo.args;
				if(_curType == WindowType.WINDOW_POPUP)
					doOpen();
				else
				{
					/*LoadingManager.getInstance().showLoading(false, "���ڼ����У������ĵȴ�", new ICallback()
					{
	
						public void run()
						{
							doOpen();
						}
					});*/
					LoadingManager.getInstance().showLoading(false, "窗口加载中，请耐心等待", doOpen);
				}
			}
		}
	
		protected function doOpen():void
		{
			if(_windowStack.isEmpty())
			{
				var curScene:UIScene = SceneManager.getInstance().getCurScene();
				if(curScene != null)
					curScene.onStageBlur();
			}
			else
			{
				var curWindow:UIWindow = getCurWindow();
				curWindow.onStageBlur();
			}
			_curView = _curType.createInstance();
			_curView.releaseRes();
			_curType = null;
			_curView.updateData(_args);
			_args = null;
			_windowStack.addElement(_curView);
			LayerManager.windowLayer.addChild(_curView);
			LoadingManager.getInstance().hideLoading();
			_curView.onStageFocus();
			_curView.onEnter();
			_curView = null;
			_taskList.removeElementAt(0);
			openNext();
		}
	
		public function closeCurWindow():void
		{
			if(!_windowStack.isEmpty())
			{
				var curWindow:UIWindow = getCurWindow();
				curWindow.onStageBlur();
				curWindow.onLeave();
				_windowStack.removeElement(curWindow);
				LayerManager.windowLayer.removeChild(curWindow);
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
					var curScene:UIScene = SceneManager.getInstance().getCurScene();
					if(curScene != null)
						curScene.onStageFocus();
				}
			}
		}
	
		public function closeWindow(curWindow:UIWindow):void
		{
			if(!_windowStack.isEmpty() && _windowStack.contains(curWindow))
			{
				var isCur:Boolean = false;
				if(getCurWindow() == curWindow)
					isCur = true;
				curWindow.onStageBlur();
				curWindow.onLeave();
				_windowStack.removeElement(curWindow);
				LayerManager.windowLayer.removeChild(curWindow);
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
						var curScene:UIScene = SceneManager.getInstance().getCurScene();
						if(curScene != null)
							curScene.onStageFocus();
					}
				}
			}
		}
	
		public function closeAllWindow():void
		{
			if(!_windowStack.isEmpty())
			{
				while(!_windowStack.isEmpty())
				{
					var curWindow:UIWindow = getCurWindow();
					curWindow.onStageBlur();
					curWindow.onLeave();
					_windowStack.removeElement(curWindow);
					LayerManager.windowLayer.removeChild(curWindow);
					curWindow.releaseRes();
					curWindow.onDispose();
					curWindow = null;
				}
				var curScene:UIScene = SceneManager.getInstance().getCurScene();
				if(curScene != null)
					curScene.onStageFocus();
			}
		}
	
		public function getCurWindow():UIWindow
		{
			if(_windowStack && _windowStack.length)
			{
//				return _windowStack.lastElement() as UIWindow;
				return _windowStack[_windowStack.length - 1];
			}
			return null;
		}
	}
}
