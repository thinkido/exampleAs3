package framework.resources
{
	/**
	 * 资源项
	 * 
	 * @author Jing
	 */
	public class ResItem
	{
	
		private var _name:String= null;
	
		/**
		 * 资源名
		 * @return
		 */
		public function name():String{
			return _name;
		}
	
		private var _type:String= null;
	
		/**
		 * 资源类型
		 * @return
		 */
		public function type():String{
			return _type;
		}
	
		private var _url:String= null;
		
		/**
		 * 资源地址
		 * @return
		 */
		public function url():String{
			return _url;
		}
		
		/**
		 * 只有sheet类型才有的属性
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