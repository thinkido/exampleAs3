package framework.events
{
	
	
	/**
	 * 事件广播者
	 * 
	 * @author Jing
	 */
	public class EventDispatcher
	{
		
		private var _eventTbl:Object = new Object();
		
		public function EventDispatcher()
		{
			
		}
		
		/**
		 * 广播一个事件
		 * 
		 * @param type 事件的类型
		 * @param data 事件携带的参数
		 */
		public function dispatchEvent( type:int, data:Object = null ):void
		{
			var listeners:Array = _eventTbl[type] as Array;
			if(null == listeners)
			{
				return;
			}
			
			for each(var item:IEventListener in listeners)
			{
				item.onReciveEvent(type,this,data);
			}
			
			/*for(Enumeration enumobj = listeners.elements(); enumobj.hasMoreElements();)
			{
				IEventListener listener = (IEventListener)enumobj.nextElement();
				listener.onReciveEvent(type, this, data);
			}*/
		}
		
		/**
		 * 监听指定的事件     (---------------------函数体有错，需要重写------------------------)
		 * 
		 * @param type 事件的类型
		 * @param listener
		 */
		public function addEventListener( type:int, listener:IEventListener):void
		{
			var listeners:* = _eventTbl[type] ;
			if(null == listeners)
			{
				listeners = [];
//				_eventTbl[new Byte(type)] = listeners;
				_eventTbl[type] = listeners;
			}
			
			if(false == listeners.contains(listener))
			{
				listeners.addElement(listener);
			}
		}
		
		/**
		 * 移除指定的事件监听      (---------------------函数体有错，需要重写------------------------)
		 */
		public function removeEventListener( type:int, listener:IEventListener):void
		{
			var listeners:* = _eventTbl[type] ;
			if(null != listeners)
			{
				listeners.removeElement(listener);			
			}
		}
	}
}