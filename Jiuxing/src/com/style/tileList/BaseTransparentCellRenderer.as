package com.style.tileList
{
	import flash.display.Sprite;
	
	import lm.mui.skins.SkinStyle;
	
	public class BaseTransparentCellRenderer extends SkinStyle
	{
		public function BaseTransparentCellRenderer()
		{
			super();
			
			this.setStyle("upSkin", Sprite);
			this.setStyle("downSkin", Sprite);
			this.setStyle("overSkin", Sprite);
			this.setStyle("disabledSkin", Sprite);
			this.setStyle("selectedDisabledSkin", Sprite);
			this.setStyle("selectedUpSkin", Sprite);
			this.setStyle("selectedDownSkin", Sprite);
			this.setStyle("selectedOverSkin", Sprite);
		}
	}
}