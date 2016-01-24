package framework.time
{
	import framework.time.ITickListener;
	import framework.time.TickItem;
	
	public class Ticker
	{
		
		/**
		 * 最后一次被
		 */
		private var _lastTime:int = 0;
		
		private var _vector:Array = [];
		
		/**
		 * 使用后自动增加的ID
		 */
		private var _incrementId:int = 1;
		
		public function Ticker()
		{
			
		}
		
		/**
		 * 心跳触发
		 * 
		 * @params now 当前时间(毫秒)
		 */
		public function tick(now:int):void
		{
			_lastTime = now;
			var size:int = _vector.length  ;
			var item:TickItem ;
			while(--size > -1)
			{
				item = _vector[size] as TickItem;
				if(now >= item.tickTime())
				{
					item.listener().onTick(item);
					
					if(item.type == 1)
					{
						item.setTickTime(now + item.interval());
					}
					else
					{
						_vector.removeElementAt(size);
					}
				}
			}
		}
		
		/**
		 * 在指定的时间(毫秒)后调用接口
		 */
		public function setTimeout(delay:int,listener:ITickListener,params:Object):int
		{
			var item:TickItem = createItem(0, delay, listener, params);
			return item.id();
		}
		
		/**
		 * 以指定的时间(毫秒)间隔触发接口
		 */
		public function setTimeInterval(interval:int,listener:ITickListener,params:Object):int
		{
			var item:TickItem = createItem(1, interval, listener, params);
			return item.id();
		}
		
		/**
		 * 释放时间触发
		 * 
		 * @param id 触发项ID
		 */
		public function release(id:int):void
		{
			var size:int = _vector.length ;
			var item:TickItem ;
			for(var i:int = 0; i < size; i++)
			{
				item = _vector[i] as TickItem;
				if(item.id() == id)
				{
					_vector.splice(i,1) ;  // _vector.removeElementAt(i) ;
					break;
				}
			}
		}
		
		/**
		 * get ticker item
		 */
		public function getItem(id:int):TickItem
		{
			var size:int = _vector.length ;
			var item:TickItem;
			for(var i:int = 0; i < size; i++)
			{
				item = _vector[i] as TickItem;
				if(item.id() == id)
				{
					return item;
				}
			}			
			return null;
		}
		
		/**
		 * 创建一个项
		 * 
		 * @param type
		 * @param interval
		 * @param listener
		 * @param params
		 * @return
		 */
		private function createItem(type:int, interval:int,listener:ITickListener,params:Object):TickItem
		{
			var item:TickItem = new TickItem(type, interval, listener, params);
			item.setTickTime(_lastTime + interval);
			item.setId(_incrementId++);
			_vector.push(item);
			return item;
		}
		
	}
}