
package ui;
	
	import java.util.Vector;
	
	import org.json.me.JSONObject;
	
	import framework.resources.Texture;
	import framework.util.ViewUtil;
	import framework.views.Bitmap;
	
	public class UIListView extends UIObject
	{
		
		/**
		 * 子元素焦点图片
		 */
		private Bitmap _focusTexture;
		
		/**
		 * 滚动方向
		 */
		private byte _scrollDir;
		
		/**
		 * 显示长度
		 */
		private int _length;
		
		/**
		 * 数据列表
		 */
		private Vector _dataList = new Vector();
		
		/**
		 * 子元素列表
		 */
		private Vector _itemList;
		
		/**
		 * 子元素类型
		 */
		private Class _itemClass;
		
		/**
		 * 当前子元素在所有子元素中的偏移量
		 */
		private int _offsetInList = 0;
		
		/**
		 * 当前数据集在所有数据中的偏移量
		 */
		private int _offsetInData = 0;
		
		/**
		 * 初始化列表
		 * 
		 * @param itemClass 子元素类
		 * @param scrollDir 滚动方向
		 * @param length 显示长度
		 */
		public void initialize(Class itemClass, byte scrollDir, int length)
		{
			_itemList = new Vector();
			_itemClass = itemClass;
			_scrollDir = scrollDir;
			_length = length;
			for(int i = 0; i < _length; i++)
			{
				try
				{
					UIListItem item = (UIListItem)_itemClass.newInstance();
					int x = 0;
					int y = 0;
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
				catch(InstantiationException e)
				{
					e.printStackTrace();
				}
				catch(IllegalAccessException e)
				{
					e.printStackTrace();
				}
			}
		}
		
		public boolean hasPre()
		{
			return _offsetInData + _offsetInList > 0;
		}
		
		public boolean hasNext()
		{
			return _offsetInData + _offsetInList < _dataList.size() - 1;
		}
		
		public double getCurRate()
		{
			return (_offsetInData + _offsetInList) / (_dataList.size() - 1.0);
		}
		
		public int getOffsetInData()
		{
			return _offsetInData;
		}
		
		public int getOffsetInList()
		{
			return _offsetInList;
		}
		
		public Object getCurData()
		{
			int index = _offsetInData + _offsetInList;
			if(_dataList.size() > index)
				return _dataList.elementAt(index);
			else
				return null;
		}
		
		/**
		 * 设置状态，如果当前是STATE_FOCUS,则在其选中的子元素上显示焦点图片
		 */
		public void setState(byte state)
		{
			if(_state != state)
			{
				UIListItem curItem = (UIListItem)_itemList.elementAt(_offsetInList);
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
		public void setData(Vector data)
		{
			_dataList = data;
			updateItems();
		}
		
		/**
		 * 设置当前选中项编号
		 * 
		 * @param index
		 */
		public void setOffset(int offsetindata, int offsetinlist)
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
		public void setFocusTexture(Texture t)
		{
			if(null == _focusTexture)
			{
				_focusTexture = new Bitmap(t);
				if(_state == STATE_FOCUS)
				{
					addChild(_focusTexture);
					UIListItem curItem = (UIListItem)_itemList.elementAt(_offsetInList);
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
		public boolean tryMoveOnce(byte dir)
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
		public void moveOnce(byte dir)
		{
			if(_dataList.size() > 0)
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
		public void updateItems()
		{
			for(int i = 0; i < _length; i++)
			{
				UIListItem item = (UIListItem)_itemList.elementAt(i);
				if(null == _dataList)
				{
					item.setVisible(false);
				}
				else
				{
					if(_dataList.size() > _offsetInData + i)
					{
						Object data = _dataList.elementAt(_offsetInData + i);
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
		public void changeFocus(int to)
		{
			if(_offsetInList != to)
			{
				((UIListItem)_itemList.elementAt(_offsetInList)).setState(STATE_NORMAL);
				_offsetInList = to;
				if(STATE_FOCUS == _state)
				{
					UIListItem curItem = (UIListItem)_itemList.elementAt(_offsetInList);
					curItem.setState(STATE_FOCUS);
					if(null != _focusTexture)
						ViewUtil.setCenter(_focusTexture, curItem);
				}
			}
		}
		
		public void initWithJsonObject(JSONObject data)
		{
			try
			{
				setFocusTexture(getTexture(transformPath(data.getJSONObject("FileData").getString("Path"))));
				setName(data.getString("Name"));
				autoSetPosition(data);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		public void onDispose()
		{
			_focusTexture = null;
			_dataList = null;
			_itemList = null;
			_itemClass = null;
			int len = numChildren();
			for(int i = 0; i < len; i++)
			{
				try
				{
					((UIComponent)getChildAt(i)).onDispose();
				}
				catch(Exception e)
				{
				}
			}
			removeAllChildren();
			super.onDispose();
		}
	}
