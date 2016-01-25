package framework.resources
{
import flash.utils.ByteArray;

import framework.consts.EventType;
import framework.events.EventDispatcher;
import framework.events.IEventListener;
import framework.io.FileIO;
import framework.io.HttpData;
import framework.resources.loader.Loader;
import framework.util.JSONUtil;
import framework.util.StringUtil;

import starling.display.Image;
import javax.microedition.media.Manager;
import javax.microedition.media.MediaException;
import javax.microedition.media.Player;


/**
 * 网络资源获取器
 * 
 * @author Jing
 */
public class HttpResGetter extends AResGetter implements IEventListener
{

	/**
	 * 资源表
	 */
	private var _resTable:Object= {} ;

	/**
	 * 资源对应的数据表
	 */
	private var _dataTable:Object= {} ;

	/**
	 * HTTP服务地址
	 */
	private var _httpServer:String= null;

	/**
	 * 加载器
	 */
	private var _loader:Loader= new Loader();

	protected function HttpResGetter(path:String, httpServer:String)
	{
		init(path, httpServer);
		_loader.addEventListener(EventType.EVENT_LOAD_COMPLETE, this);
	}

	protected function HttpResGetter()
	{
		_loader.addEventListener(EventType.EVENT_LOAD_COMPLETE, this);
	}

	public function init(path:String, httpServer:String):void{
		if(httpServer.charAt(httpServer.length - 1) == '/')
		{
			httpServer = httpServer.substring(0, httpServer.length - 1);
		}
		_httpServer = httpServer;

		try
		{
			var hd:HttpData= FileIO.getHttpData(_httpServer + path);
			var jsonObj:Object = JSONUtil.bytes2Json(hd.data());
			var resList:Array = jsonObj["resources"];
			for(var i:int= 0; i < resList.length ; i++)
			{
				var resItem:Object= resList[i] ;
				var itemName:String= resItem.name ;
				var itemType:String= resItem.type ;
				var itemUrl:String= _httpServer + "/" + resItem.url ;
				var item:ResItem= new ResItem(itemName, itemType, itemUrl);

				if(itemType =="sheet")
				{
					var subkeys:String= resItem.subkeys );
					item.subkeys = subkeys;
				}

				_resTable[item.name()] = item;
			}
		}
		catch(var e:*)
		{
	
		}

		trace("Total web resource:" + _resTable.size());
	}

	/**
	 * 异步加载图片
	 * 
	 * @param name
	 */
	public function getImageAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_IMAGE);
		_loader.load(item);
	}

	/**
	 * 异步加载纹理
	 * 
	 * @param name
	 */
	public function getTextureAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_TEXTURE);
		_loader.load(item);
	}

	/**
	 * 异步获取JSON
	 * 
	 * @param name
	 */
	public function getJsonAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_JSON);
		_loader.load(item);
	}

	/**
	 * 异步获取纹理集
	 * 
	 * @param name
	 */
	public function getSheetAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_SHEET);
		_loader.load(item);
	}

	/**
	 * 异步获取二进制文件
	 * 
	 * @param name
	 */
	public function getBinaryAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_BINARY);
		_loader.load(item);
	}

	/**
	 * 异步获取字体
	 * 
	 * @param name
	 */
	public function getFontSheetAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_FONT);
		_loader.load(item);
	}

	public function onReciveEvent(type:uint, dispatcher:EventDispatcher, data:Object):void{
		this.dispatchEvent(type, data);
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
			var hd:HttpData= FileIO.getHttpData(item.url());
			obj = JSONUtil.bytes2Json(hd.data());
			_dataTable[name] = obj ;
		}
		else
		{
			obj = _dataTable[name] ;
		}
		return obj;
	}

	/**
	 * 获取二进制文件
	 */
	public function getBinary(name:String):ByteArray
	{
		var bytes:Array= null;
		var item:ResItem= getResItem(name, Res.TYPE_BINARY);
		if(_dataTable[name] == undefined)
		{
			var url:String= item.url();
			var hd:HttpData= FileIO.getHttpData(url);
			bytes = hd.data();
		}
		else
		{
			bytes = _dataTable[name];
		}

		return bytes;
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
			var hd:HttpData= FileIO.getHttpData(url);
			var b:Array= hd.data();
			var len:int= b.length;
			image = Image.createImage(b, 0, len);
			_dataTable[name] = image ;
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
			var hd:HttpData= FileIO.getHttpData(url);
			var b:Array= hd.data();
			var len:int= b.length;
			var image:Image= Image.createImage(b, 0, len);
			t = new Texture(image);
			_dataTable[name] = t ;
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
			var hd:HttpData= FileIO.getHttpData(url);
			var jsonObj:Object= JSONUtil.bytes2Json(hd.data());
			var imagePath:String= url.substring(0, url.length - 5) + ".png";
			var imgHD:HttpData= FileIO.getHttpData(imagePath);
			var sheet:Image= Image.createImage(imgHD.data(), 0, imgHD.data().length);

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
			var url:String= item.url();
			var hd:HttpData= FileIO.getHttpData(url);
			var jsonObj:Object= JSONUtil.bytes2Json(hd.data());
			var imagePath:String= url.substring(0, url.length - 4) + ".png";
			var imgHD:HttpData= FileIO.getHttpData(imagePath);
			var sheet:Image= Image.createImage(imgHD.data(), 0, imgHD.data().length);

			fs = new FontSheet(jsonObj, sheet);
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
	 */
	public function getAudio(name:String):Player{
		var p:Player= null;
		var item:ResItem= getResItem(name, Res.TYPE_SOUND);
		if(false == _dataTable.contains(name))
		{
			try
			{
				trace("构建声音资源：" + item.url());
				p = Manager.createPlayer(item.url());
				_dataTable[name] = p ;
			}
			catch(e:*)
			{
				trace("资源加载出错：" + item.url());
				trace( e.getStackTrace() );   //e.printStackTrace();
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
			url = _httpServer + url;
		}
		return url;
	}

	/**
	 * 释放资源
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
			if(!item.type() ==type)
			{
				item = new ResItem(name, type, item.url());
				_resTable[name] = item ;
			}
		}
		else
		{
			var url:String= name;
			if(url.charAt(0) != '/')
			{
				url = '/' + url;
			}
			url = _httpServer + url;
			item = new ResItem(name, type, url);
			_resTable[name] = item ;
		}
		return item;
	}

}
}