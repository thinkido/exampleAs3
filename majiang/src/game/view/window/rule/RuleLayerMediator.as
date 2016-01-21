package game.view.window.rule
{
	import ui.UIImageView;
	import ui.UILayer;
	
	public class RuleLayerMediator 
	{
		private var _layer:UILayer;
	
		private var _curIndex:int;
	
		private var _totalLength:int;
	
		private var _pageViewList:UIImageView;
	
		public function RuleLayerMediator( layer:UILayer,  page:int) {
			_curIndex = 0;
			_layer = layer;
			_totalLength = page;
			_pageViewList = new UIImageView[_totalLength];
			for (var i:int = 0; i < _totalLength; i++) {
				_pageViewList[i] =  _layer.getChildByName("img_page_"+ (i + 1)) as UIImageView;
			}
			updateView();
		}
	
		public function goPre():Boolean {
			if (_curIndex > 0) {
				_curIndex--;
				updateView();
				return false;
			}
			else
				return true;
		}
	
		public function goNext():void {
			if (_curIndex < _totalLength - 1) {
				_curIndex++;
				updateView();
			}
		}
	
		public function setVisible( b:Boolean):void {
			_layer.setVisible(b);
		}
	
		private function updateView():void {
			for (var i:int = 0; i < _totalLength; i++) {
				_pageViewList[i].setVisible(i == _curIndex);
			}
		}
	}
}
