package game.view.window.rule;

import ui.UIImageView;
import ui.UILayer;

public class RuleLayerMediator {
	private UILayer _layer;

	private int _curIndex;

	private int _totalLength;

	private UIImageView[] _pageViewList;

	public RuleLayerMediator(UILayer layer, int page) {
		_curIndex = 0;
		_layer = layer;
		_totalLength = page;
		_pageViewList = new UIImageView[_totalLength];
		for (int i = 0; i < _totalLength; i++) {
			_pageViewList[i] = (UIImageView) _layer.getChildByName("img_page_"+ (i + 1));
		}
		updateView();
	}

	public boolean goPre() {
		if (_curIndex > 0) {
			_curIndex--;
			updateView();
			return false;
		}
		else
			return true;
	}

	public void goNext() {
		if (_curIndex < _totalLength - 1) {
			_curIndex++;
			updateView();
		}
	}

	public void setVisible(boolean b) {
		_layer.setVisible(b);
	}

	private void updateView() {
		for (int i = 0; i < _totalLength; i++) {
			_pageViewList[i].setVisible(i == _curIndex);
		}
	}
}
