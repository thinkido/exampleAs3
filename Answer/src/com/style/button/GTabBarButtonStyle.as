package com.style.button
{
	import fl.core.UIComponent;
	
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	
	import lm.mui.core.GlobalClass;
	import lm.mui.skins.SkinStyle;

	public class GTabBarButtonStyle extends SkinStyle
	{
		private var _scaleRect:Rectangle;
		private var _textFormat:TextFormat;
		
		public function GTabBarButtonStyle()
		{
			this._scaleRect = new Rectangle(20, 13, 29, 1);
			this._textFormat = new TextFormat("宋体", 12, 0xffffff);
			return;
		}
		
		override public function setStyle(param1:UIComponent) : void
		{
			param1.setStyle("upSkin", GlobalClass.getScaleBitmap("TabBarButtom1_UpSkin", this._scaleRect));
			param1.setStyle("downSkin", GlobalClass.getScaleBitmap("TabBarButtom1_DownSkin", this._scaleRect));
			param1.setStyle("overSkin", GlobalClass.getScaleBitmap("TabBarButtom1_OverSkin", this._scaleRect));
			param1.setStyle("disabledSkin", GlobalClass.getScaleBitmap("TabBarButtom1_DisabledSkin", this._scaleRect));
			
			param1.setStyle("selectedUpSkin", GlobalClass.getScaleBitmap("TabBarButtom1_DownSkin", this._scaleRect));
			param1.setStyle("selectedDownSkin", GlobalClass.getScaleBitmap("TabBarButtom1_DownSkin", this._scaleRect));
			param1.setStyle("selectedOverSkin", GlobalClass.getScaleBitmap("TabBarButtom1_DownSkin", this._scaleRect));
			
			param1.setStyle("textFormat", this._textFormat);
			param1.setStyle("disabledTextFormat", this._textFormat);
			return;
		}
	}
}