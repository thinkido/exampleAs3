package game.view.window.user;

import ui.UIImageView;
import ui.UILayer;

public class UserHeadMediator {
	private UILayer _layer;

	private UIImageView _imgMaleHead;

	private UIImageView _imgFemaleHead;

	public UserHeadMediator(UILayer layer) {
		_layer = layer;
		_imgMaleHead = (UIImageView) _layer.getChildByName("img_male_head");
		_imgFemaleHead = (UIImageView) _layer.getChildByName("img_female_head");
	}

	public void setSex(int sex) {
		if (sex == 0) {
			_imgMaleHead.setVisible(false);
			_imgFemaleHead.setVisible(true);
		} else {
			_imgMaleHead.setVisible(true);
			_imgFemaleHead.setVisible(false);
		}
	}

	public void setVisible(boolean b) {
		_layer.setVisible(b);
	}

	public boolean getVisible() {
		return _layer.getVisible();
	}
}
