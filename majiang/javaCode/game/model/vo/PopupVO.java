package game.model.vo;

import game.model.callback.ICallbackB;

public class PopupVO {
	public boolean isConfirm;

	public Object content;

	public ICallbackB callback;

	public PopupVO(boolean _isConfirm, Object _content, ICallbackB _callback) {
		isConfirm = _isConfirm;
		content = _content;
		callback = _callback;
	}
}
