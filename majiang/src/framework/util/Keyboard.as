package framework.util
{
	import framework.consts.EventType;
	
	import starling.events.EventDispatcher;

	public class Keyboard extends EventDispatcher
	{
		private var _map:Object = {} ;

		public function Keyboard()
		{
		}
		
		/**
		 * 设置按下的键
		 * 
		 * @param keyCode
		 */
		public function pressed(keyCode:int):void
		{
			_map[keyCode] = true;
			this.dispatchEvent(EventType.EVENT_KEY_PRESSED,  keyCode);
		}
		
		/**
		 * 设置释放的键
		 * 
		 * @param keyCode
		 */
		public function released(keyCode:int):void
		{
			_map[keyCode] = false;
			this.dispatchEvent(EventType.EVENT_KEY_RELEASEED, keyCode);
		}
		
		/**
		 * 检测指定按键是否按下
		 * 
		 * @param keyCode
		 * @return
		 */
		public function isPressed(int keyCode):Boolean
		{
			if(false == _map.containsKey(keyCode)
			{
				return false;
			}			
			return _map.get(keyCode) as Boolean;
		}
		
	}
}