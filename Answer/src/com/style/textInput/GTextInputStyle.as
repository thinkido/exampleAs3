package com.style.textInput
{
	import fl.core.UIComponent;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import lm.mui.core.GlobalClass;
	import lm.mui.skins.SkinStyle;

    public class GTextInputStyle extends SkinStyle
    {

        public function GTextInputStyle()
        {
        }

        override public function setStyle(param1:UIComponent) : void
        {
            super.setStyle(param1);
            param1.setStyle("textFormat", new TextFormat("宋体", 12, 0xffffff, null, null, null, null, null, TextFormatAlign.CENTER, null, null, 0,null));
            param1.setStyle("upSkin",GTextInput_borderSkin );
            param1.setStyle("disabledSkin",GTextInput_disabledSkin );
            param1.setStyle("focusRectSkin", Sprite);
        }
    }
}
