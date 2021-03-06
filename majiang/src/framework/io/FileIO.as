package framework.io
{
	import com.adobe.serialization.json.JSON;
	import com.thinkido.framework.air.FileUtils;
	
	import flash.utils.ByteArray;
	
	import managers.ResManager;

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
			path = ResManager.getFileUrl( path) ;
			return FileUtils.getContentByFileName(path) ;
		}
		
		public static function getJson(path:String):Object
		{
			path = ResManager.getFileUrl( path) ;
			var by:ByteArray = FileUtils.getContentByFileName(path) ;
			var str:String = by.readUTFBytes( by.length ) ; 
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