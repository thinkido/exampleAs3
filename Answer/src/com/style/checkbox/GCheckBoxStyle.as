package com.style.checkbox
{
    import fl.core.*;
    
    import flash.text.TextFormat;
    
    import lm.mui.core.GlobalClass;
    import lm.mui.skins.SkinStyle;

    public class GCheckBoxStyle extends SkinStyle
    {

		private var textFormat:TextFormat;
		private var _disTextFormat:TextFormat;
		
		public function GCheckBoxStyle()
        {
			textFormat = new TextFormat(null ,14, 0xffeba5,null,null,null,null,null,null);
			_disTextFormat = new TextFormat(null, 14, 0x000000 );
			return;
        }

        override public function setStyle(param1:UIComponent) : void
        {
            param1.setStyle("upIcon", GlobalClass.getBitmap("CheckBox_UpSkin"));
            param1.setStyle("overIcon", GlobalClass.getBitmap("CheckBox_OverSkin"));
            param1.setStyle("downIcon", GlobalClass.getBitmap("CheckBox_DownSkin"));
            param1.setStyle("disabledIcon", GlobalClass.getBitmap("CheckBox_DisabledSkin"));
            param1.setStyle("selectedUpIcon", GlobalClass.getBitmap("CheckBox_SelectedUpSkin"));
            param1.setStyle("selectedOverIcon", GlobalClass.getBitmap("CheckBox_SelectedOverSkin"));
            param1.setStyle("selectedDownIcon", GlobalClass.getBitmap("CheckBox_SelectedDownSkin"));
            param1.setStyle("selectedDisabledIcon", GlobalClass.getBitmap("CheckBox_SelectedDisableSkin"));
			param1.setStyle("textFormat", textFormat);
			param1.setStyle("disabledTextFormat", this._disTextFormat);
            param1.setStyle("textPadding", 0);
            return;
        }

    }
}
