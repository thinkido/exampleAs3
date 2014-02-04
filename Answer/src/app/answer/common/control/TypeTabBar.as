package app.answer.common.control
{
	import flash.events.MouseEvent;
	
	import lm.mui.controls.GTabBar;
	
	public class TypeTabBar extends GTabBar
	{
		public function TypeTabBar()
		{
			super();
		}
		override protected function updateDisplayList() : void
		{
			var _loc_1:Object = null;
			var tab:TabBarButton = null;
			if (this._dataProviderChange)
			{
				this.dispose();
				for each (_loc_1 in this.dataProvider)
				{
					tab = new TabBarButton();
					tab.name = _loc_1.name;
					tab.label = _loc_1.label;
					tab.width = this.buttonWidth;
					tab.height = this.buttonHeight;
					tab.styleName = this.buttonStyleName;
					tab.toggle = true;//如果这个不设置，那么改变它的selected无效
					this.allButtons.push(tab);
					tab.addEventListener(MouseEvent.CLICK, this.btnClickHandler, false, 0, true);
					if (this._buttonFilters)
					{
						tab.textField.filters = this._buttonFilters;
					}
					this.addChild(tab);
				}
				this.checkSelected();
				this._dataProviderChange = false;
			}
			if (this._selectedChange)
			{
				this._selectedChange = false;
				this.checkSelected();
			}
			super.updateDisplayList();
			return;
		}
	}
}