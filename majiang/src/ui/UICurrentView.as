package ui
{	
	import framework.consts.EventType;
	import framework.consts.KeyType;
	
	import starling.display.Stage;
	import starling.events.EventDispatcher;
	import starling.text.TextField;
	
	public class UICurrentView extends UIContainer //implements IEventListener
	{
	
		public static const TEXT_INPUT_MAX_LENGTH:int = 999;
	
		protected var _selected:UIObject = null;
	
		protected var _isInput:Boolean = false;
	
		protected var _args:Object;
	
		/**
		 * 初始化UI
		 * 
		 * @param path
		 */
		protected function initUI():void
		{
			
		}
	
		public function buildUI( confName:String):void
		{
			var data:JSONObject = getJson(confName);
			initWithJsonObject(data);
			initUI();
		}
	
		public function updateData( args:Object):void
		{
			_args = args;
		}
	
		public function startInput():void
		{
			var tf:TextField = _selected as TextField;
			if(null != tf)
			{
				tf.text = tf.text + "|";
				_isInput = true;
			}
		}
	
		public function stopInput():void
		{
			_isInput = false;
			var tf:TextField = _selected;
			var text:String = tf.text;
			tf.text = text.substring(0, text.length() - 1);
		}
	
		public function onReciveEvent(type:int, dispatcher:EventDispatcher, data:Object):void
		{
			if(type == EventType.EVENT_KEY_PRESSED)
			{
				onKeyPressed(type, dispatcher, data);
			}
		}
	
		protected function onKeyPressed(type:int,  dispatcher:EventDispatcher,  data:Object):void
		{
			if(_selected != null)
			{
				var keyCode:int = int(data);
				if(_isInput)
				{
					var tf:TextField = _selected;
					var text:String = tf.text;
					switch(keyCode)
					{
						case KeyType.UP:
						case KeyType.DOWN:
							stopInput();
							onReciveEvent(type, dispatcher, data);
							break;
						case KeyType.LEFT:
							var strlen:int = text.length();
							if(strlen > 2)
							{
								text = text.substring(0, strlen - 2) + "|";
							}
							else
							{
								text = "|";
							}
							tf.text = text;
							break;
						case KeyType.NUM_0:
						case KeyType.NUM_1:
						case KeyType.NUM_2:
						case KeyType.NUM_3:
						case KeyType.NUM_4:
						case KeyType.NUM_5:
						case KeyType.NUM_6:
						case KeyType.NUM_7:
						case KeyType.NUM_8:
						case KeyType.NUM_9:
							if(text.length() > TEXT_INPUT_MAX_LENGTH)
							{
								break;
							}
							text = text.substring(0, text.length() - 1) + (keyCode - 48) + "|";
							tf.text = text;
							break;
						case KeyType.BACK:
						case KeyType.ITV_BACK:
						case KeyType.CONFIRM:
							stopInput();
							break;
					}
				}
				else
				{
					var dir:int = -1;
					switch(keyCode)
					{
						case KeyType.UP:
							dir = DIR_UP;
							break;
						case KeyType.DOWN:
							dir = DIR_DOWN;
							break;
						case KeyType.LEFT:
							dir = DIR_LEFT;
							break;
						case KeyType.RIGHT:
							dir = DIR_RIGHT;
							break;
						case KeyType.CONFIRM:
							if(_selected.getClass() == UICheckBox.class)
							{
								(_selected as UICheckBox).swapCheckedState();
							}
							onConfirm(_selected);
							break;
						case KeyType.BACK:
						case KeyType.ITV_BACK:
							onGoBack();
							break;
					}
					if(dir != -1)
					{
						onMove(dir);
					}
				}

			}

		}
	
		/**
		 * 处理选中对象变更
		 * 
		 * @param dir
		 */
		protected function onMove( dir:int):void
		{
			if(_selected.getClass() != UIListView.class || !(_selected as UIListView).tryMoveOnce(dir))
			{
				var target:UIObject = _selected.getNeighbor(dir);
				while(null != target && STATE_DISABLE == target.getState())
				{
					target = target.getNeighbor(dir);
					if(target == _selected)
					{
						target = null;
						break;
					}
				}
				if(null != target)
				{
					switchFocus(target);
				}
			}
		}
	
		/**
		 * 变更选中对象
		 * 
		 * @param target
		 */
		public function switchFocus( target:UIObject):void
		{
			if(_selected != target)
			{
				if(_selected != null)
				{
					if(_selected.getClass() == UICheckBox.class)
						_selected.setState((_selected as UICheckBox).isChecked() ? STATE_CHECKED_NORMAL : STATE_NORMAL);
					else
						_selected.setState(STATE_NORMAL);
				}
				_selected = target;
				if(_selected.getClass() == UICheckBox.class)
					_selected.setState((_selected as UICheckBox).isChecked() ? STATE_CHECKED_FOCUS : STATE_FOCUS);
				else
					_selected.setState(STATE_FOCUS);
			}

		}
	
		/**
		 * 获得焦点
		 */
		public function onStageFocus():void
		{
			Stage.current.keyboard.addEventListener(EventType.EVENT_KEY_PRESSED, this);
		}
	
		/**
		 * 失去焦点
		 */
		public function onStageBlur():void
		{
			Stage.current.keyboard.removeEventListener(EventType.EVENT_KEY_PRESSED, this);
		}
	
		/**
		 * 返回
		 */
		public function onGoBack():void
		{
			
		}
	
		/**
		 * 进入
		 */
		public function onEnter():void
		{
			
		}
	
		/**
		 * 离开
		 */
		public function onLeave():void
		{
			
		}
	
		/**
		 * confirm处理
		 * 
		 * @param target
		 */
		public function onConfirm(target:UIObject):void
		{
			
		}
	
		override public function onDispose():void
		{
			_args = null;
			_selected = null;
			super.onDispose();
		}
	}
}
