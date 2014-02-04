package lm.mui.controls
{
	import lm.mui.CompCreateFactory;

	public class GSpriteButton extends GUIComponent
	{
		public var btn:GButton;
		
		/**
		 * 此按钮进行了包装，以便按钮的状态为enabled=fakse时，还能显示tip
		 * @param $x
		 * @param $y
		 * @param $width
		 * @param $height
		 * @param $styleName
		 * @param $label
		 * 
		 */		
		public function GSpriteButton($x:Number=0, $y:Number=0, $width:Number=60, $height:Number = 24, $styleName:String="GButton", $label:String="")
		{
			btn = new GButton();
			this.addChild(btn);
			this.x = $x;
			this.y = $y;
			if ($width > 0)
				btn.width = $width;
			if ($height > 0)
				btn.height = $height;
			btn.styleName = $styleName;
			btn.label = $label;
			_width = $width;
			_height = $height;
			btn.textField.filters = CompCreateFactory.FILTERS_DROPSHADOW;
			btn.validateNow();
		}
		
		override public function set enabled(arg0:Boolean):void
		{
			btn.enabled = arg0;
		}
		
		override public function set styleName(param1:String):void
		{
			btn.styleName = param1;
		}
		
		override public function get width():Number
		{
			return _width;
		}
		
		override public function get height():Number
		{
			return _height;
		}
		
		override public function set width(arg0:Number):void
		{
			btn.width = arg0;
			_width = arg0;
		}
		
		override public function set height(arg0:Number):void
		{
			btn.height = arg0;
			_height = arg0;
		}
		
		public function set label(param:String):void
		{
			btn.label = param;	
		}
		
		override public function setStyle(arg0:String, arg1:Object):void
		{
			btn.setStyle(arg0, arg1);
		}
		
		override public function validateNow():void
		{
			btn.validateNow();
		}
	}
}