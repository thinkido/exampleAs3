package app.answer.modules.answer.view.components
{
	import fl.controls.listClasses.CellRenderer;
	
	import flash.text.TextFormat;
	
	import lm.mui.CompCreateFactory;
	import lm.mui.controls.GLabel;
	
	public class GroupItem extends CellRenderer
	{
		private var format:TextFormat = new TextFormat();;
		public var nameLab:GLabel;

		public function GroupItem()
		{
			super();
			init();
			initStyle();
			this.mouseChildren = true;
		}
		
		private function init():void
		{
			format = new TextFormat(null,16, 0xffffff, false, null, null, null, null, 'center');
			nameLab = CompCreateFactory.createGLabel(0,0,30,30,"no",format);
			this.addChild(nameLab);
			nameLab.validateNow();
			
		}
		
		private function initStyle():void
		{
			this.setStyle("upSkin", GListCell_upSkin);
			this.setStyle("downSkin", GListCell_upSkin);
			this.setStyle("overSkin", GListCell_overSkin);
			this.setStyle("disabledSkin", GCell_disabledSkin);
			this.setStyle("selectedDisabledSkin", GCell_selected_upSkin);
			this.setStyle("selectedUpSkin", GCell_selected_upSkin);
			this.setStyle("selectedDownSkin", GCell_selected_upSkin);
			this.setStyle("selectedOverSkin", GCell_selected_overSkin);
		}
		
		override public function set data(value:Object):void
		{
			_data = value ;
			nameLab.text = value.name ;
			nameLab.validateNow();
		}
		
	}
}