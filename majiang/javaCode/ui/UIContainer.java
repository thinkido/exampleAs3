
package ui;

import org.json.me.JSONArray;
import org.json.me.JSONObject;

public abstract class UIContainer extends UIComponent
{

	/**
	 * 加载完成后处理
	 */
	public void initWithJsonObject(JSONObject data)
	{
		try
		{
			data = data.getJSONObject("Content").getJSONObject("Content").getJSONObject("ObjectData");
			JSONArray children = data.getJSONArray("Children");
			for(int i = 0; i < children.length(); ++i)
			{
				JSONObject child = children.getJSONObject(i);
				UIComponent item = decodeType(child.getString("ctype"));
				if(item != null)
				{
					item.initWithJsonObject(child);
					addChild(item);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void releaseRes()
	{
		super.releaseRes();
		int len = numChildren();
		for(int i = 0; i < len; i++)
		{
			try
			{
				((UIComponent)getChildAt(i)).releaseRes();
			}
			catch(Exception e)
			{
			}
		}
	}

	public void onDispose()
	{
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
