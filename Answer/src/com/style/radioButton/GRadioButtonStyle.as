package com.style.radioButton
{
	import fl.core.UIComponent;
	
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	
	import lm.mui.core.GlobalClass;
	import lm.mui.skins.SkinStyle;
	
	
	public class GRadioButtonStyle extends SkinStyle
	{
		private var _scaleRect:Rectangle;
		private var textFormat:TextFormat;
		
		public function GRadioButtonStyle()
		{
			textFormat = new TextFormat(null ,14, 0xffeba5);
			return;
		}
		
		override public function setStyle(param1:UIComponent) : void
		{
			param1.setStyle("upIcon", GRadioButton_upIcon );
			param1.setStyle("overIcon", GRadioButton_upIcon);
			param1.setStyle("downIcon", GRadioButton_selectedUpIcon );
			param1.setStyle("disabledIcon", GRadioButton_disabledIcon );
			param1.setStyle("selectedUpIcon", GRadioButton_selectedUpIcon );
			param1.setStyle("selectedOverIcon", GRadioButton_selectedUpIcon );
			param1.setStyle("selectedDownIcon", GRadioButton_upIcon );
			param1.setStyle("selectedDisabledIcon", GRadioButton_selectedDisabledIcon );
			param1.setStyle("textFormat", textFormat);
			param1.setStyle("textPadding", 0);
			return;
		}
		
	}
	
}
