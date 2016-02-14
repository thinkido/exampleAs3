package ui
{
	import framework.util.ViewUtil;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class UIButton extends UIObject
	{
		
		/**
		 * 各状态对应图片
		 */
		protected var _srcBitmapArr:Vector.<Image> = new Vector.<Image>(3);
		
		/**
		 * 焦点显示模式
		 */
		protected var _isAddFocusSign:Boolean = false;
		
		public function UIButton()
		{
			
		}
		
		public function UIButton_2(normal:String, focus:String, disable:String):void
		{
			_srcBitmapArr[0] = new Image(getTexture(normal));
			_srcBitmapArr[1] = new Image(getTexture(focus));
			_srcBitmapArr[2] = new Image(getTexture(disable));
			
//			setWidth(_srcBitmapArr[0].getWidth());
//			setWidth(_srcBitmapArr[0].getHeight());
			
			this.width = _srcBitmapArr[0].width;
			this.height = _srcBitmapArr[0].height;
			
			addChild(_srcBitmapArr[0]);
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
		 * @param img
		 */
		public function setStateView(state:int, t:Texture):void
		{
//			_srcBitmapArr[state].setTexture(t);
			_srcBitmapArr[state].texture = t;
		}
		
		override public function initWithJsonObject( data:Object):void
		{
			try
			{
//				_srcBitmapArr[0] = new Image(getTexture(transformPath(data.getJSONObject("NormalFileData").getString("Path"))));
//				_srcBitmapArr[1] = new Image(getTexture(transformPath(data.getJSONObject("PressedFileData").getString("Path"))));
//				_srcBitmapArr[2] = new Image(getTexture(transformPath(data.getJSONObject("DisabledFileData").getString("Path"))));
				_srcBitmapArr[0] = new Image(getTexture(transformPath(data["NormalFileData"]["Path"])));
				_srcBitmapArr[1] = new Image(getTexture(transformPath(data["PressedFileData"]["Path"])));
				_srcBitmapArr[2] = new Image(getTexture(transformPath(data["DisabledFileData"]["Path"])));
				_isAddFocusSign = data.has("TouchEnable") && data["TouchEnable"];
				if(_isAddFocusSign)
				{
					ViewUtil.setCenter(_srcBitmapArr[STATE_FOCUS], _srcBitmapArr[STATE_NORMAL]);
					ViewUtil.setCenter(_srcBitmapArr[STATE_DISABLE], _srcBitmapArr[STATE_NORMAL]);
				}
				addChild(_srcBitmapArr[_state]);
//				setName(data.getString("Name"));
				this.name = data["Name"];
				autoSetPosition(data);
			}
			catch( e:Error)
			{
//				e.printStackTrace();
				trace(e.message);
			}
		}
		
		override public function setState( state:int):void
		{
			if(_state != state)
			{
				if(_isAddFocusSign)
				{
					switch(_state)
					{
						case STATE_NORMAL:
							if(state == STATE_FOCUS)
							{
								addChild(_srcBitmapArr[STATE_FOCUS]);
							}
							else
							{
								addChild(_srcBitmapArr[STATE_DISABLE]);
							}
							break;
						case STATE_FOCUS:
							if(state == STATE_NORMAL)
							{
								removeChild(_srcBitmapArr[STATE_FOCUS]);
							}
							else
							{
								removeChild(_srcBitmapArr[STATE_FOCUS]);
								addChild(_srcBitmapArr[STATE_DISABLE]);
							}
							break;
						case STATE_DISABLE:
							if(state == STATE_FOCUS)
							{
								removeChild(_srcBitmapArr[STATE_DISABLE]);
								addChild(_srcBitmapArr[STATE_FOCUS]);
							}
							else
							{
								removeChild(_srcBitmapArr[STATE_DISABLE]);
							}
							break;
					}
				}
				else
				{
					this.removeChild(_srcBitmapArr[_state]);
					this.addChild(_srcBitmapArr[state]);
				}
				super.setState(state);
			}
		}
		
		override public function onDispose():void
		{
			_srcBitmapArr = null;
			super.onDispose();
		}
	}
}