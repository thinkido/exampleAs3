package com.style.button
{
	import fl.core.*;
	
	import flash.geom.*;
	import flash.text.*;
	import lm.mui.skins.SkinStyle;
	import lm.mui.core.GlobalClass;
	
	
	public class GButtonStyle extends SkinStyle
	{
		private var _scaleRect:Rectangle;
		private var _textFormat:TextFormat;
		
		public function GButtonStyle()
		{
			this._scaleRect = new Rectangle(20, 13, 29, 1);
			this._textFormat = new TextFormat("宋体", 12, 0xffffff);
			return;
		}
		
		override public function setStyle(param1:UIComponent) : void
		{
			param1.setStyle("upSkin", GButton_upSkin );
			param1.setStyle("downSkin", GButton_downSkin);
			param1.setStyle("overSkin", GButton_overSkin);
			param1.setStyle("disabledSkin", GButton_disabledSkin );
			
			param1.setStyle("selectedUpSkin", GButton_selectedUpSkin );
			param1.setStyle("selectedDownSkin", GButton_selectedDownSkin );
			param1.setStyle("selectedOverSkin", GButton_selectedOverSkin );
			
			param1.setStyle("textFormat", this._textFormat);
			param1.setStyle("disabledTextFormat", this._textFormat);
			return;
		}
		
	}
}
