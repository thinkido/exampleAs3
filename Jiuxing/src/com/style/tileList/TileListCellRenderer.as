package com.style.tileList
{
	import fl.controls.listClasses.CellRenderer;
	import lm.mui.core.GlobalClass;
	import flash.display.Bitmap;
	import flash.text.TextFormat;
	
	public class TileListCellRenderer extends CellRenderer
	{
		public function TileListCellRenderer()
		{
			super();
			setSize(30, 30);
			this.setStyle("downSkin", GCell_upSkin);
			this.setStyle("overSkin", GCell_overSkin);
			this.setStyle("upSkin", new Bitmap());
			this.setStyle("selectedDownSkin", GCell_selected_overSkin);
			this.setStyle("selectedOverSkin", GCell_selected_upSkin );
			this.setStyle("selectedUpSkin", GCell_selected_upSkin );
			this.setStyle("textFormat", new TextFormat(null, 12, 16777215));
			return;
		}
	}
}