package framework.events
{
	import starling.events.EventDispatcher;
	
	/**
	 * 事件监听者接口
	 * 
	 * @author Jing
	 */
	public interface IEventListener
	{
		/**
		 * 接收事件
		 * 
		 * @param type 事件类型
		 * @param dispatcher 广播者
		 * @param data 携带的数据
		 */
		function onReciveEvent(type:int, dispatcher:starling.events.EventDispatcher, data:Object):void;	
	}
}
