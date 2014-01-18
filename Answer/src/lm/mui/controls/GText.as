package lm.mui.controls
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import lm.mui.CompCreateFactory;
	import lm.mui.display.ScaleBitmap;
	
	
	/**
	 *	带背景图片的 TextField，文字居中 
	 * @author Administrator
	 * 
	 */	
	public class GText extends Sprite
	{
		private var bg:ScaleBitmap;
		private var tf:TextField;
		
		public function GText()
		{
			init();
		}
		
		private function init():void
		{
			bg = CompCreateFactory.getGeneralToolTip();
			this.addChild(bg);
			
			var format:TextFormat = new TextFormat(null,12,0xff0000);
			tf = new TextField();
			tf.multiline = true;
			tf.autoSize = 'left';
			this.addChild(tf);
		}
		
		override public function set width($width:Number):void
		{
			this.bg.width = $width;
			this.tf.x = (this.bg.width - this.tf.width) / 2;
		}
		
		override public function set height($height:Number):void
		{
			this.bg.height = $height;
			this.tf.y = (this.bg.height - this.tf.height) / 2;
		}
		
		public function set text(str:String):void
		{
			this.tf.text = str;
//			if(this.tf.autoSize != TextFieldAutoSize.NONE)
			{
				this.height = this.tf.height + 24;
				this.tf.y = (this.bg.height - this.tf.height) / 2;
				this.tf.x = (this.bg.width - this.tf.width) / 2;
			}
		}
		
		public function set htmlText(str:String):void
		{
			this.tf.htmlText = str;
//			if(this.tf.autoSize != TextFieldAutoSize.NONE)
			{
				this.height = this.tf.height + 24;
				this.tf.y = (this.bg.height - this.tf.height) / 2;
				this.tf.x = (this.bg.width - this.tf.width) / 2;
			}
		}
		
		public function get htmlText():String
		{
			return this.tf.htmlText;
		}
		
		public function set defaultTextFormat(format:TextFormat):void
		{
			this.tf.defaultTextFormat = format;
		}
		
		public function setTextFormat(format:TextFormat):void
		{
			this.tf.setTextFormat(format);
		}
		
		public function set multiline(bool:Boolean):void
		{
			this.tf.multiline = bool;
		}
		
		public function set autoSize(value:String):void
		{
			this.tf.autoSize = value;
		}
	}
}