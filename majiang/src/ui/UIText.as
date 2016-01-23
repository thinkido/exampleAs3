
package ui;

import framework.views.TextField;

import org.json.me.JSONException;
import org.json.me.JSONObject;

public class UIText extends UIObject
{

	private TextField _tf;

	public UIText()
	{
		_tf = new TextField();
		addChild(_tf);
	}

	public int getMaxLength()
	{
		return _tf.maxLength();
	}

	public void setMaxLength(int length)
	{
		_tf.setMaxLength(length);
	}

	public String getText()
	{
		return _tf.getText();
	}

	public void setText(String text)
	{
		if(null != text)
			_tf.setText(text);
	}

	public void setColor(int color)
	{
		_tf.setColor(color);
	}

	public boolean isBold()
	{
		return _tf.isBold();
	}

	public void setBold(boolean v)
	{
		_tf.setBold(v);
	}

	public boolean isItalic()
	{
		return _tf.isItalic();
	}

	public void setItalic(boolean v)
	{
		_tf.setItalic(v);
	}

	public boolean isUnderlined()
	{
		return _tf.isUnderlined();
	}

	public void setUnderlined(boolean v)
	{
		_tf.setUnderlined(v);
	}

	public int getSize()
	{
		return _tf.size();
	}

	public void setSize(int size)
	{
		_tf.setSize(size);
	}

	public void setAnchor(int anchor)
	{
		_tf.setAnchor(anchor);
	}

	public void setTrans(int value)
	{
		super.setTrans(value);

		_tf.setTrans(value);
	}

	public void setLineGap(int value)
	{
		_tf.setLinegap(value);
	}

	public void initWithJsonObject(data:Object)
	{
		try
		{
			var color:Object = data["CColor"];
			var r:int = color["R"]!=undefined ? color["R"] : 255;
			var g:int = color["G"]!=undefined ? color["G"] : 255;
			var b:int = color["B"]!=undefined ? color["B"] : 255;
			var colorCode:int = r << 16 | g << 8 | b;
			setColor(colorCode);
			setText(data["LabelText"]);
			setName(data["Name"]);
			autoSetPosition(data);
		}
		catch(e:*)
		{
			trace( e.getStackTrace() );   //e.printStackTrace();
		}
	}

	public void onDispose()
	{
		_tf = null;
		super.onDispose();
	}
}