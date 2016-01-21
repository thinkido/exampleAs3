package framework.events
{
/**
 * Ê¼þ¼àÌýÕ߽ӿÚ
 * 
 * @author Jing
 */
public interface IEventListener
{
	/**
	 * ½ÓÊÕÊ¼þ
	 * 
	 * @param type Ê¼þÀàÐÍ
	 * @param dispatcher ¹㲥Õß
	 * @param data Я´øµÄÊý¾Ý
	 */
	function onReciveEvent(type:uint, dispatcher:EventDispatcher, data:Object):void;	
}
}