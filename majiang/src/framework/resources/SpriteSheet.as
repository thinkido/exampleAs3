package framework.resources
{

import javax.microedition.lcdui.Image;


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

	public var _datas:Array= null;

	public function datas():Array
	{
		return _datas;
	}

	/**
	 * 通过名称获取纹理集数据
	 * 
	 * @param name
	 * @return
	 */
	public function getSSD(name:String):TextureData{
		return _ta.getFrame(name);
	}

	public function SpriteSheet(ta:TextureAtlas, frameNames:Array)
	{
		init(ta, frameNames);
	}

	public function SpriteSheet(jsonObj:Object, frameNames:Array, sheet:Image)
	{
		var ta:TextureAtlas= new TextureAtlas(sheet, jsonObj);
		init(ta, frameNames);
	}

	public function init(ta:TextureAtlas, frameNames:Array):void{
		_ta = ta;
		_datas = new TextureData[frameNames.length];
		for(var i:int= 0; i < frameNames.length; i++)
		{
			_datas[i] = _ta.getFrame(frameNames[i]);
		}
	}

	/**
	 * 获取纹理
	 * 
	 * @param name
	 * @return
	 */
	public function getTexture(name:String):Texture{
		return _ta.getTexture(name);
	}

	/**
	 * 返回由一个指定的字符串开始按字母排序的所有纹理(这对"MovieClip"来说非常有用)
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

		var frames:Object= new Object(list.size());
		var frameNames:Array= new String[list.size()];
		for(var i:int= 0; i < frameNames.length; i++)
		{
			var td:TextureData= TextureData(list.elementAt(i));
			frameNames[i] = td.name;
			frames[td.name] = td;
		}

		var ta:TextureAtlas= new TextureAtlas(_ta.img(), frames);
		var ss:SpriteSheet= new SpriteSheet(ta, frameNames);
		return ss;
	}

}
}