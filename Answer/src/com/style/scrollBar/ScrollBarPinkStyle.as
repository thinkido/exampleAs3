package com.style.scrollBar
{
    import com.style.scrollPanePink.*;
    
    import fl.core.*;
    
    import flash.geom.*;
    
    import lm.mui.skins.SkinStyle;

    public class ScrollBarPinkStyle extends SkinStyle
    {
        private var _rect:Rectangle;

        public function ScrollBarPinkStyle()
        {
            this._rect = new Rectangle(3, 4, 12, 11);
            return;
        }

        override public function setStyle(param1:UIComponent) : void
        {
            param1.setStyle("downArrowUpSkin", DownArrowUpSkinPink);
            param1.setStyle("downArrowOverSkin", DownArrowOverSkinPink);
            param1.setStyle("downArrowDownSkin", DownArrowUpSkinPink);
            param1.setStyle("downArrowDisabledSkin", DownArrowUpSkinPink);
            param1.setStyle("upArrowUpSkin", UpArrowUpSkinPink);
            param1.setStyle("upArrowOverSkin", UpArrowOverSkinPink);
            param1.setStyle("upArrowDownSkin", UpArrowUpSkinPink);
            param1.setStyle("upArrowDisabledSkin", UpArrowUpSkinPink);
            param1.setStyle("trackUpSkin", TrackUpSkinPink);
            param1.setStyle("trackOverSkin", TrackUpSkinPink);
            param1.setStyle("trackDownSkin", TrackUpSkinPink);
            param1.setStyle("trackDisabledSkin", TrackUpSkinPink);
            param1.setStyle("thumbUpSkin", ThumbUpSkinPink);
            param1.setStyle("thumbOverSkin", ThumbOverSkinPink);
            param1.setStyle("thumbDownSkin", ThumbUpSkinPink);
            param1.setStyle("thumbDisabledSkin", ThumbUpSkinPink);
            return;
        }

    }
}
