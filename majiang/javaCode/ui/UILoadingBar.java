
package ui;

import org.json.me.JSONObject;

import framework.geom.Rectangle;
import framework.views.Bitmap;

public class UILoadingBar extends UIObject
{

	private Bitmap _bar;

	private void setTexture(String name)
	{
		if(null == _bar)
		{
			_bar = new Bitmap(getTexture(name));
			addChild(_bar);
		}
		else
			_bar.setTexture(getTexture(name));
	}

	public int getHeight()
	{
		return _bar.getHeight();
	}

	public int getWidth()
	{
		return _bar.getWidth();
	}

	public void initWithJsonObject(JSONObject data)
	{
		try
		{
			if(data.has("TextureFileData"))
			{
				setTexture(transformPath(data.getJSONObject("TextureFileData").getString("Path")));
			}
			else if(data.has("ImageFileData"))
			{
				setTexture(transformPath(data.getJSONObject("ImageFileData").getString("Path")));
			}
			setName(data.getString("Name"));
			autoSetPosition(data);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void setPercent(float v)
	{
		_bar.setScrollRect(new Rectangle(0, 0, (int)(getWidth() * v), getHeight()));
	}

	public void onDispose()
	{
		_bar = null;
		super.onDispose();
	}
}
