
package ui;

import org.json.me.JSONException;
import org.json.me.JSONObject;

import framework.views.BitmapFont;

public class UITextBMFont extends UIObject
{

	private BitmapFont _bf = null;

	public UITextBMFont()
	{

	}

	public String getText()
	{
		return _bf.text();
	}

	public void setText(String text)
	{
		if(null != _bf)
		{
			_bf.setText(text);
		}
	}

	public void setAnchor(int anchor)
	{
		_bf.setAnchor(anchor);
	}

	public void initWithJsonObject(JSONObject data)
	{
		try
		{
			String text = data.getString("LabelText");
			String resource = transformPath(data.getString("UserData"));
			setName(data.getString("Name"));
			_bf = new BitmapFont(getFontSheet(resource));
			addChild(_bf);
			setText(text);
			autoSetPosition(data);
		}
		catch(JSONException e)
		{
			e.printStackTrace();
		}
	}

	public void onDispose()
	{
		_bf = null;
		super.onDispose();
	}
}
