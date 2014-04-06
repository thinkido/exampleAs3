package com.style.scrollBar
{
    import com.style.scrollPane.*;
    
    import fl.core.*;
    
    import flash.display.Bitmap;
    import flash.geom.*;
    
    import lm.mui.skins.SkinStyle;

    public class ScrollBarStyle extends SkinStyle
    {
        private var _rect:Rectangle;

        public function ScrollBarStyle()
        {
            this._rect = new Rectangle(3, 4, 12, 11);
            return;
        }

        override public function setStyle(param1:UIComponent) : void
        {
            param1.setStyle("downArrowUpSkin", GScrollBar_downArrow_upSkin);
            param1.setStyle("downArrowOverSkin", GScrollBar_downArrow_overSkin);
            param1.setStyle("downArrowDownSkin", GScrollBar_downArrow_downSkin);
            param1.setStyle("downArrowDisabledSkin", GScrollBar_downArrow_disabledSkin);
            param1.setStyle("upArrowUpSkin", GScrollBar_upArrow_upSkin);
            param1.setStyle("upArrowOverSkin", GScrollBar_upArrow_overSkin);
            param1.setStyle("upArrowDownSkin", GScrollBar_upArrow_downSkin);
            param1.setStyle("upArrowDisabledSkin", GScrollBar_upArrow_disabledSkin);
            param1.setStyle("trackUpSkin", GScrollBar_trackSkin);
            param1.setStyle("trackOverSkin", GScrollBar_trackSkin);
            param1.setStyle("trackDownSkin", GScrollBar_trackSkin);
            param1.setStyle("trackDisabledSkin", GScrollBar_trackSkin);
            param1.setStyle("thumbUpSkin", GScrollBar_thumbUpSkin);
            param1.setStyle("thumbOverSkin", GScrollBar_thumbOverSkin);
            param1.setStyle("thumbDownSkin", GScrollBar_thumbDownSkin);
            param1.setStyle("thumbDisabledSkin", GScrollBar_trackSkin);
//            param1.setStyle("thumbIcon", ThumbIcon);
			param1.setStyle("thumbIcon", new Bitmap());
            return;
        }

    }
}
