package com.style.scrollBar
{
	import com.style.commonScrollBar.*;
	
	import fl.core.UIComponent;
	
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	
	import lm.mui.skins.SkinStyle;
	
	public class VerticalScrollBarStyle extends SkinStyle
	{
		private var _rect:Rectangle;
		
		public function VerticalScrollBarStyle()
		{
			_rect = new Rectangle(4,4,8,8);
			return;
		}
		
		override public function setStyle(param1:UIComponent) : void
		{
			param1.setStyle("downArrowUpSkin", CommonDownArrowUpSkin);
			param1.setStyle("downArrowOverSkin", CommonDownArrowOverSkin);
			param1.setStyle("downArrowDownSkin", CommonDownArrowDownSkin);
			param1.setStyle("downArrowDisabledSkin", CommonDownArrowDisabledSkin);
			param1.setStyle("upArrowUpSkin", CommonUpArrowUpSkin);
			param1.setStyle("upArrowOverSkin", CommonUpArrowOverSkin);
			param1.setStyle("upArrowDownSkin", CommonUpArrowDownSkin);
			param1.setStyle("upArrowDisabledSkin", CommonUpArrowDisabledSkin);
			param1.setStyle("trackUpSkin", CommonTrackUpSkin);
			param1.setStyle("trackOverSkin", CommonTrackOverSkin);
			param1.setStyle("trackDownSkin", CommonTrackDownSkin);
			param1.setStyle("trackDisabledSkin", CommonTrackDisabledSkin);
			param1.setStyle("thumbUpSkin", CommonThumbUpSkin);
			param1.setStyle("thumbOverSkin", CommonThumbOverSkin);
			param1.setStyle("thumbDownSkin", CommonThumbDownSkin);
			param1.setStyle("thumbDisabledSkin", CommonThumbDisabledSkin);
//          param1.setStyle("thumbIcon", ThumbIcon);
			param1.setStyle("thumbIcon", new Bitmap());
			return;
		}
	}
}