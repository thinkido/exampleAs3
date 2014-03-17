package com.style.tabBar
{
	import fl.core.UIComponent;
	
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	
	import lm.mui.skins.SkinStyle;

    public class GTabButtomStyle extends SkinStyle
    {
        private var _scaleRect:Rectangle;
        private var _textFormat:TextFormat;
        private var _textFormatDisable:TextFormat;

        public function GTabButtomStyle()
        {
            this._scaleRect = new Rectangle(8, 6, 14, 10);
            this._textFormat = new TextFormat(null, 12, 0xd7b99b);
            this._textFormatDisable = new TextFormat(null, 12, 0xd7b99b);
            return;
        }

        override public function setStyle(param1:UIComponent) : void
        {
			param1.setStyle("upSkin", GTab_upSkin );
			param1.setStyle("overSkin", GTab_overSkin);
			param1.setStyle("downSkin", GTab_selectedUpSkin);
			param1.setStyle("disabledSkin", GTab_disabledSkin );
			
			param1.setStyle("selectedUpSkin", GTabButtom_selectedUpSkin );
			param1.setStyle("selectedDisabledSkin", GTabButtom_selectedDisabledSkin );
			
			param1.setStyle("textFormat", this._textFormat);
            param1.setStyle("disabledTextFormat", this._textFormatDisable);
            return;
        }

    }
}
