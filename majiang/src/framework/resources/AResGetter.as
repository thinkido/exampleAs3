package framework.resources
{
import org.json.me.JSONObject;

import framework.events.EventDispatcher;

/**
 * ×ÊԴ»ñȡÆ÷»ùÀà
 * @author Jing
 *
 */
public abstract class AResGetter extends EventDispatcher
{	
	abstract public function getJson(name:String):JSONObject;	
	abstract public function getTexture(name:String):Texture;
	abstract public function getSheet(name:String):SpriteSheet;
	abstract public function getFontSheet(name:String):FontSheet;
	abstract public byte[] getBinary(var name:String);
	abstract public function getUrl(name:String):String;	
	abstract public function release(name:String):void;	
}
}