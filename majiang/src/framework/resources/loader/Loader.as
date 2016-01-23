package framework.resources.loader
{

import framework.consts.EventType;
import framework.events.EventDispatcher;
import framework.resources.Res;
import framework.resources.ResItem;

public class Loader extends EventDispatcher implements Runnable
{

	/**
	 * 加载用的线程
	 */
	private var _t:Thread= null;

	private var _list:Array = [] ;

	public function Loader()
	{

	}

	public function load(data:ResItem):void{
		_list.push(data);

		if(null == _t)
		{
			new Thread(this).start();
		}
	}

	public function run():void{
		while(_list.length > 0)
		{
			var item:ResItem= ResItem(_list[0]);
			_list.shift();

			var type:String= item.type();
			var obj:Object= null;
			if(type ==Res.TYPE_FONT)
			{
				obj = Res.httpRes.getFontSheet(item.name());
			}
			else if(type ==Res.TYPE_IMAGE)
			{
				obj = Res.httpRes.getImage(item.name());
			}
			else if(type ==Res.TYPE_JSON)
			{
				obj = Res.httpRes.getJson(item.name());
			}
			else if(type ==Res.TYPE_SHEET)
			{
				obj = Res.httpRes.getSheet(item.name());
			}
			else if(type ==Res.TYPE_SOUND)
			{
				obj = Res.httpRes.getAudio(item.name());
			}
			else if(type ==Res.TYPE_TEXTURE)
			{
				obj = Res.httpRes.getTexture(item.name());
			}
			else if(type ==Res.TYPE_BINARY)
			{
				obj = Res.httpRes.getBinary(item.name());
			}

			this.dispatchEvent(EventType.EVENT_LOAD_COMPLETE, new LoaderItem(item, obj));
		}

		_t = null;
	}
}
}