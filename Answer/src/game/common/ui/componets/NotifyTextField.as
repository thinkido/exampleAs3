package game.common.ui.componets
{
	import flash.text.TextField;
	
	public class NotifyTextField extends TextField
	{
		
		
		public function NotifyTextField(delay:int=2000)
		{
			this.height = 22;
			
		}
		
		public function onComplete():void
		{
			if (this.parent)
				this.parent.removeChild(this);
		}

	}
}