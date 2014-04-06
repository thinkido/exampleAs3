package com.style.scrollBar
{
	import com.style.casino.scrollBar.*;
	
	import fl.core.UIComponent;
	
	import flash.display.Bitmap;
	
	import lm.mui.skins.SkinStyle;
	
	public class GreyScrollBarStyle extends SkinStyle
	{
		public function GreyScrollBarStyle()
		{
		}
		
		override public function setStyle(param1:UIComponent) : void
		{
			param1.setStyle("downArrowUpSkin", GreyDownArrowUpSkin);
			param1.setStyle("downArrowOverSkin", GreyDownArrowOverSkin);
			param1.setStyle("downArrowDownSkin", GreyDownArrowDownSkin);
			param1.setStyle("downArrowDisabledSkin", GreyDownArrowDisabledSkin);
			param1.setStyle("upArrowUpSkin", GreyUpArrowUpSkin);
			param1.setStyle("upArrowOverSkin", GreyUpArrowOverSkin);
			param1.setStyle("upArrowDownSkin", GreyUpArrowDownSkin);
			param1.setStyle("upArrowDisabledSkin", GreyUpArrowDisabledSkin);
			param1.setStyle("trackUpSkin", new Bitmap());
			param1.setStyle("trackOverSkin", new Bitmap());
			param1.setStyle("trackDownSkin", new Bitmap());
			param1.setStyle("trackDisabledSkin", new Bitmap());
			param1.setStyle("thumbUpSkin", GreyThumbUpSkin);
			param1.setStyle("thumbOverSkin", GreyThumbOverSkin);
			param1.setStyle("thumbDownSkin", GreyThumbDownSkin);
			param1.setStyle("thumbDisabledSkin", GreyThumbDisabledSkin);
			param1.setStyle("thumbIcon", new Bitmap);
		}
	}
}