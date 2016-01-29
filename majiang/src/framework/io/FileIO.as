package framework.io
{
	import com.adobe.serialization.json.JSON;
	import com.thinkido.framework.air.FileUtils;
	
	import flash.utils.ByteArray;

	public class FileIO
	{
		public function FileIO()
		{
		}
		/**
		 * 读取文件
		 * 
		 * @param path
		 * @return
		 */
		static public function getFile(path:String):ByteArray
		{
			return FileUtils.getContentByFileName(path) ;
		}
		
		public static function getJson(path:String):Object
		{
			var str:String =  FileUtils.getStringByFile(path); 
			var obj:Object = com.adobe.serialization.json.JSON.decode( str ) ;
			return obj ;			
		}	
		
		static public function encodeParams(args:Object):String{
			var strParam:String= "";
			for(var key:String in args)
			{				
				var value:String= args[key];
				strParam += "&" + key + "=" + value;
			}
			strParam = strParam.substring(1);
			return strParam;
		}		
		
	}
}