package framework.resources
{
import java.util.Enumeration;
import java.util.Object;

import javax.microedition.lcdui.Image;

import org.json.me.JSONException;
import org.json.me.JSONObject;

/**
 * 纹理集
 * 
 * @author Jing
 */
public class TextureAtlas
{

	protected var _img:Image= null;

	public function img():Image{
		return _img;
	}

	protected var _frames:Object= null;

	public function getFrame(name:String):TextureData{
		return (TextureData)_frames.get(name);
	}

	public function TextureAtlas(img:Image, jsonObj:Object)
	{
		init(img, jsonObj);
	}

	public function TextureAtlas(img:Image, frames:Object)
	{
		_img = img;
		_frames = frames;
	}

	public function init(img:Image, jsonObj:Object):void{
		_img = img;
		_frames = getDatas(jsonObj);
	}

	/**
	 * 从纹理集中获取纹理帧
	 * 
	 * @param name
	 * @return
	 */
	public function getTexture(name:String):Texture{
		var td:TextureData= TextureData(_frames.get(name));
		if(null == td)
		{
			return null;
		}

		return new Texture(_img, td);
	}

	/**
	 * @param prefix
	 * @return
	 */
	public function getTextureAtlas(prefix:String):TextureAtlas{
		var frames:Object= new Object();
		for(var enumobj:Enumeration= _frames.elements(); enumobj.hasMoreElements();)
		{
			var td:TextureData= TextureData(enumobj.nextElement());
			if(null != td && td.name.startsWith(prefix))
			{
				frames.put(td.name, td);
			}
		}
		return new TextureAtlas(_img, frames);
	}

	static public function getDatas(jsonObj:Object):Object{
		var frames:Object= null;
		try
		{

			var jsonFrames:Array= jsonObj["frames"];
			var charAmount:int= jsonFrames.length;
			frames = new Object(charAmount);

			for(var enumobj:Enumeration= jsonFrames.keys(); enumobj.hasMoreElements();)
			{
				var key:String= String(enumobj.nextElement());
				var jsonChar:Object= jsonFrames[key];
				var data:TextureData= new TextureData();
				data.name = key;
				data.x = jsonChar.getInt("x");
				data.y = jsonChar.getInt("y");
				data.w = jsonChar.getInt("w");
				data.h = jsonChar.getInt("h");
				data.offX = jsonChar.getInt("offX");
				data.offY = jsonChar.getInt("offY");
				if(jsonChar.has("sourceW"))
				{
					data.sourceW = jsonChar.getInt("sourceW");
				}
				else
				{
					data.sourceW = data.w + data.offX;
				}

				if(jsonChar.has("sourceH"))
				{
					data.sourceH = jsonChar.getInt("sourceH");
				}
				else
				{
					data.sourceH = data.h + data.offY;
				}

				frames.put(key, data);
			}
		}
		catch(var e:JSONException)
		{
			trace( e.getStackTrace() );   //e.printStackTrace();
		}
		return frames;
	}
}
}