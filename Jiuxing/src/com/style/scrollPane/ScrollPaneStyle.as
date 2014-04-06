package com.style.scrollPane
{
    import com.style.scrollBar.ScrollBarStyle;
    
    import fl.core.*;
    
    import flash.display.*;
    
    import lm.mui.core.GlobalClass;
    import lm.mui.skins.SkinStyle;
	
    public class ScrollPaneStyle extends SkinStyle
    {
        private var scrollBarStyle:ScrollBarStyle;

        public function ScrollPaneStyle()
        {
            this.scrollBarStyle = new ScrollBarStyle();
            return;
        }

        override public function setStyle(param1:UIComponent) : void
        {
            param1.setStyle("upSkin", new Bitmap());
            this.scrollBarStyle.setStyle(param1);
            param1.setStyle("focusRectSkin", GlobalClass.getScaleBitmap("WindowCenterB"));
            return;
        }

    }
}
