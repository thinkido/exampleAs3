package framework.util
{
	import com.thinkido.framework.manager.keyBoard.KeyEvent;
	
	import framework.consts.EventType;
	import framework.events.EventDispatcher;

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
//			this.dispatchEvent(EventType.EVENT_KEY_PRESSED,  keyCode);
			this.dispatchEvent(KeyEvent.KEY_DOWN, keyCode);
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
		public function isPressed(keyCode:int):Boolean
		{
			if(_map[keyCode] == undefined)
			{
				return false;
			}			
			return _map[keyCode] as Boolean;
		}
		
	}
}