package game.view.window;

import framework.consts.KeyType;
import framework.events.EventDispatcher;
import game.control.LogManager;
import game.control.WindowManager;
import game.model.Global;
import game.model.callback.ICallbackB;
import game.util.CommonUtil;
import ui.UIButton;
import ui.UIObject;
import ui.UIWindow;

public class GiftWindow extends UIWindow {

	private UIButton[] _btnGiftList;

	private UIButton _btnGet;

	protected void initUI() {
		_btnGiftList = new UIButton[7];
		for (int i = 0; i < 7; i++) {
			_btnGiftList[i] = (UIButton) getChildByName("btn_gift_" + (i + 1));
		}
		_btnGet = (UIButton) getChildByName("btn_get_gift");
	}

	public void onEnter() {
		if (Global.giftVO == null) {
			WindowManager.getInstance().closeWindow(this);
			LogManager.getInstance().log("非法礼品VO", LogManager.LEVEL_ERROR);
		} else {
			for (int i = 0; i < 7; i++) {
				if (i < Global.giftVO.day - 1)
					_btnGiftList[i].setState(STATE_DISABLE);
				else if (i == Global.giftVO.day - 1) {
					if (Global.giftVO.fetched)
						_btnGiftList[i].setState(STATE_DISABLE);
					else
						_btnGiftList[i].setState(STATE_FOCUS);
				} else
					_btnGiftList[i].setState(STATE_NORMAL);
			}
			if (Global.giftVO.fetched)
				_btnGet.setState(STATE_DISABLE);
		}
	}

	public void onLeave() {

	}

	protected void onKeyPressed(byte type, EventDispatcher dispatcher,
			Object data) {
		byte keyCode = ((Integer) data).byteValue();
		switch (keyCode) {
		case KeyType.CONFIRM:
			if (!Global.giftVO.fetched) {
				Global.giftVO.fetched = true;
				_btnGiftList[Global.giftVO.day - 1].setState(STATE_DISABLE);
				_btnGet.setState(STATE_DISABLE);
				CommonUtil.showPopupWindow(false, "恭喜,成功领取"
						+ Global.giftVO.gold + "积分", new ICallbackB() {
					public void run(boolean data) {
						close();
					}
				});
			} else {
				close();
			}
			break;
		}

	}

	public void close() {
		WindowManager.getInstance().closeWindow(this);
	}

	public void onConfirm(UIObject target) {

	}
}
