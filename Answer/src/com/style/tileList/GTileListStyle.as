package com.style.tileList
{
    import app.answer.modules.answer.view.components.GroupItem;
    
    import com.style.scrollBar.ScrollBarStyle;
    
    import fl.core.*;
    
    import flash.display.*;
    import flash.geom.Rectangle;
    
    import lm.mui.skins.SkinStyle;

    public class GTileListStyle extends SkinStyle
    {
        private var scrollBarStyle:ScrollBarStyle;
		private var _scaleRect:Rectangle = new Rectangle(14,19,55,82);

        public function GTileListStyle()
        {
            this.scrollBarStyle = new ScrollBarStyle();
            return;
        }

        override public function setStyle(param1:UIComponent) : void
        {
            super.setStyle(param1);
            param1.setStyle("skin", Sprite );
//			param1.setStyle("skin", GList_bg_skin );
			param1.setStyle("cellRenderer", GroupItem);
            this.scrollBarStyle.setStyle(param1);
            return;
        }

    }
}
