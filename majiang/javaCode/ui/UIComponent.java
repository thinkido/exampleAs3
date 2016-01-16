
package ui;

import java.util.Enumeration;
import java.util.Vector;

import org.json.me.JSONObject;

import framework.resources.FontSheet;
import framework.resources.Res;
import framework.resources.SpriteSheet;
import framework.resources.Texture;
import framework.views.Sprite;
import game.view.inline.LoadingView;

public abstract class UIComponent extends Sprite
{

	protected Vector _resList = new Vector();

	/**
	 * ��ͨ״̬
	 */
	public static final byte STATE_NORMAL = 0;

	/**
	 * ����״̬
	 */
	public static final byte STATE_FOCUS = 1;

	/**
	 * ����״̬
	 */
	public static final byte STATE_DISABLE = 2;

	/**
	 * checked��ͨ״̬
	 */
	public static final byte STATE_CHECKED_NORMAL = 3;

	/**
	 * checked����״̬
	 */
	public static final byte STATE_CHECKED_FOCUS = 4;

	/**
	 * checked����״̬
	 */
	public static final byte STATE_CHECKED_DISABLE = 5;

	/**
	 * ����
	 */
	public static final byte DIR_UP = 0;

	/**
	 * ����
	 */
	public static final byte DIR_DOWN = 1;

	/**
	 * ����
	 */
	public static final byte DIR_LEFT = 2;

	/**
	 * ����
	 */
	public static final byte DIR_RIGHT = 3;

	/**
	 * ������
	 */
	public static final boolean DIR_POSITIVE = true;

	/**
	 * ������
	 */
	public static final boolean DIR_NEGATIVE = false;

	/**
	 * ����
	 */
	public static final byte SCROLL_VERTICAL = 0;

	/**
	 * ����
	 */
	public static final byte SCROLL_HORIZONTAL = 1;

	/**
	 * �����·��ת��ΪRes key
	 * 
	 * @param path ���·��
	 * @return Res�ж�Ӧ��key
	 */
	protected static String transformPath(String path)
	{
		return path.replace('.', '_');
	}

	protected static UIComponent decodeType(String type)
	{
		if(type.equals("ButtonObjectData"))
			return new UIButton();
		else if(type.equals("CheckBoxObjectData"))
			return new UICheckBox();
		else if(type.equals("ImageViewObjectData") || type.equals("SpriteObjectData"))
			return new UIImageView();
		else if(type.equals("ListViewObjectData"))
			return new UIListView();
		else if(type.equals("LoadingViewObjectData"))
			return new LoadingView();
		else if(type.equals("TextBMFontObjectData"))
			return new UITextBMFont();
		else if(type.equals("TextObjectData"))
			return new UIText();
		else if(type.equals("ProjectNodeObjectData"))
			return new UILayer();
		else
			return null;
	}

	protected abstract void initWithJsonObject(JSONObject data);

	public JSONObject getJson(String name)
	{
		_resList.addElement(name);
		return Res.actively.getJson(name);
	}

	public Texture getTexture(String name)
	{
		_resList.addElement(name);
		return Res.actively.getTexture(name);
	}

	public SpriteSheet getSheet(String name)
	{
		_resList.addElement(name);
		return Res.actively.getSheet(name);
	}

	public FontSheet getFontSheet(String name)
	{
		_resList.addElement(name);
		return Res.actively.getFontSheet(name);
	}

	public void releaseRes()
	{
		if(_resList != null)
		{
			for(Enumeration enumobj = _resList.elements(); enumobj.hasMoreElements();)
			{
				String name = (String)enumobj.nextElement();
				Res.actively.release(name);
			}
			_resList.removeAllElements();
		}
	}

	public void onDispose()
	{
		_resList = null;
	}
}