
package ui;

import org.json.me.JSONObject;

import framework.resources.Texture;
import framework.util.ViewUtil;
import framework.views.Bitmap;

public class UICheckBox extends UIObject
{

	/**
	 * 各状态对应图片
	 */
	protected Bitmap[] _srcBitmapArr = new Bitmap[5];

	/**
	 * 焦点显示模式
	 */
	protected boolean _isAddFocusSign = false;

	protected boolean _clickable = true;

	public UICheckBox()
	{

	}

	public boolean isChecked()
	{
		return _state >= STATE_CHECKED_NORMAL;
	}

	public void setClickable(boolean clickable)
	{
		_clickable = clickable;
	}

	public void swapCheckedState()
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

	protected void updateView()
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
	public void setFocusMode(boolean isAddFocusSign)
	{
		_isAddFocusSign = isAddFocusSign;
	}

	/**
	 * 设置某个状态图片
	 * 
	 * @param state
	 * @param t
	 */
	public void setStateView(byte state, Texture t)
	{
		if(STATE_CHECKED_FOCUS == state || STATE_CHECKED_NORMAL == state)
			_srcBitmapArr[3].setTexture(t);
		else if(STATE_CHECKED_DISABLE == state)
			_srcBitmapArr[4].setTexture(t);
		else
			_srcBitmapArr[state].setTexture(t);
	}

	public void initWithJsonObject(JSONObject data)
	{
		try
		{
			_srcBitmapArr[0] = new Bitmap(getTexture(transformPath(data.getJSONObject("NormalBackFileData").getString("Path"))));
			_srcBitmapArr[1] = new Bitmap(getTexture(transformPath(data.getJSONObject("PressedBackFileData").getString("Path"))));
			_srcBitmapArr[2] = new Bitmap(getTexture(transformPath(data.getJSONObject("DisableBackFileData").getString("Path"))));
			_srcBitmapArr[3] = new Bitmap(getTexture(transformPath(data.getJSONObject("NodeNormalFileData").getString("Path"))));
			_srcBitmapArr[4] = new Bitmap(getTexture(transformPath(data.getJSONObject("NodeDisableFileData").getString("Path"))));
			_isAddFocusSign = data.has("TouchEnable") && data.getBoolean("TouchEnable");
			if(_isAddFocusSign)
				ViewUtil.setCenter(_srcBitmapArr[STATE_FOCUS], _srcBitmapArr[STATE_NORMAL]);
			ViewUtil.setCenter(_srcBitmapArr[3], _srcBitmapArr[STATE_NORMAL]);
			ViewUtil.setCenter(_srcBitmapArr[4], _srcBitmapArr[STATE_NORMAL]);
			addChild(_srcBitmapArr[_state]);
			setName(data.getString("Name"));
			autoSetPosition(data);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void setState(byte state)
	{
		if(_state != state)
		{
			super.setState(state);
			updateView();
		}
	}

	public void onDispose()
	{
		_srcBitmapArr = null;
		super.onDispose();
	}
}