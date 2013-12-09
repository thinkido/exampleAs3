package style.btnStyle
{
	import fl.core.UIComponent;
	
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	
	import lm.mui.core.GlobalClass;
	import lm.mui.skins.SkinStyle;
	
	public class ButtonRedStyle extends SkinStyle
	{
		private var _textFormat:TextFormat;
		private var _textFormatDisable:TextFormat;
		private var _scaleRect:Rectangle;
		
		public function ButtonRedStyle()
		{
			this._scaleRect = new Rectangle(36, 6, 4, 12);
			this._textFormat = new TextFormat(null, 12, 0xafc3a5);
			this._textFormatDisable = new TextFormat(null, 12, 0xFFFF66,true);
			return;
		}
		
		override public function setStyle(param1:UIComponent) : void
		{
			param1.setStyle("upSkin", GlobalClass.getScaleBitmap("ButtonRed_UpSkin", this._scaleRect));
			param1.setStyle("overSkin", GlobalClass.getScaleBitmap("ButtonRed_OverSkin", this._scaleRect));
			param1.setStyle("downSkin", GlobalClass.getScaleBitmap("ButtonRed_DownSkin", this._scaleRect));
			param1.setStyle("disabledSkin", GlobalClass.getScaleBitmap("ButtonRed_UpSkin", this._scaleRect));
			param1.setStyle("selectedUpSkin", GlobalClass.getScaleBitmap("ButtonRed_DownSkin", this._scaleRect));
			param1.setStyle("selectedOverSkin", GlobalClass.getScaleBitmap("ButtonRed_DownSkin", this._scaleRect));
			param1.setStyle("selectedDownSkin", GlobalClass.getScaleBitmap("ButtonRed_DownSkin", this._scaleRect));	
			param1.setStyle("selectedDisabledSkin", GlobalClass.getScaleBitmap("ButtonRed_UpSkin", this._scaleRect));	
			param1.setStyle("textFormat", this._textFormat);
			param1.setStyle("disabledTextFormat", this._textFormatDisable);
			return;
		}
		
	}
}