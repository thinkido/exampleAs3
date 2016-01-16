
package ui;

import game.model.Global;

import org.json.me.JSONObject;

public abstract class UIObject extends UIComponent
{

	/**
	 * ¡⁄æ”¡–±Ì
	 */
	protected UIObject[] _neighborArr = new UIObject[4];

	/**
	 * ◊¥Ã¨
	 */
	protected byte _state = STATE_NORMAL;

	/**
	 * …Ë÷√¡⁄æ”
	 * 
	 * @param up
	 * @param down
	 * @param left
	 * @param right
	 */
	public void setNeighbors(UIObject up, UIObject down, UIObject left, UIObject right)
	{
		_neighborArr[DIR_UP] = up;
		_neighborArr[DIR_DOWN] = down;
		_neighborArr[DIR_LEFT] = left;
		_neighborArr[DIR_RIGHT] = right;
	}

	/**
	 * ªÒ»°¡⁄æ”
	 * 
	 * @param dir
	 * @return
	 */
	public UIObject getNeighbor(byte dir)
	{
		return _neighborArr[dir];
	}

	/**
	 * ªÒ»°◊¥Ã¨
	 * 
	 * @return
	 */
	public byte getState()
	{
		return _state;
	}

	/**
	 * …Ë÷√◊¥Ã¨
	 * 
	 * @param state
	 */
	public void setState(byte state)
	{
		_state = state;
	}

	public void autoSetPosition(JSONObject data)
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
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void onDispose()
	{
		_neighborArr = null;
		super.onDispose();
	}
}
