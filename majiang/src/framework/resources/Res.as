package framework.resources
{
import framework.events.EventDispatcher;

/**
 * 资源管理器
 * 
 * @author Jing
 */
public class Res extends EventDispatcher
{
	/**
	 * 类型 图片
	 */
	static public const TYPE_IMAGE:String= "image";
	
	/**
	 * 类型 JSON
	 */
	static public const TYPE_JSON:String= "json";
	
	/**
	 * 类型 纹理集
	 */
	static public const TYPE_SHEET:String= "sheet";
	
	/**
	 * 类型 声音
	 */
	static public const TYPE_SOUND:String= "sound";
	
	/**
	 * 类型 字体
	 */
	static public const TYPE_FONT:String= "font";
	
	/**
	 * 类型 纹理
	 */
	static public const TYPE_TEXTURE:String= "texture";
	
	/**
	 * 类型 二进制文件
	 */
	static public const TYPE_BINARY:String= "binary";

	/**
	 * 可以设置的加载器，可以是本地加载器，也可以是网络加载器，灵活切换使用
	 */
	static public var actively:AResGetter= null;
	
	
	/**
	 * 本地资源读取器,使用前请用init初始化
	 */
	static public const localRes:LocalResGetter= new LocalResGetter();
	
	/**
	 * 网络资源读取器，使用前请用init初始化
	 */
	static public const httpRes:HttpResGetter= new HttpResGetter();
}
}