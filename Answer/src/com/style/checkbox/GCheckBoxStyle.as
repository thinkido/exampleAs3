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
            param1.setStyle("upIcon", GCheckBox_upIcon );
            param1.setStyle("overIcon", GCheckBox_upIcon);
            param1.setStyle("downIcon", GCheckBox_selectedUpIcon );
            param1.setStyle("disabledIcon", GCheckBox_upIcon );
            param1.setStyle("selectedUpIcon", GCheckBox_selectedUpIcon);
            param1.setStyle("selectedOverIcon",GCheckBox_selectedUpIcon);
            param1.setStyle("selectedDownIcon", GCheckBox_upIcon );
            param1.setStyle("selectedDisabledIcon", GCheckBox_selectedUpIcon );
			param1.setStyle("textFormat", textFormat);
			param1.setStyle("disabledTextFormat", this._disTextFormat);
            param1.setStyle("textPadding", 0);
            return;
        }

    }
}
