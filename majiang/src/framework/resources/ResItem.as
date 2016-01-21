package framework.resources
{
/**
 * ×ÊԴÏî
 * 
 * @author Jing
 */
public class ResItem
{

	private var _name:String= null;

	/**
	 * ×ÊԴÃû
	 * @return
	 */
	public function name():String{
		return _name;
	}

	private var _type:String= null;

	/**
	 * ×ÊԴÀàÐÍ
	 * @return
	 */
	public function type():String{
		return _type;
	}

	private var _url:String= null;
	
	/**
	 * ×ÊԴµØַ
	 * @return
	 */
	public function url():String{
		return _url;
	}
	
	/**
	 * ֻÓÐsheetÀàÐͲÅÓеÄÊôÐÔ
	 */
	public var subkeys:String= null;

	public function ResItem(name:String, type:String, url:String)
	{
		_name = name;
		_type = type;
		_url = url;
	}


}
}