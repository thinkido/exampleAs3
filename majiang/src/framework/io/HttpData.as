package framework.io
{
	import java.io.InputStream;
	
	/**
	 * Http网络请求的数据
	 * 
	 * @author Jing
	 */
	public class HttpData
	{
	
		private var _rc:int= 0;
	
		/**
		 * 网络返回码
		 */
		public function rc():int{
			return _rc;
		}
	
		private var _is:InputStream= null;
	
		/**
		 * 网络流
		 * @return
		 */
		public function inputStream():InputStream{
			return _is;
		}
	
		private var _data:Array= null;
	
		/**
		 * 得到的数据
		 * @return
		 */
		public function data():Array
		{
			return _data;
		}
	
		public function HttpData(rc:int, iss:InputStream, data:Array)
		{
			_rc = rc;
			_is = iss;
			_data = data;
		}
	}
}