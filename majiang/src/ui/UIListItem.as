package ui
{
	public class UIListItem extends UIContainer
	{
		
		protected var _pre:UIListItem;
		
		protected var _next:UIListItem;
		
		protected var _state:int = STATE_NORMAL;
		
		public function setNeighbors(pre:UIListItem,  next:UIListItem):void
		{
			_pre = pre;
			_next = next;
		}
		
		public function getNeighbor( isNext:Boolean):UIListItem
		{
			if(isNext)
			{
				return _next;
			}
			else
			{
				return _pre;
			}
		}
		
		public function getState():int
		{
			return _state;
		}
		
		public function setState( state:int):void
		{
			_state = state;
		}
		
		public function  getWidth():int
		{
			return 0;
		}
		
		public  function getHeight():int
		{
			return 0;
		}
		
		public function getGap():int
		{
			return 0;
		}
		
		public function setItemData( data:Object, index:int):void
		{
			
		}
		
		override public function onDispose():void
		{
			_pre = null;
			_next = null;
			super.onDispose();
		}
	}
}
