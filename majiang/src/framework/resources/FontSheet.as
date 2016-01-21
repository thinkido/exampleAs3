package framework.resources
{
import java.io.IOException;

import javax.microedition.lcdui.Image;

import org.json.me.JSONObject;

import framework.io.FileIO;


/**
 * ×ÖÌå
 * @author 
 *
 */
public class FontSheet
{
	private var _ta:TextureAtlas= null;
	
	/**
	 * ÎÆÀ�
	 * @return
	 */
	public function sheet():Image{
		return _ta.img();
	}
	
	/**
	 * »ñȡ×ַûÊý¾Ý
	 * @param ch ×ַû
	 * @return
	 */
	public function getCharData(ch:String):TextureData{
		var str:String= String.valueOf(ch);
		return _ta.getFrame(str);		
	}
	
	protected function FontSheet(url:String)
	{
		try
		{
			var jsonObj:JSONObject= FileIO.getJson(url);
			var imagePath:String= url.substring(0, url.length() - 4) + ".png";
			var sheet:Image= Image.createImage(imagePath);
			init(jsonObj, sheet);
		}
		catch(var e:IOException)
		{
			e.printStackTrace();
		}
	}
	
	protected function FontSheet(jsonObj:JSONObject, sheet:Image)
	{
		init(jsonObj, sheet);
	}
	
	protected function init(jsonObj:JSONObject, sheet:Image):void{	
		_ta = new TextureAtlas(sheet, jsonObj);
	}
}
}