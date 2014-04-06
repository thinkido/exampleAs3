package com.style.scrollBar
{
	import com.style.scrollPane.DownArrowDisabledSkin;
	import com.style.scrollPane.DownArrowOverSkin;
	import com.style.scrollPane.DownArrowUpSkin;
	import com.style.scrollPane.ThumbOverSkin;
	import com.style.scrollPane.ThumbUpSkin;
	import com.style.scrollPane.TrackUpSkin;
	import com.style.scrollPane.UpArrowOverSkin;
	import com.style.scrollPane.UpArrowUpSkin;
	import com.style.yellowScrollBar.*;
	
	import fl.core.UIComponent;
	
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	
	import lm.mui.core.GlobalClass;
	import lm.mui.skins.SkinStyle;
	
	public class YellowScrollBarStyle extends SkinStyle
	{
		private var _rect:Rectangle;
		
		public function YellowScrollBarStyle()
		{
			_rect = new Rectangle(4,4,8,8);
			return;
		}
		
		override public function setStyle(param1:UIComponent) : void
		{
			param1.setStyle("downArrowUpSkin", YDownArrowUpSkin);
			param1.setStyle("downArrowOverSkin", YDownArrowOverSkin);
			param1.setStyle("downArrowDownSkin", YDownArrowDownSkin);
			param1.setStyle("downArrowDisabledSkin", YDownArrowDisabledSkin);
			param1.setStyle("upArrowUpSkin", YUpArrowUpSkin);
			param1.setStyle("upArrowOverSkin", YUpArrowOverSkin);
			param1.setStyle("upArrowDownSkin", YUpArrowDownSkin);
			param1.setStyle("upArrowDisabledSkin", YUpArrowDisabledSkin);
			param1.setStyle("trackUpSkin", GlobalClass.getScaleBitmap("yellowTrackBg", new Rectangle(2, 2, 6, 6)));
			param1.setStyle("trackOverSkin", GlobalClass.getScaleBitmap("yellowTrackBg", new Rectangle(2, 2, 6, 6)));
			param1.setStyle("trackDownSkin", GlobalClass.getScaleBitmap("yellowTrackBg", new Rectangle(2, 2, 6, 6)));
			param1.setStyle("trackDisabledSkin", GlobalClass.getScaleBitmap("yellowTrackBg", new Rectangle(2, 2, 6, 6)));
			param1.setStyle("thumbUpSkin", YThumbUpSkin);
			param1.setStyle("thumbOverSkin", YThumbOverSkin);
			param1.setStyle("thumbDownSkin", YThumbDownSkin);
			param1.setStyle("thumbDisabledSkin", YThumbDisabledSkin);
         	param1.setStyle("thumbIcon", new Bitmap);
			
			
			
//			param1.setStyle("downArrowUpSkin", GlobalClass.getBitmap("downArrow_UpSkin"));
//			param1.setStyle("downArrowOverSkin", GlobalClass.getBitmap("downArrow_OverSkin"));
//			param1.setStyle("downArrowDownSkin", GlobalClass.getBitmap("downArrow_DownSkin"));
//			param1.setStyle("downArrowDisabledSkin", GlobalClass.getBitmap("downArrow_DisabledSkin"));
//			param1.setStyle("upArrowUpSkin", GlobalClass.getBitmap("upArrow_UpSkin"));
//			param1.setStyle("upArrowOverSkin", GlobalClass.getBitmap("upArrow_OverSkin"));
//			param1.setStyle("upArrowDownSkin", GlobalClass.getBitmap("upArrow_DownSkin"));
//			param1.setStyle("upArrowDisabledSkin", GlobalClass.getBitmap("upArrow_DisabledSkin"));
//			param1.setStyle("trackUpSkin", GlobalClass.getScaleBitmap("yellowTrackBg", new Rectangle(2, 2, 6, 6)));
//			param1.setStyle("trackOverSkin", GlobalClass.getScaleBitmap("yellowTrackBg", new Rectangle(2, 2, 6, 6)));
//			param1.setStyle("trackDownSkin", GlobalClass.getScaleBitmap("yellowTrackBg", new Rectangle(2, 2, 6, 6)));
//			param1.setStyle("trackDisabledSkin", GlobalClass.getScaleBitmap("yellowTrackBg", new Rectangle(2, 2, 6, 6)));
//			param1.setStyle("thumbUpSkin", GlobalClass.getScaleBitmap("yellowThumb_UpSkin", new Rectangle(3,4,7,24)));
//			param1.setStyle("thumbOverSkin", GlobalClass.getScaleBitmap("yellowThumb_OverSkin", new Rectangle(3,4,7,24)));
//			param1.setStyle("thumbDownSkin", GlobalClass.getScaleBitmap("yellowThumb_DownSkin", new Rectangle(3,4,7,24)));
//			param1.setStyle("thumbDisabledSkin", GlobalClass.getScaleBitmap("yellowThumb_DisabledSkin", new Rectangle(3,4,7,24)));
//          param1.setStyle("thumbIcon", ThumbIcon);
			param1.setStyle("thumbIcon", new Bitmap());
			return;
		}
	}
}