package game.model.vo
{
	import game.constant.WindowType;
	
	
	public class OpenWindowVO
	{
	
		public var windowType:WindowType;
	
		public var args:Object;
	
		public function OpenWindowVO(_windowType:WindowType, _args:Object)
		{
			windowType = _windowType;
			args = _args;
		}
	}
}
