package framework.events
{
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

/**
 * Ê¼þ¹㲥Õß
 * 
 * @author Jing
 */
public class EventDispatcher
{

	private var _eventTbl:Hashtable= new Hashtable();

	public function EventDispatcher()
	{

	}

	/**
	 * ¹㲥һ¸öÊ¼þ
	 * 
	 * @param type Ê¼þµÄÀàÐÍ
	 */
	public function dispatchEvent(type:uint):void{
		dispatchEvent(type, null);
	}

	/**
	 * ¹㲥һ¸öÊ¼þ
	 * 
	 * @param type Ê¼þµÄÀàÐÍ
	 * @param data Ê¼þЯ´øµĲÎÊý
	 */
	public function dispatchEvent(type:uint, data:Object):void{
		var listeners:Vector= Vector(_eventTbl.get(new Byte(type)));
		if(null == listeners)
		{
			return;
		}

		for(var enumobj:Enumeration= listeners.elements(); enumobj.hasMoreElements();)
		{
			var listener:IEventListener= IEventListener(enumobj.nextElement());
			listener.onReciveEvent(type, this, data);
		}
	}

	/**
	 * ¼àÌýָ¶¨µÄÊ¼þ
	 * 
	 * @param type Ê¼þµÄÀàÐÍ
	 * @param listener
	 */
	public function addEventListener(type:uint, listener:IEventListener):void{
		var listeners:Vector= Vector(_eventTbl.get(new Byte(type)));
		if(null == listeners)
		{
			listeners = new Vector();
			_eventTbl.put(new Byte(type), listeners);
		}

		if(false == listeners.contains(listener))
		{
			listeners.addElement(listener);
		}
	}

	/**
	 * ÒƳýָ¶¨µÄÊ¼þ¼àÌý
	 */
	public function removeEventListener(type:uint, listener:IEventListener):void{
		var listeners:Vector= Vector(_eventTbl.get(new Byte(type)));
		if(null != listeners)
		{
			listeners.removeElement(listener);			
		}
	}
}
}