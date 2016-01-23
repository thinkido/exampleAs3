package framework.resources
{
	import flash.utils.ByteArray;
	
	import framework.events.EventDispatcher;
	
	
	/**
	 * 资源获取器基类
	 * @author Jing
	 *
	 */
	public abstract class AResGetter extends EventDispatcher
	{	
		abstract public function getJson(name:String):Object;	
		abstract public function getTexture(name:String):Texture;
		abstract public function getSheet(name:String):SpriteSheet;
		abstract public function getFontSheet(name:String):FontSheet;
		abstract public function getBinary(name:String):ByteArray;	//bytearraya 有2个累；
		abstract public function getUrl(name:String):String;	
		abstract public function release(name:String):void;	
	}
}