package ui
{
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	
	import starling.display.Image;
	
	import ui.UIObject;
	
	public class UILoadingBar extends UIObject
	{
		
		private var _bar:Image;
		
		private function setTexture( name:String):void
		{
			if(null == _bar)
			{
				_bar = new Image(getTexture(name));
				addChild(_bar);
			}
			else
				_bar.texture = getTexture(name);
		}
		
		public function getHeight():int
		{
			return _bar.height
		}
		
		public function getWidth():int
		{
			return _bar.width
		}
		
		public function initWithJsonObject( data:JSONObject):void
		{
			try
			{
				if(data.has("TextureFileData"))
				{
					setTexture(transformPath(data.getJSONObject("TextureFileData").getString("Path")));
				}
				else if(data.has("ImageFileData"))
				{
					setTexture(transformPath(data.getJSONObject("ImageFileData").getString("Path")));
				}
				setName(data.getString("Name"));
				autoSetPosition(data);
			}
			catch( e:Error)
			{
				e.printStackTrace();
			}
		}
		
		public function setPercent(v:Number):void
		{
			_bar.setScrollRect(new Rectangle(0, 0, (int)(getWidth() * v), getHeight()));
		}
		
		public function onDispose():void
		{
			_bar = null;
			super.onDispose();
		}
	}
}