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
			param1.setStyle("upIcon", GlobalClass.getBitmap("RadioBox2_UpSkin"));
			param1.setStyle("overIcon", GlobalClass.getBitmap("RadioBox2_OverSkin"));
			param1.setStyle("downIcon", GlobalClass.getBitmap("RadioBox2_DownSkin"));
			param1.setStyle("disabledIcon", GlobalClass.getBitmap("RadioBox2_DisabledSkin"));
			param1.setStyle("selectedUpIcon", GlobalClass.getBitmap("RadioBox2_SelectedUpSkin"));
			param1.setStyle("selectedOverIcon", GlobalClass.getBitmap("RadioBox2_SelectedOverSkin"));
			param1.setStyle("selectedDownIcon", GlobalClass.getBitmap("RadioBox2_SelectedDownSkin"));
			param1.setStyle("selectedDisabledIcon", GlobalClass.getBitmap("RadioBox2_SelectedDisableSkin"));
			param1.setStyle("textFormat", textFormat);
			param1.setStyle("textPadding", 0);
			return;
		}
		
	}
	
}
