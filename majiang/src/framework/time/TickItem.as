package framework.time
{
	public class TickItem
	{
		public function TickItem()
		{
		}
		/**
		 * 类型 0:触发一次 1:间隔触发
		 */
		public var type:int = 0;		
		private var _id:int;		
		/**
		 * 触发项的ID
		 */
		public function id():int
		{
			return _id;
		}
		
		public function setId(id:int):void
		{
			_id = id;
		}
		
		private var _data:Object = null;
		
		/**
		 * 携带的数据
		 */
		public function data():Object
		{
			return _data;
		}
		private var _interval:int = 0;
		/**
		 * 每次被触发的间隔
		 */
		public function interval()
		{
			return _interval;
		}
		
		private var _tickTime:int = 0;
		
		/**
		 * 下次触发的时间
		 * 
		 * @return
		 */
		public function tickTime():int
		{
			return _tickTime;
		}
		
		//---------------------------非公开数据
		
		private var _listener:ITickListener = null;
		/**
		 * 监听者
		 * @return
		 */
		public function listener():ITickListener
		{
			return _listener;
		}
		
		/**
		 * 设置下次触发的时间
		 * 
		 * @param tickTime
		 */
		public function setTickTime(tickTime:int):void
		{
			_tickTime = tickTime;
		} 
		
	}
}