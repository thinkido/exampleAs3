package com.style.scrollPane
{
	import com.style.scrollBar.ScrollBarStyle;
	import com.style.scrollBar.YellowScrollBarStyle;
	
	import fl.core.*;
	
	import flash.display.*;
	
	import lm.mui.core.GlobalClass;
	import lm.mui.skins.SkinStyle;
	
	public class YellowScrollPaneStyle extends SkinStyle
	{
		private var scrollBarStyle:YellowScrollBarStyle;
		
		public function YellowScrollPaneStyle()
		{
			this.scrollBarStyle = new YellowScrollBarStyle();
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
