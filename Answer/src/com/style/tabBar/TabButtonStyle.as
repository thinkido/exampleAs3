package com.style.tabBar
{
	import fl.core.UIComponent;
	
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	
	import lm.mui.core.GlobalClass;
	import lm.mui.skins.SkinStyle;

    public class TabButtonStyle extends SkinStyle
    {
        private var _scaleRect:Rectangle;
        private var _textFormat:TextFormat;
        private var _textFormatDisable:TextFormat;

        public function TabButtonStyle()
        {
            this._scaleRect = new Rectangle(8, 6, 14, 10);
            this._textFormat = new TextFormat(null, 12, 0xd7b99b);
            this._textFormatDisable = new TextFormat(null, 12, 0xd7b99b);
            return;
        }

        override public function setStyle(param1:UIComponent) : void
        {
        	param1.setStyle("upSkin", GlobalClass.getScaleBitmap("TabBarButtom1_UpSkin", this._scaleRect));
            param1.setStyle("downSkin", GlobalClass.getScaleBitmap("TabBarButtom1_DownSkin", this._scaleRect));
            param1.setStyle("overSkin", GlobalClass.getScaleBitmap("TabBarButtom1_OverSkin", this._scaleRect));
            param1.setStyle("disabledSkin", GlobalClass.getScaleBitmap("TabBarButtom1_DisabledSkin", this._scaleRect));
			param1.setStyle("selectedUpSkin", GlobalClass.getScaleBitmap("TabBarButtom1_SelectedUpSkin", this._scaleRect));
			param1.setStyle("selectedOverSkin", GlobalClass.getScaleBitmap("TabBarButtom1_SelectedUpSkin", this._scaleRect));
			param1.setStyle("selectedDownSkin", GlobalClass.getScaleBitmap("TabBarButtom1_SelectedUpSkin", this._scaleRect));	
			param1.setStyle("selectedDisabledSkin", GlobalClass.getScaleBitmap("TabBarButtom1_SelectedUpSkin", this._scaleRect));	
            param1.setStyle("textFormat", this._textFormat);
            param1.setStyle("disabledTextFormat", this._textFormatDisable);
            return;
        }

    }
}
