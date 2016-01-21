package framework.resources
{
import java.util.Hashtable;
import java.util.Vector;

import javax.microedition.lcdui.Image;

import org.json.me.JSONObject;

/**
 * @author Jing
 */
public class SpriteSheet
{

	private var _ta:TextureAtlas= null;

	public function textureAtlas():TextureAtlas{
		return _ta;
	}

	public function sheet():Image{
		return _ta.img();
	}

	protected var _datas:Array= null;

	public TextureData[] datas()
	{
		return _datas;
	}

	/**
	 * ͨ¹ýÃû³ƻñȡÎÆÀ�Êý¾Ý
	 * 
	 * @param name
	 * @return
	 */
	public function getSSD(name:String):TextureData{
		return _ta.getFrame(name);
	}

	protected function SpriteSheet(ta:TextureAtlas, frameNames:Array)
	{
		init(ta, frameNames);
	}

	protected function SpriteSheet(jsonObj:JSONObject, frameNames:Array, sheet:Image)
	{
		var ta:TextureAtlas= new TextureAtlas(sheet, jsonObj);
		init(ta, frameNames);
	}

	protected function init(ta:TextureAtlas, frameNames:Array):void{
		_ta = ta;
		_datas = new TextureData[frameNames.length];
		for(var i:int= 0; i < frameNames.length; i++)
		{
			_datas[i] = _ta.getFrame(frameNames[i]);
		}
	}

	/**
	 * »ñȡÎÆÀí
	 * 
	 * @param name
	 * @return
	 */
	public function getTexture(name:String):Texture{
		return _ta.getTexture(name);
	}

	/**
	 * ·µ»ØÓÉһ¸öָ¶¨µÄ×ַ󴮿ªʼ°´×ÖĸÅÅÐòµÄËùÓÐÎÆÀí(Õâ¶Ô"MovieClip"À´˵·ǳ£ÓÐÓÃ)
	 * 
	 * @param prefix
	 * @return
	 */
	public function getSpriteSheet(prefix:String):SpriteSheet{
		var list:Vector= new Vector();
		for(var i:int= 0; i < _datas.length; i++)
		{
			var td:TextureData= _datas[i];
			if(td.name.startsWith(prefix))
			{
				list.addElement(td);
			}
		}

		var frames:Hashtable= new Hashtable(list.size());
		var frameNames:Array= new String[list.size()];
		for(var i:int= 0; i < frameNames.length; i++)
		{
			var td:TextureData= TextureData(list.elementAt(i));
			frameNames[i] = td.name;
			frames.put(td.name, td);
		}

		var ta:TextureAtlas= new TextureAtlas(_ta.img(), frames);
		var ss:SpriteSheet= new SpriteSheet(ta, frameNames);
		return ss;
	}

}
}