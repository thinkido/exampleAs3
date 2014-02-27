package game.common.ui.componets
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class RollTextFace extends Sprite
	{
		public var maxShowCount:int = 1;
		public var showCount:int;
		private var _text:String;
		private static var filter:Array = [new GlowFilter(3591, 1, 4, 4, 4, BitmapFilterQuality.LOW)];
		
		public function RollTextFace($text:String = "", $maxShowCount:int = 1)
		{
			var _tf:TextField = null;
			this._text = $text;
			this.maxShowCount = $maxShowCount;
			this.showCount = 0;
			_tf = new TextField();
			_tf.mouseEnabled = true;
			_tf.selectable = false ;
			_tf.autoSize = TextFieldAutoSize.LEFT;
			_tf.textColor = 16777215;
			_tf.filters = filter;
			_tf.htmlText = this._text;
			var _format:TextFormat = new TextFormat();
			_format.size = 18;
			_format.underline = true ;
			_tf.setTextFormat(_format);
			this.addChild(_tf);
			return;
		}
		
		public function clone() : RollTextFace
		{
			return new RollTextFace(this._text, this.maxShowCount);
		}

	}
}