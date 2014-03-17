package com.style.button
{
	import fl.core.UIComponent;
	
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	
	import lm.mui.core.GlobalClass;
	import lm.mui.skins.SkinStyle;

	public class GTabBarButtonStyle extends SkinStyle
	{
		private var _scaleRect:Rectangle;
		private var _textFormat:TextFormat;
		
		public function GTabBarButtonStyle()
		{
			this._scaleRect = new Rectangle(20, 13, 29, 1);
			this._textFormat = new TextFormat("宋体", 12, 0xffffff);
			return;
		}
		
		override public function setStyle(param1:UIComponent) : void
		{
			param1.setStyle("upSkin", GTab_upSkin );
			param1.setStyle("overSkin", GTab_overSkin);
			param1.setStyle("disabledSkin", GTab_disabledSkin );
			
			param1.setStyle("selectedUpSkin", GTab_selectedUpSkin );
			param1.setStyle("selectedDisabledSkin",  GTab_selectedDisabledSkin );
			
			param1.setStyle("textFormat", this._textFormat);
			param1.setStyle("disabledTextFormat", this._textFormat);
			return;
		}
	}
}