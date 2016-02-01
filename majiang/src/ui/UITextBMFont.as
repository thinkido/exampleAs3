package ui
{
	import starling.text.BitmapFont;
	
	public class UITextBMFont extends UIObject
	{
		
		private var _bf:BitmapFont = null;
		
		public function UITextBMFont()
		{
			
		}
		
		public function getText():String
		{
			return _bf.text;
		}
		
		public function setText( text:String):void
		{
			if(null != _bf)
			{
				_bf.setText(text);
			}
		}
		
		public function setAnchor( anchor:int):void
		{
//			_bf.setAnchor(anchor);
		}
		
		override public function initWithJsonObject(data:Object):void
		{
			try
			{
				var text:String = data["LabelText"];
				var resource:String = transformPath(data["UserData"]);
//				setName(data["Name"]);
				this.name = data['Name'];
				_bf = new BitmapFont(getFontSheet(resource));
				addChild(_bf);
				setText(text);
				autoSetPosition(data);
			}
			catch( e:Error)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
		}
		
		override public function onDispose():void
		{
			_bf = null;
			super.onDispose();
		}
	}
}
