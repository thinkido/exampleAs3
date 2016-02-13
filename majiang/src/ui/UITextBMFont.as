package ui
{
	import framework.resources.Res;
	
	import managers.ResManager;
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	
	public class UITextBMFont extends UIObject
	{
		
		private var _bf:TextField = null;
		
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
				_bf.text = text;
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
				var bf:BitmapFont = ResManager.getFile(resource , Res.TYPE_FONT ) as BitmapFont; 	//new BitmapFont(getFontSheet(resource)); 
				TextField.registerBitmapFont( bf , resource ) ;
				_bf = new TextField(100,22,'');
				_bf.fontName = resource ;
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
