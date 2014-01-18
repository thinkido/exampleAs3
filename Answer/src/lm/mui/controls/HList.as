package lm.mui.controls
{
	import fl.controls.listClasses.CellRenderer;
	import fl.controls.listClasses.ICellRenderer;
	
	import flash.display.Sprite;
	
	public class HList extends Sprite
	{
		private var _data:Array;
		
		private var _itemRender:Class;
		
		public function HList()
		{
			super();
		}
		
		public function set dataProvide($data:Array):void
		{
			if($data == null)
			{
				throw new Error(Language.getKey("5236"));
				return;
			}
			this._data = $data;
		}
		
		public function set itemRender(item:Class):void
		{
			//判断父类
			this._itemRender = item;
		}
		
		private function construt():void
		{
			var item:ICellRenderer;
			var num:int = this._data.length;
			for(var i:int = 0; i < num; i++)
			{
				item = new this._itemRender() as ICellRenderer;
				item.data = this._data[i];
				this.addChild(item);
			}
		}
	}
}