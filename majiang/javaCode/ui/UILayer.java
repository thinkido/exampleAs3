
package ui;

import game.model.Global;

import org.json.me.JSONObject;

public class UILayer extends UIContainer
{

	/**
	 * 加载完成后处理
	 */
	public void initWithJsonObject(JSONObject data)
	{
		try
		{
			JSONObject position = data.getJSONObject("Position");
			JSONObject size = data.getJSONObject("Size");

			JSONObject scale = data.getJSONObject("Scale");
			int x = (int)Double.parseDouble(position.getString("X"));
			int y = (int)Double.parseDouble(position.getString("Y"));
			int w = (int)Double.parseDouble(size.getString("X"));
			int h = (int)Double.parseDouble(size.getString("Y"));
			double scaleX = Double.parseDouble(scale.getString("ScaleX"));
			double scaleY = Double.parseDouble(scale.getString("ScaleY"));
			int anchorX = 0;
			int anchorY = (int)(h * scaleY);
			if(data.has("AnchorPoint"))
			{
				JSONObject anchor = data.getJSONObject("AnchorPoint");
				if(anchor.has("ScaleX"))
				{
					anchorX = (int)(Double.parseDouble(anchor.getString("ScaleX")) * w * scaleX);
				}
				if(anchor.has("ScaleY"))
				{
					anchorY = (int)((1 - Double.parseDouble(anchor.getString("ScaleY"))) * h * scaleY);
				}
			}
			x = x - anchorX;
			y = Global.SCREEN_HEIGHT - y - anchorY;
			setPosition(x, y);
			setVisible(!data.has("VisibleForFrame") || data.getBoolean("VisibleForFrame"));
			setName(data.getString("Name"));
			JSONObject conf = getJson(transformPath(data.getJSONObject("FileData").getString("Path")));
			super.initWithJsonObject(conf);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
