package framework.resources
{
import java.io.IOException;
import java.util.Hashtable;

import javax.microedition.lcdui.Image;
import javax.microedition.media.Manager;
import javax.microedition.media.MediaException;
import javax.microedition.media.Player;

import org.json.me.JSONArray;
import org.json.me.JSONException;
import org.json.me.JSONObject;

import framework.consts.EventType;
import framework.events.EventDispatcher;
import framework.events.IEventListener;
import framework.io.FileIO;
import framework.io.HttpData;
import framework.resources.loader.Loader;
import framework.util.JSONUtil;
import framework.util.StringUtil;

/**
 * ÍøÂç×ÊԴ»ñȡÆ÷
 * 
 * @author Jing
 */
public class HttpResGetter extends AResGetter implements IEventListener
{

	/**
	 * ×ÊԴ±í
	 */
	private var _resTable:Hashtable= new Hashtable();

	/**
	 * ×ÊԴ¶ÔӦµÄÊý¾ݱí
	 */
	private var _dataTable:Hashtable= new Hashtable();

	/**
	 * HTTP·þÎñµØַ
	 */
	private var _httpServer:String= null;

	/**
	 * ¼ÓÔØÆ÷
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
		if(httpServer.charAt(httpServer.length() - 1) == '/')
		{
			httpServer = httpServer.substring(0, httpServer.length() - 1);
		}
		_httpServer = httpServer;

		try
		{
			var hd:HttpData= FileIO.getHttpData(_httpServer + path);
			var jsonObj:JSONObject= JSONUtil.bytes2Json(hd.data());
			var resList:JSONArray= jsonObj.getJSONArray("resources");
			for(var i:int= 0; i < resList.length(); i++)
			{
				var resItem:JSONObject= resList.getJSONObject(i);
				var itemName:String= resItem.getString("name");
				var itemType:String= resItem.getString("type");
				var itemUrl:String= _httpServer + "/" + resItem.getString("url");
				var item:ResItem= new ResItem(itemName, itemType, itemUrl);

				if(itemType.equals("sheet"))
				{
					var subkeys:String= resItem.getString("subkeys");
					item.subkeys = subkeys;
				}

				_resTable.put(item.name(), item);
			}
		}
		catch(var e:JSONException)
		{

		}

		System.out.println("Total web resource:" + _resTable.size());
	}

	/**
	 * Ò첽¼ÓÔØͼƬ
	 * 
	 * @param name
	 */
	public function getImageAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_IMAGE);
		_loader.load(item);
	}

	/**
	 * Ò첽¼ÓÔØÎÆÀí
	 * 
	 * @param name
	 */
	public function getTextureAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_TEXTURE);
		_loader.load(item);
	}

	/**
	 * Ò첽»ñȡJSON
	 * 
	 * @param name
	 */
	public function getJsonAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_JSON);
		_loader.load(item);
	}

	/**
	 * Ò첽»ñȡÎÆÀ�
	 * 
	 * @param name
	 */
	public function getSheetAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_SHEET);
		_loader.load(item);
	}

	/**
	 * Ò첽»ñȡ¶þ½øÖÆÎļþ
	 * 
	 * @param name
	 */
	public function getBinaryAsyn(name:String):void{
		var item:ResItem= getResItem(name, Res.TYPE_BINARY);
		_loader.load(item);
	}

	/**
	 * Ò첽»ñȡ×ÖÌå
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
	 * »ñȡJSON¶ÔÏó
	 * 
	 * @param name
	 * @return
	 */
	public function getJson(name:String):JSONObject{
		var obj:JSONObject= null;
		var item:ResItem= getResItem(name, Res.TYPE_JSON);
		if(false == _dataTable.containsKey(name))
		{
			var hd:HttpData= FileIO.getHttpData(item.url());
			obj = JSONUtil.bytes2Json(hd.data());
			_dataTable.put(name, obj);
		}
		else
		{
			obj = JSONObject(_dataTable.get(name));
		}
		return obj;
	}

	/**
	 * »ñȡ¶þ½øÖÆÎļþ
	 */
	public byte[] getBinary(var name:String)
	{
		var bytes:Array= null;
		var item:ResItem= getResItem(name, Res.TYPE_BINARY);
		if(false == _dataTable.containsKey(name))
		{
			var url:String= item.url();
			var hd:HttpData= FileIO.getHttpData(url);
			bytes = hd.data();
		}
		else
		{
			bytes = (byte[])_dataTable.get(name);
		}

		return bytes;
	}

	/**
	 * »ñȡͼƬ×ÊԴ(ÒԺó²»ÔÙÌṩ£¬½¨ÒéʹÓÃgetTexture)
	 * 
	 * @param name ͼƬ×ÊԴµÄÃû³Æ
	 * @return
	 */
	public function getImage(name:String):Image{
		var image:Image= null;
		var item:ResItem= getResItem(name, Res.TYPE_IMAGE);
		if(false == _dataTable.containsKey(name))
		{
			var url:String= item.url();
			var hd:HttpData= FileIO.getHttpData(url);
			var b:Array= hd.data();
			var len:int= b.length;
			image = Image.createImage(b, 0, len);
			_dataTable.put(name, image);
		}
		else
		{
			image = Image(_dataTable.get(name));
		}

		return image;
	}

	/**
	 * »ñȡͼƬÎÆÀí
	 * 
	 * @param name
	 * @return
	 */
	public function getTexture(name:String):Texture{
		var t:Texture= null;
		var item:ResItem= getResItem(name, Res.TYPE_TEXTURE);
		if(false == _dataTable.containsKey(name))
		{
			var url:String= item.url();
			var hd:HttpData= FileIO.getHttpData(url);
			var b:Array= hd.data();
			var len:int= b.length;
			var image:Image= Image.createImage(b, 0, len);
			t = new Texture(image);
			_dataTable.put(name, t);
		}
		else
		{
			t = Texture(_dataTable.get(name));
		}

		return t;
	}

	/**
	 * »ñȡÎÆÀ�
	 * 
	 * @param name
	 * @return
	 */
	public function getSheet(name:String):SpriteSheet{
		var ss:SpriteSheet= null;
		var item:ResItem= getResItem(name, Res.TYPE_SHEET);
		if(false == _dataTable.containsKey(name))
		{
			var url:String= item.url();
			var hd:HttpData= FileIO.getHttpData(url);
			var jsonObj:JSONObject= JSONUtil.bytes2Json(hd.data());
			var imagePath:String= url.substring(0, url.length() - 5) + ".png";
			var imgHD:HttpData= FileIO.getHttpData(imagePath);
			var sheet:Image= Image.createImage(imgHD.data(), 0, imgHD.data().length);

			ss = new SpriteSheet(jsonObj, StringUtil.split(item.subkeys, ','), sheet);
			_dataTable.put(name, ss);
		}
		else
		{
			ss = SpriteSheet(_dataTable.get(name));
		}

		return ss;
	}

	/**
	 * »ñȡ×ַû¼¯
	 * 
	 * @param name
	 * @return
	 */
	public function getFontSheet(name:String):FontSheet{
		var fs:FontSheet= null;
		var item:ResItem= getResItem(name, Res.TYPE_FONT);
		if(false == _dataTable.containsKey(name))
		{
			var url:String= item.url();
			var hd:HttpData= FileIO.getHttpData(url);
			var jsonObj:JSONObject= JSONUtil.bytes2Json(hd.data());
			var imagePath:String= url.substring(0, url.length() - 4) + ".png";
			var imgHD:HttpData= FileIO.getHttpData(imagePath);
			var sheet:Image= Image.createImage(imgHD.data(), 0, imgHD.data().length);

			fs = new FontSheet(jsonObj, sheet);
			_dataTable.put(name, fs);
		}
		else
		{
			fs = FontSheet(_dataTable.get(name));
		}

		return fs;
	}

	/**
	 * »ñȡÒôƵÎļþ
	 */
	public function getAudio(name:String):Player{
		var p:Player= null;
		var item:ResItem= getResItem(name, Res.TYPE_SOUND);
		if(false == _dataTable.contains(name))
		{
			try
			{
				System.out.println("¹¹½¨ÉùÒô×ÊԴ£º" + item.url());
				p = Manager.createPlayer(item.url());
				_dataTable.put(name, p);
			}
			catch(var e:IOException)
			{
				System.out.println("×ÊԴ¼ÓÔسö´� + item.url());
				e.printStackTrace();
			}
			catch(var e:MediaException)
			{
				System.out.println("ýÌå³ö´� + item.url());
				e.printStackTrace();
			}
		}
		else
		{
			p = Player(_dataTable.get(name));
		}
		return p;
	}

	/**
	 * »ñȡ×ÊԴµÄURLµØַ
	 * 
	 * @param name
	 * @return
	 */
	public function getUrl(name:String):String{
		var url:String;
		if(_resTable.containsKey(name))
		{
			var item:ResItem= ResItem(_resTable.get(name));
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
	 * ÊͷÅ×ÊԴ
	 */
	public function release(name:String):void{
		if(_dataTable.containsKey(name))
		{
			_dataTable.remove(name);
		}
	}

	private function getResItem(name:String, type:String):ResItem{
		var item:ResItem= null;
		if(_resTable.containsKey(name))
		{
			item = ResItem(_resTable.get(name));
			if(false == item.type().equals(type))
			{
				item = new ResItem(name, type, item.url());
				_resTable.put(name, item);
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
			_resTable.put(name, item);
		}
		return item;
	}

}
}