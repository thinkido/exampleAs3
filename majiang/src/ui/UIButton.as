
package ui;

import org.json.me.JSONObject;

import framework.resources.Texture;
import framework.util.ViewUtil;
import framework.views.Bitmap;

public class UIButton extends UIObject
{

	/**
	 * ��״̬��ӦͼƬ
	 */
	protected Bitmap[] _srcBitmapArr = new Bitmap[3];

	/**
	 * ������ʾģʽ
	 */
	protected boolean _isAddFocusSign = false;

	public UIButton()
	{

	}

	public UIButton(String normal, String focus, String disable)
	{
		_srcBitmapArr[0] = new Bitmap(getTexture(normal));
		_srcBitmapArr[1] = new Bitmap(getTexture(focus));
		_srcBitmapArr[2] = new Bitmap(getTexture(disable));
		
		setWidth(_srcBitmapArr[0].getWidth());
		setWidth(_srcBitmapArr[0].getHeight());
		
		addChild(_srcBitmapArr[0]);
	}

	/**
	 * ���ý�����ʾģʽ
	 * 
	 * @param isAddFocusSign
	 *            trueΪ��STATE_FOCUSͼƬ�ŵ�STATE_NORMALͼƬ�ϣ�falseΪ��ʾSTATE_FOCUSͼƬ
	 */
	public void setFocusMode(boolean isAddFocusSign)
	{
		_isAddFocusSign = isAddFocusSign;
	}

	/**
	 * ����ĳ��״̬ͼƬ
	 * 
	 * @param state
	 * @param img
	 */
	public void setStateView(byte state, Texture t)
	{
		_srcBitmapArr[state].setTexture(t);
	}

	public void initWithJsonObject(JSONObject data)
	{
		try
		{
			_srcBitmapArr[0] = new Bitmap(getTexture(transformPath(data["NormalFileData"]["Path"])));
			_srcBitmapArr[1] = new Bitmap(getTexture(transformPath(data["PressedFileData"]["Path"])));
			_srcBitmapArr[2] = new Bitmap(getTexture(transformPath(data["DisabledFileData"]["Path"])));
			_isAddFocusSign = data.has("TouchEnable") && data.getBoolean("TouchEnable");
			if(_isAddFocusSign)
			{
				ViewUtil.setCenter(_srcBitmapArr[STATE_FOCUS], _srcBitmapArr[STATE_NORMAL]);
				ViewUtil.setCenter(_srcBitmapArr[STATE_DISABLE], _srcBitmapArr[STATE_NORMAL]);
			}
			addChild(_srcBitmapArr[_state]);
			setName(data["Name"]);
			autoSetPosition(data);
		}
		catch(Exception e)
		{
			trace( e.getStackTrace() );   //e.printStackTrace();
		}
	}

	public void setState(byte state)
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

	public void onDispose()
	{
		_srcBitmapArr = null;
		super.onDispose();
	}
}
