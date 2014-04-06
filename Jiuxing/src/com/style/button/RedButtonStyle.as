package com.style.button
{
	import fl.core.*;
	
	import flash.geom.*;
	import flash.text.*;
	import lm.mui.skins.SkinStyle;
	import lm.mui.core.GlobalClass;
	
	
	public class RedButtonStyle extends SkinStyle
	{
		private var _scaleRect:Rectangle;
		private var _textFormat:TextFormat;
		
		public function RedButtonStyle()
		{
			this._scaleRect = new Rectangle(20, 13, 29, 1);
			this._textFormat = new TextFormat("宋体", 12, 0xffffff);
			return;
		}
		
		override public function setStyle(param1:UIComponent) : void
		{
			param1.setStyle("upSkin", GlobalClass.getScaleBitmap("Button2_UpSkin", this._scaleRect));
			param1.setStyle("downSkin", GlobalClass.getScaleBitmap("Button2_DownSkin", this._scaleRect));
			param1.setStyle("overSkin", GlobalClass.getScaleBitmap("Button2_OverSkin", this._scaleRect));
			param1.setStyle("disabledSkin", GlobalClass.getScaleBitmap("Button2_DisabledSkin", this._scaleRect));
			
			param1.setStyle("selectedUpSkin", GlobalClass.getScaleBitmap("Button2_DownSkin", this._scaleRect));
			param1.setStyle("selectedDownSkin", GlobalClass.getScaleBitmap("Button2_DownSkin", this._scaleRect));
			param1.setStyle("selectedOverSkin", GlobalClass.getScaleBitmap("Button2_DownSkin", this._scaleRect));
			
			param1.setStyle("textFormat", this._textFormat);
			param1.setStyle("disabledTextFormat", this._textFormat);
			return;
		}
		
	}
}
