package lm.mui.controls
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class LinkButton extends Sprite
	{
		private var tf:TextField = new TextField();
		private var _selected:Boolean = false;
		private var format:TextFormat;
		
		private var _data:Object;
		
		private var _color:uint = 0x9b00ff;
		private var _overColor:uint = 0xff0000;
		
		public function LinkButton()
		{
			this.mouseChildren = false;
			this.buttonMode = true;
			this.addChild(tf);
			tf.autoSize = 'left';
			format = new TextFormat(null,12,_color,null,null,true);
			tf.defaultTextFormat = format;
			tf.height = 22;
			this.addEventListener(MouseEvent.CLICK, mouseHandler);
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseHandler);
		}
		
		private function mouseHandler(event:MouseEvent):void
		{
			if(event.type == MouseEvent.MOUSE_OVER)
			{
				this.tf.textColor = this._overColor; 
			}
			else if(event.type == MouseEvent.MOUSE_OUT)
			{
				this.tf.textColor = this._color;
			}
		}
		
		
		public function set label($name:String):void
		{
			this.tf.text = $name;
		}
		
		public function set color(value:uint):void
		{
			this._color = value;
			tf.textColor = value;
		}
		
		public function set overColor(value:uint):void
		{
			this._overColor = value;
		}
		
		public function set selected(bool:Boolean):void
		{
			this._selected = bool;
			if(bool == true){
				tf.textColor = 0xffffff;
			}else{
				this.tf.textColor = _color;
			}
		}
		
		public function get selected():Boolean
		{
			return this._selected;
		}
		
		public function get data():Object
		{
			return this._data;
		}
		
		public function set data(param:Object):void
		{
			this._data = param;
		}
	}
}