package game.model.vo
{
	
	public class PopupVO {
		public var isConfirm:Boolean;
	
		public var content:Object;
	
		public var callback:Function;
	
		public function PopupVO(_isConfirm:Boolean, _content:Object, _callback:Function) {
			isConfirm = _isConfirm;
			content = _content;
			callback = _callback;
		}
	}
}
