package framework.io
{
	import com.adobe.serialization.json.JSON;
	import com.thinkido.framework.air.FileUtils;

	public class FileIO
	{
		public function FileIO()
		{
		}
		
		public static function getJson(path:String):Object
		{
			var str:String =  FileUtils.getStringByFile(path); 
			var obj:Object = com.adobe.serialization.json.JSON.decode( str ) ;
			return obj ;			
		}
		
		
//		public static function getHttpData(path:String):Object
//		{
//			
//		}
//		public static function postHttpData(path:String):Object
//		{
//			
//		}
		/**
		 * 获取输入流
		 * 
		 * @param path
		 * @return
		 */
		public static function getInputStream(path:String):Object
		{
			return null;
		}
		
//		getNetInputStream
//		
	}
}