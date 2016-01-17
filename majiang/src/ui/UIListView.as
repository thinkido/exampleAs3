package ui
{	
	import framework.util.ViewUtil;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class UIListView extends UIObject
	{
		
		/**
		 * 子元素焦点图片
		 */
		private var _focusTexture:Image;
		
		/**
		 * 滚动方向
		 */
		private var _scrollDir:int;
		
		/**
		 * 显示长度
		 */
		private var _length:int;
		
		/**
		 * 数据列表
		 */
		private var _dataList:Array = [];
		
		/**
		 * 子元素列表
		 */
		private var _itemList:Array;
		
		/**
		 * 子元素类型
		 */
		private var _itemClass:Class;
		
		/**
		 * 当前子元素在所有子元素中的偏移量
		 */
		private var _offsetInList:int = 0;
		
		/**
		 * 当前数据集在所有数据中的偏移量
		 */
		private var _offsetInData:int = 0;
		
		/**
		 * 初始化列表
		 * 
		 * @param itemClass 子元素类
		 * @param scrollDir 滚动方向
		 * @param length 显示长度
		 */
		public function initialize(itemClass:Class,  scrollDir:int, length:int):void
		{
			_itemList = [];
			_itemClass = itemClass;
			_scrollDir = scrollDir;
			_length = length;
			for(var i:int = 0; i < _length; i++)
			{
				try
				{
					var item:UIListItem = _itemClass.newInstance() as UIListItem;
					var x:int = 0;
					var y:int = 0;
					if(_scrollDir == SCROLL_HORIZONTAL)
					{
						x = i * item.getGap();
					}
					else
					{
						y = i * item.getGap();
					}
					item.setPosition(x, y);
					item.setVisible(false);
					addChild(item);
					_itemList.addElement(item);
				}
				catch( e:Error)
				{
					e.printStackTrace();
				}
				catch( e:Error)
				{
					e.printStackTrace();
				}
			}
		}
		
		public function hasPre():Boolean
		{
			return _offsetInData + _offsetInList > 0;
		}
		
		public function hasNext():Boolean
		{
			return _offsetInData + _offsetInList < _dataList.size() - 1;
		}
		
		public function getCurRate():Number
		{
			return (_offsetInData + _offsetInList) / (_dataList.size() - 1.0);
		}
		
		public function getOffsetInData():int
		{
			return _offsetInData;
		}
		
		public function getOffsetInList():int
		{
			return _offsetInList;
		}
		
		public function getCurData():Object
		{
			var index:int = _offsetInData + _offsetInList;
			if(_dataList.length > index)
				return _dataList[index];
			else
				return null;
		}
		
		/**
		 * 设置状态，如果当前是STATE_FOCUS,则在其选中的子元素上显示焦点图片
		 */
		override public function setState( state:int):void
		{
			if(_state != state)
			{
				var curItem:UIListItem = _itemList[_offsetInList];
				if(STATE_FOCUS == state)
				{
					curItem.setState(STATE_FOCUS);
					if(null != _focusTexture)
					{
						addChild(_focusTexture);
						ViewUtil.setCenter(_focusTexture, curItem);
					}
				}
				else
				{
					if(null != _focusTexture)
						removeChild(_focusTexture);
					curItem.setState(state);
				}
				super.setState(state);
			}
		}
		
		/**
		 * 设置数据
		 * 
		 * @param data
		 */
		public function setData( data:Array):void
		{
			_dataList = data;
			updateItems();
		}
		
		/**
		 * 设置当前选中项编号
		 * 
		 * @param index
		 */
		public function setOffset( offsetindata:int, offsetinlist:int):void
		{
			_offsetInData = offsetindata;
			changeFocus(0);
			changeFocus(offsetinlist);
			updateItems();
		}
		
		/**
		 * 设置焦点图片
		 * 
		 * @param t
		 */
		public function setFocusTexture( t:Texture):void
		{
			if(null == _focusTexture)
			{
				_focusTexture = new Image(t);
				if(_state == STATE_FOCUS)
				{
					addChild(_focusTexture);
					var curItem:UIListItem = _itemList[_offsetInList];
					curItem.setState(STATE_FOCUS);
					ViewUtil.setCenter(_focusTexture, curItem);
				}
			}
			else
				_focusTexture.setTexture(t);
		}
		
		/**
		 * 如果是滚动方向的操作则返回true并执行滚动，否则返回false
		 * 
		 * @param dir
		 * @return
		 */
		public function tryMoveOnce( dir:int):Boolean
		{
			if(_scrollDir == SCROLL_VERTICAL)
			{
				if(dir == DIR_UP || dir == DIR_DOWN)
				{
					moveOnce(dir);
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				if(dir == DIR_LEFT || dir == DIR_RIGHT)
				{
					moveOnce(dir);
					return true;
				}
				else
				{
					return false;
				}
			}
		}
		
		/**
		 * 滚动
		 * 
		 * @param dir
		 */
		public function moveOnce(dir:int):void
		{
			if(_dataList.length > 0)
			{
				if(dir == DIR_UP || dir == DIR_LEFT)
				{
					if(_offsetInList > 0)
						changeFocus(_offsetInList - 1);
					else if(_offsetInData > 0)
					{
						_offsetInData--;
						updateItems();
					}
				}
				else
				{
					if(_offsetInList < _length - 1)
						changeFocus(_offsetInList + 1);
					else if(_offsetInData < _dataList.size() - _length)
					{
						_offsetInData++;
						updateItems();
					}
				}
			}
		}
		
		/**
		 * 更新子元素内容
		 */
		public function updateItems():void
		{
			for(var i:int = 0; i < _length; i++)
			{
				var item:UIListItem = _itemList[i];
				if(null == _dataList)
				{
					item.setVisible(false);
				}
				else
				{
					if(_dataList.length > _offsetInData + i)
					{
						var data:Object = _dataList[_offsetInData + i];
						item.setItemData(data, i + _offsetInData);
						item.setVisible(true);
					}
					else
					{
						item.setVisible(false);
					}
				}
			}

		}
		
		/**
		 * 改变焦点
		 * 
		 * @param to
		 */
		public function changeFocus(to:int):void
		{
			if(_offsetInList != to)
			{
				(_itemList[_offsetInList] as UIListItem).setState(STATE_NORMAL);
				_offsetInList = to;
				if(STATE_FOCUS == _state)
				{
					var curItem:UIListItem = _itemList[_offsetInList];
					curItem.setState(STATE_FOCUS);
					if(null != _focusTexture)
						ViewUtil.setCenter(_focusTexture, curItem);
				}
			}
		}
		
		public function initWithJsonObject( data:JSONObject):void
		{
			try
			{
				setFocusTexture(getTexture(transformPath(data.getJSONObject("FileData").getString("Path"))));
				setName(data.getString("Name"));
				autoSetPosition(data);
			}
			catch( e:Error)
			{
				e.printStackTrace();
			}
		}
		
		override public function onDispose():void
		{
			_focusTexture = null;
			_dataList = null;
			_itemList = null;
			_itemClass = null;
			var len:int = numChildren();
			for(var i:int = 0; i < len; i++)
			{
				try
				{
					(getChildAt(i) as UIComponent).onDispose();
				}
				catch( e:Error)
				{
				}
			}
			removeAllChildren();
			super.onDispose();
		}
	}
}