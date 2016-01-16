
package ui;

import org.json.me.JSONObject;

import framework.geom.Rectangle;
import framework.resources.Texture;
import framework.views.Bitmap;

public class UIImageView extends UIObject
{

	private Bitmap _srcTexture;

	public UIImageView()
	{

	}

	public Rectangle getScrollRect()
	{
		return _srcTexture.getScrollRect();
	}

	public void setScrollRect(Rectangle rect)
	{
		_srcTexture.setScrollRect(rect);
	}

	public int getHeight()
	{
		return _srcTexture.getHeight();
	}

	public int getWidth()
	{
		return _srcTexture.getWidth();
	}

	public void setTexture(Texture t)
	{
		if(null == _srcTexture)
		{
			_srcTexture = new Bitmap(t);
			addChild(_srcTexture);
		}
		else
			_srcTexture.setTexture(t);
	}

	public void setTexture(String name)
	{
		if(null == _srcTexture)
		{
			_srcTexture = new Bitmap(getTexture(name));
			addChild(_srcTexture);
		}
		else
			_srcTexture.setTexture(getTexture(name));
	}

	public void clearTexture()
	{
		if(null != _srcTexture)
			_srcTexture.clearTexture();
	}

	public void initWithJsonObject(JSONObject data)
	{
		try
		{
			if(!data.getJSONObject("FileData").getString("Type").equals("Default"))
			{
				String path = data.getJSONObject("FileData").getString("Path");
				_srcTexture = new Bitmap(getTexture(transformPath(path)));
				addChild(_srcTexture);
			}
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
		_srcTexture = null;
		super.onDispose();
	}
}
