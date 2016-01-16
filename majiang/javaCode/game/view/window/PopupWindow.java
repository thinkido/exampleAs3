package game.view.window;

import framework.events.EventDispatcher;
import framework.resources.Texture;
import game.control.WindowManager;
import game.model.Global;
import game.model.callback.ICallbackB;
import game.model.vo.PopupVO;
import ui.UIButton;
import ui.UIImageView;
import ui.UIObject;
import ui.UIText;
import ui.UIWindow;

public class PopupWindow extends UIWindow {
	private static final int LINE_LENGTH = 20;

	protected ICallbackB _callback;

	protected UIButton _btnOK;

	protected UIButton _btnCancel;

	protected UIText _tfContent;

	protected UIImageView _imgContent;

	protected int _originBtnOkX;

	protected int _originBtnOkY;

	protected int _midBtnOkX;

	public PopupWindow() {

	}

	public void updateData(Object args) {
		PopupVO vo = (PopupVO) args;
		if (vo.content.getClass() == String.class)
			update(vo.isConfirm, (String) vo.content, vo.callback);
		else
			update(vo.isConfirm, (Texture) vo.content, vo.callback);
	}

	private void baseUpdate(boolean isConfirm, ICallbackB callback) {
		_callback = callback;
		if (isConfirm) {
			_btnOK.setPosition(_originBtnOkX, _originBtnOkY);
			_btnOK.setVisible(true);
			_btnCancel.setVisible(true);
			switchFocus(_btnOK);
		} else {
			_btnOK.setPosition(_midBtnOkX, _originBtnOkY);
			_btnOK.setVisible(true);
			_btnCancel.setVisible(false);
			switchFocus(_btnOK);
		}
	}

	private void update(boolean isConfirm, String text, ICallbackB callback) {
		baseUpdate(isConfirm, callback);
		_imgContent.clearTexture();
		String showTxt = "";
		while (text.length() > LINE_LENGTH) {
			showTxt += text.substring(0, LINE_LENGTH) + "\n";
			text = text.substring(LINE_LENGTH);
		}
		showTxt += text;
		_tfContent.setText(showTxt);
	}

	private void update(boolean isConfirm, Texture texture, ICallbackB callback) {
		baseUpdate(isConfirm, callback);
		_tfContent.setText("");
		_imgContent.setTexture(texture);
	}

	public void initUI() {
		_btnOK = (UIButton) getChildByName("btn_ok");
		_btnCancel = (UIButton) getChildByName("btn_cancel");
		_tfContent = (UIText) getChildByName("tf_content");
		_tfContent.setAnchor(ANCHOR_CENTER);
		_imgContent = (UIImageView) getChildByName("img_content");
		_imgContent.setAnchor(ANCHOR_CENTER);
		_originBtnOkX = _btnOK.getX();
		_originBtnOkY = _btnOK.getY();
		_midBtnOkX = Global.SCREEN_WIDTH / 2 - 43;
		_btnOK.setNeighbors(null, null, _btnCancel, _btnCancel);
		_btnCancel.setNeighbors(null, null, _btnOK, _btnOK);
	}

	public void onConfirm(UIObject target) {
		if (_callback != null)
			_callback.run(target == _btnOK);
		WindowManager.getInstance().closeWindow(this);
	}

	public void onKeyPressed(byte type, EventDispatcher dispatcher, Object data) {
		if (_btnCancel.getVisible()) {
			super.onKeyPressed(type, dispatcher, data);
		} else {
			onConfirm(_btnOK);
		}
	}

	public void onEnter() {

	}

	public void onLeave() {

	}

	public void onDispose() {
		_callback = null;
		_btnOK = null;
		_btnCancel = null;
		_tfContent = null;
		_imgContent = null;
		super.onDispose();
	}

	public void onGoBack() {
		WindowManager.getInstance().closeWindow(this);
	}

	public void releaseRes() {
		// 不释放资源
	}
}
