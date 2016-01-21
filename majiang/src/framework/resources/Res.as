package framework.resources
{
import framework.events.EventDispatcher;

/**
 * ×ÊԴ¹ÜÀíÆ÷
 * 
 * @author Jing
 */
public class Res extends EventDispatcher
{
	/**
	 * ÀàÐÍ ͼƬ
	 */
	static public const TYPE_IMAGE:String= "image";
	
	/**
	 * ÀàÐÍ JSON
	 */
	static public const TYPE_JSON:String= "json";
	
	/**
	 * ÀàÐÍ ÎÆÀ�
	 */
	static public const TYPE_SHEET:String= "sheet";
	
	/**
	 * ÀàÐÍ ÉùÒô
	 */
	static public const TYPE_SOUND:String= "sound";
	
	/**
	 * ÀàÐÍ ×ÖÌå
	 */
	static public const TYPE_FONT:String= "font";
	
	/**
	 * ÀàÐÍ ÎÆÀí
	 */
	static public const TYPE_TEXTURE:String= "texture";
	
	/**
	 * ÀàÐÍ ¶þ½øÖÆÎļþ
	 */
	static public const TYPE_BINARY:String= "binary";

	/**
	 * ¿ÉÒÔÉèÖõļÓÔØÆ󣬿ÉÒÔÊǱ¾µؼÓÔØÆ÷£¬Ҳ¿ÉÒÔÊÇÍøÂç¼ÓÔØÆ÷£¬Áé»îÇл»ʹÓÃ
	 */
	static public var actively:AResGetter= null;
	
	
	/**
	 * ±¾µØ×ÊԴ¶ÁȡÆ÷,ʹÓÃǰÇëÓÃinit³õʼ»¯
	 */
	static public const localRes:LocalResGetter= new LocalResGetter();
	
	/**
	 * ÍøÂç×ÊԴ¶ÁȡÆ÷£¬ʹÓÃǰÇëÓÃinit³õʼ»¯
	 */
	static public const httpRes:HttpResGetter= new HttpResGetter();
}
}