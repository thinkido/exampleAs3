package game.model.vo
{
	import game.model.callback.ICallbackB;
	
	public class PopupVO {
		public var isConfirm:Boolean;
	
		public var content:Object;
	
		public var callback:ICallbackB;
	
		public function PopupVO(_isConfirm:Boolean, _content:Object, _callback:ICallbackB) {
			isConfirm = _isConfirm;
			content = _content;
			callback = _callback;
		}
	}
}
