package framework.io
{
	import flash.utils.ByteArray;
	
	
	
	public class HttpData
	{
		public var rc:int = 0;
		private var _is:InputStream = null;
		public var data:ByteArray = null;

		public function HttpData( rc:int ,ins:InputStream , data:ByteArray )
		{
			this.rc = rc;
			_is = ins;
			this.data = data;
		}
			
		
	}
}