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
            param1.setStyle("downArrowUpSkin", GSpinner_downArrow_upSkin);
            param1.setStyle("downArrowOverSkin", GSpinner_downArrow_upSkin);
            param1.setStyle("downArrowDownSkin", GSpinner_downArrow_upSkin);
            param1.setStyle("downArrowDisabledSkin", GSpinner_downArrow_upSkin);
            param1.setStyle("upArrowUpSkin", GSpinner_upArrow_upSkin);
            param1.setStyle("upArrowOverSkin", GSpinner_upArrow_upSkin);
            param1.setStyle("upArrowDownSkin", GSpinner_upArrow_upSkin);
            param1.setStyle("upArrowDisabledSkin", GSpinner_upArrow_upSkin);
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
