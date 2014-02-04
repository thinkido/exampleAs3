package com.style
{
    import fl.core.*;
    
    import flash.text.*;
    
    import lm.mui.skins.SkinStyle;

    public class GLabelStyle extends SkinStyle
    {
        private var _textFormat:TextFormat;

        public function GLabelStyle()
        {
            this._textFormat = new TextFormat(null, 12, 11661311);
            return;
        }

        override public function setStyle(param1:UIComponent) : void
        {
            param1.setStyle("textFormat", this._textFormat);
            return;
        }

    }
}
