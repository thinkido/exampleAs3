package framework.resources
{
import framework.events.EventDispatcher;
import framework.events.IEventListener;
import framework.io.FileIO;
import framework.util.StringUtil;

import java.io.InputStream;

import javax.microedition.lcdui.Image;
import javax.microedition.media.Manager;
import javax.microedition.media.MediaException;
import javax.microedition.media.Player;

/**
 * 本地资源获取器
 * 
 * @author Jing
 */
public class LocalResGetter extends AResGetter implements IEventListener
{

	/**
	 * 资源表
	 */
	private var _resTable:Object= new Object();

	/**
	 * 资源对应的数据表
	 */
	private var _dataTable:Object= new Object();

	protected function LocalResGetter(path:String)
	{
		init(path);
	}

	protected function LocalResGetter()
	{

	}

	public function init(path:String):void{
		try
		{
			var jsonObj:Object= FileIO.getJson(path);
			var resList:Array= jsonObj["resources"];
			for(var i:int= 0; i < resList.length; i++)
			{
				var resItem:Object= resList[i];
				var itemName:String= resItem["name"];
				var itemType:String= resItem["type"];
				var itemUrl:String= "/" + resItem["url"];
				var item:ResItem= new ResItem(itemName, itemType, itemUrl);

				if(itemType == "sheet")
				{
					var subkeys:String= resItem["subkeys"];
					item.subkeys = subkeys;
				}

				_resTable.put(item.name(), item);
			}
		}
		catch(e:*)
		{

		}

		trace("Total local resource:" + _resTable.size());
	}

	/**
	 * 获取文件二进制
	 * 
	 * @return
	 */
	public function getBinary(name:String):ByteArray
	{
		var bytes:Array= null;
		var item:ResItem= getResItem(name, Res.TYPE_BINARY);
		if(_dataTable[name] == undefined)
		{
			var url:String= item.url();
			bytes = FileIO.getFile(url);
			_dataTable[name] = bytes ;
		}
		else
		{
			bytes = _dataTable[name];
		}
		return bytes;
	}

	/**
	 * 获取JSON对象
	 * 
	 * @param name
	 * @return
	 */
	public function getJson(name:String):Object{
		var obj:Object= null;
		var item:ResItem= getResItem(name, Res.TYPE_JSON);
		if(_dataTable[name] == undefined)
		{
			var url:String= item.url();
			obj = FileIO.getJson(url);
			_dataTable[name] = obj ;
		}
		else
		{
			obj = _dataTable[name];
		}
		return obj;
	}

	/**
	 * 获取图片资源(以后不再提供，建议使用getTexture)
	 * 
	 * @param name 图片资源的名称
	 * @return
	 */
	public function getImage(name:String):Image{
		var image:Image= null;
		var item:ResItem= getResItem(name, Res.TYPE_IMAGE);
		if(_dataTable[name] == undefined)
		{
			var url:String= item.url();
			try
			{
				image = Image.createImage(url);
				_dataTable[name] = image ;
			}
			catch(e:*)
			{
				trace("资源加载出错：" + url);
			}
		}
		else
		{
			image = Image(_dataTable[name]);
		}

		return image;
	}

	/**
	 * 获取图片纹理
	 * 
	 * @param name
	 * @return
	 */
	public function getTexture(name:String):Texture{
		var t:Texture= null;
		var item:ResItem= getResItem(name, Res.TYPE_TEXTURE);
		if(_dataTable[name] == undefined)
		{
			var url:String= item.url();
			try
			{
				var image:Image= Image.createImage(url);
				t = new Texture(image);
				_dataTable[name] = t ;
			}
			catch(e:*)
			{
				trace("资源加载出错：" + url);
			}
		}
		else
		{
			t = Texture(_dataTable[name]);
		}

		return t;
	}

	/**
	 * 获取纹理集
	 * 
	 * @param name
	 * @return
	 */
	public function getSheet(name:String):SpriteSheet{
		var ss:SpriteSheet= null;
		var item:ResItem= getResItem(name, Res.TYPE_SHEET);
		if(_dataTable[name] == undefined)
		{
			var url:String= item.url();
			var jsonObj:Object= FileIO.getJson(url);
			var imagePath:String= url.substring(0, url.length - 5) + ".png";
			var sheet:Image= null;
			try
			{
				sheet = Image.createImage(imagePath);  
			}
			catch(e:*)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
			ss = new SpriteSheet(jsonObj, item.subkeys.split(','), sheet);
			_dataTable[name] = ss ;
		}
		else
		{
			ss = SpriteSheet(_dataTable[name]);
		}

		return ss;
	}

	/**
	 * 获取字符集
	 * 
	 * @param name
	 * @return
	 */
	public function getFontSheet(name:String):FontSheet{
		var fs:FontSheet= null;
		var item:ResItem= getResItem(name, Res.TYPE_FONT);
		if(_dataTable[name] == undefined)
		{
			fs = new FontSheet(item.url());
			_dataTable[name] = fs ;
		}
		else
		{
			fs = FontSheet(_dataTable[name]);
		}

		return fs;
	}

	/**
	 * 获取音频文件
	 * 
	 * @param name 音频文件资源名
	 * @param type 音频文件类型
	 *            <ul>
	 *            <li>Wave audio files: audio/x-wav</li>
	 *            <li>AU audio files: audio/basic</li>
	 *            <li>MP3 audio files: audio/mpeg</li>
	 *            <li>MIDI files: audio/midi</li>
	 *            <li>Tone sequences: audio/x-tone-seq</li>
	 *            </ul>
	 */
	public function getAudio(name:String, type:String):Player{
		var p:Player= null;
		var item:ResItem= getResItem(name, Res.TYPE_SOUND);
		if(false == _dataTable.contains(name))
		{
			var is:InputStream= FileIO.getInputStream(item.url());

			if(null == is)
			{
				trace("资源不存在：" + item.url());
			}
			else
			{
				try
				{
					p = Manager.createPlayer(is, type);
					_dataTable[name] = p ;
				}
				catch(e:*)
				{
					trace("资源加载出错：" + item.url());
				}
				catch(var e:MediaException)
				{
					trace("媒体出错：" + item.url());
				}
			}

		}
		else
		{
			p = Player(_dataTable[name]);
		}
		return p;
	}

	/**
	 * 获取资源的URL地址
	 * 
	 * @param name
	 * @return
	 */
	public function getUrl(name:String):String{
		var url:String;
		if(_resTable[name] != undefined)
		{
			var item:ResItem= ResItem(_resTable[name]);
			url = item.url();
		}
		else
		{
			url = name;
			if(url.charAt(0) != '/')
			{
				url = '/' + url;
			}
		}
		return url;
	}

	/**
	 * 释放资源
	 * 
	 * @param name 图片资源的名称
	 */
	public function release(name:String):void{
		if(_dataTable[name] != undefined)
		{
			_dataTable.remove(name);
		}
	}

	private function getResItem(name:String, type:String):ResItem{
		var item:ResItem= null;
		if(_resTable[name] != undefined)
		{
			item = ResItem(_resTable[name]);
		}
		else
		{
			var url:String= name;
			if(url.charAt(0) != '/')
			{
				url = '/' + url;
			}
			item = new ResItem(name, type, url);
			_resTable[name] = item ;
		}
		return item;
	}

	public function onReciveEvent(type:uint, dispatcher:EventDispatcher, data:Object):void{
		this.dispatchEvent(type, data);
	}

}
}