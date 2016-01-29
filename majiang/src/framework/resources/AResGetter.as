package framework.resources
{
	import flash.utils.ByteArray;
	
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	
	/**
	 * 资源获取器基类
	 * @author Jing
	 *
	 */
	public class AResGetter extends EventDispatcher
	{	
		public function getJson(name:String):Object
		{
			return null;
		}
		public function getTexture(name:String):starling.textures.Texture
		{
			return null;
		}
		public function getSheet(name:String):SpriteSheet
		{
			return null;
		}
		public function getFontSheet(name:String):FontSheet
		{
			return null;
		}
		public function getBinary(name:String):ByteArray	//bytearraya 有2个累；
		{
			return null;
		}
		public function getUrl(name:String):String
		{
			return '';
		}
		public function release(name:String):void
		{
			
		}
	}
}