package ui
{
	import flash.geom.Rectangle;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class UIImageView extends UIObject
	{
	
		private var _srcTexture:Image;
	
		public function UIImageView()
		{
	
		}
	
		public function getScrollRect():Rectangle
		{
			return _srcTexture.getScrollRect();
		}
	
		public function setScrollRect( rect:Rectangle):void
		{
			_srcTexture.setScrollRect(rect);
		}
	
		public function getHeight():int
		{
			return _srcTexture.getHeight();
		}
	
		public function getWidth():int
		{
			return _srcTexture.getWidth();
		}
	
		public function setTexture( t:Texture):void
		{
			if(null == _srcTexture)
			{
				_srcTexture = new Image(t);
				addChild(_srcTexture);
			}
			else
				_srcTexture.texture = t;
		}
	
		public function setTexture_2( name:String):void
		{
			if(null == _srcTexture)
			{
				_srcTexture = new Image(getTexture(name));
				addChild(_srcTexture);
			}
			else
				_srcTexture.texture = getTexture(name);
		}
	
		public function clearTexture():void
		{
			if(null != _srcTexture)
				_srcTexture.clearTexture();
		}
	
		public function initWithJsonObject( data:JSONObject):void
		{
			try
			{
				if(!data.getJSONObject("FileData").getString("Type").equals("Default"))
				{
					var path:String = data.getJSONObject("FileData").getString("Path");
					_srcTexture = new Image(getTexture(transformPath(path)));
					addChild(_srcTexture);
				}
				setName(data.getString("Name"));
				autoSetPosition(data);
			}
			catch( e:Error)
			{
				e.printStackTrace();
			}
		}
	
		override public function onDispose():void
		{
			_srcTexture = null;
			super.onDispose();
		}
	}
}