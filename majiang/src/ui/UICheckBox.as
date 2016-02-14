package ui
{
	import framework.util.ViewUtil;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class UICheckBox extends UIObject
	{
		
		/**
		 * 各状态对应图片
		 */
		protected var _srcBitmapArr:Vector.<Image> = new Vector.<Image>;
		
		/**
		 * 焦点显示模式
		 */
		protected var _isAddFocusSign:Boolean = false;
		
		protected var _clickable:Boolean = true;
		
		public function UICheckBox()
		{
			
		}
		
		public function isChecked():Boolean
		{
			return _state >= STATE_CHECKED_NORMAL;
		}
		
		public function setClickable( clickable:Boolean):void
		{
			_clickable = clickable;
		}
		
		public function swapCheckedState():void
		{
			if(_clickable)
			{
				if(isChecked())
					_state -= 3;
				else
					_state += 3;
				updateView();
			}
		}
		
		protected function updateView():void
		{
			removeAllChildren();
			switch(_state)
			{
				case STATE_NORMAL:
					addChild(_srcBitmapArr[STATE_NORMAL]);
					break;
				case STATE_FOCUS:
					if(_isAddFocusSign)
						addChild(_srcBitmapArr[STATE_NORMAL]);
					addChild(_srcBitmapArr[STATE_FOCUS]);
					break;
				case STATE_DISABLE:
					addChild(_srcBitmapArr[STATE_DISABLE]);
					break;
				case STATE_CHECKED_NORMAL:
					addChild(_srcBitmapArr[STATE_NORMAL]);
					addChild(_srcBitmapArr[3]);
					break;
				case STATE_CHECKED_FOCUS:
					if(_isAddFocusSign)
					{
						addChild(_srcBitmapArr[STATE_NORMAL]);
					}
					addChild(_srcBitmapArr[3]);
					addChild(_srcBitmapArr[STATE_FOCUS]);
					break;
				case STATE_CHECKED_DISABLE:
					addChild(_srcBitmapArr[STATE_DISABLE]);
					addChild(_srcBitmapArr[4]);
					break;
			}
		}
		
		/**
		 * 设置焦点显示模式
		 * 
		 * @param isAddFocusSign
		 *            true为将STATE_FOCUS图片放到STATE_NORMAL图片上，false为显示STATE_FOCUS图片
		 */
		public function setFocusMode(isAddFocusSign:Boolean):void
		{
			_isAddFocusSign = isAddFocusSign;
		}
		
		/**
		 * 设置某个状态图片
		 * 
		 * @param state
		 * @param t
		 */
		public function setStateView( state:int, t:Texture):void
		{
			if(STATE_CHECKED_FOCUS == state || STATE_CHECKED_NORMAL == state)
			{
//				_srcBitmapArr[3].setTexture(t);
				_srcBitmapArr[3].texture = t;
			}
			else if(STATE_CHECKED_DISABLE == state)
			{
//				_srcBitmapArr[4].setTexture(t);
				_srcBitmapArr[4].texture = t;
			}
			else
			{
//				_srcBitmapArr[state].setTexture(t);
				_srcBitmapArr[state].texture = t;
			}
		}
		
		override public function initWithJsonObject( data:Object):void
		{
			try
			{
				_srcBitmapArr[0] = new Image(getTexture(transformPath(data["NormalBackFileData"]["Path"])));
				_srcBitmapArr[1] = new Image(getTexture(transformPath(data["PressedBackFileData"]["Path"])));
				_srcBitmapArr[2] = new Image(getTexture(transformPath(data["DisableBackFileData"]["Path"])));
				_srcBitmapArr[3] = new Image(getTexture(transformPath(data["NodeNormalFileData"]["Path"])));
				_srcBitmapArr[4] = new Image(getTexture(transformPath(data["NodeDisableFileData"]["Path"])));
				_isAddFocusSign = data.has("TouchEnable") && data.getBoolean("TouchEnable");
				if(_isAddFocusSign)
					ViewUtil.setCenter(_srcBitmapArr[STATE_FOCUS], _srcBitmapArr[STATE_NORMAL]);
				ViewUtil.setCenter(_srcBitmapArr[3], _srcBitmapArr[STATE_NORMAL]);
				ViewUtil.setCenter(_srcBitmapArr[4], _srcBitmapArr[STATE_NORMAL]);
				addChild(_srcBitmapArr[_state]);
//				setName(data["Name"]);
				this.name = data["Name"];
				autoSetPosition(data);
			}
			catch( e:Error)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
		}
		
		override public function setState( state:int):void
		{
			if(_state != state)
			{
				super.setState(state);
				updateView();
			}
		}
		
		override public function onDispose():void
		{
			_srcBitmapArr = null;
			super.onDispose();
		}
	}
}