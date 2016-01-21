package framework.resources
{
import java.io.IOException;
import java.io.InputStream;
import java.util.Hashtable;

import javax.microedition.lcdui.Image;
import javax.microedition.media.Manager;
import javax.microedition.media.MediaException;
import javax.microedition.media.Player;

import org.json.me.JSONArray;
import org.json.me.JSONException;
import org.json.me.JSONObject;

import framework.events.EventDispatcher;
import framework.events.IEventListener;
import framework.io.FileIO;
import framework.util.StringUtil;

/**
 * ±¾µØ×ÊԴ»ñȡÆ÷
 * 
 * @author Jing
 */
public class LocalResGetter extends AResGetter implements IEventListener
{

	/**
	 * ×ÊԴ±í
	 */
	private var _resTable:Hashtable= new Hashtable();

	/**
	 * ×ÊԴ¶ÔӦµÄÊý¾ݱí
	 */
	private var _dataTable:Hashtable= new Hashtable();

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
			var jsonObj:JSONObject= FileIO.getJson(path);
			var resList:JSONArray= jsonObj.getJSONArray("resources");
			for(var i:int= 0; i < resList.length(); i++)
			{
				var resItem:JSONObject= resList.getJSONObject(i);
				var itemName:String= resItem.getString("name");
				var itemType:String= resItem.getString("type");
				var itemUrl:String= "/" + resItem.getString("url");
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

		System.out.println("Total local resource:" + _resTable.size());
	}

	/**
	 * »ñȡÎļþ¶þ½øÖÆ
	 * 
	 * @return
	 */
	public byte[] getBinary(var name:String)
	{
		var bytes:Array= null;
		var item:ResItem= getResItem(name, Res.TYPE_BINARY);
		if(false == _dataTable.containsKey(name))
		{
			var url:String= item.url();
			bytes = FileIO.getFile(url);
			_dataTable.put(name, bytes);
		}
		else
		{
			bytes = (byte[])_dataTable.get(name);
		}
		return bytes;
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
			var url:String= item.url();
			obj = FileIO.getJson(url);
			_dataTable.put(name, obj);
		}
		else
		{
			obj = JSONObject(_dataTable.get(name));
		}
		return obj;
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
			try
			{
				image = Image.createImage(url);
				_dataTable.put(name, image);
			}
			catch(var e:IOException)
			{
				System.out.println("×ÊԴ¼ÓÔسö´� + url);
			}
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
			try
			{
				var image:Image= Image.createImage(url);
				t = new Texture(image);
				_dataTable.put(name, t);
			}
			catch(var e:IOException)
			{
				System.out.println("×ÊԴ¼ÓÔسö´� + url);
			}
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
			var jsonObj:JSONObject= FileIO.getJson(url);
			var imagePath:String= url.substring(0, url.length() - 5) + ".png";
			var sheet:Image= null;
			try
			{
				sheet = Image.createImage(imagePath);
			}
			catch(var e:IOException)
			{
				e.printStackTrace();
			}
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
			fs = new FontSheet(item.url());
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
	 * 
	 * @param name ÒôƵÎļþ×ÊԴÃû
	 * @param type ÒôƵÎļþÀàÐÍ
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
				System.out.println("×ÊԴ²»´æÔڣº" + item.url());
			}
			else
			{
				try
				{
					p = Manager.createPlayer(is, type);
					_dataTable.put(name, p);
				}
				catch(var e:IOException)
				{
					System.out.println("×ÊԴ¼ÓÔسö´� + item.url());
				}
				catch(var e:MediaException)
				{
					System.out.println("ýÌå³ö´� + item.url());
				}
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
		}
		return url;
	}

	/**
	 * ÊͷÅ×ÊԴ
	 * 
	 * @param name ͼƬ×ÊԴµÄÃû³Æ
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
		}
		else
		{
			var url:String= name;
			if(url.charAt(0) != '/')
			{
				url = '/' + url;
			}
			item = new ResItem(name, type, url);
			_resTable.put(name, item);
		}
		return item;
	}

	public function onReciveEvent(type:uint, dispatcher:EventDispatcher, data:Object):void{
		this.dispatchEvent(type, data);
	}

}
}