package framework.util
{
	import com.adobe.serialization.json.JSON;
	
	import flash.utils.ByteArray;

	public class JSONUtil
	{
		public function JSONUtil()
		{
		}
		/**
		 * 字节数组转换成JSON
		 * @param bytes
		 * @return
		 */
		static public function bytes2Json(bytes:ByteArray):Object
		{
			var jsonObj:Object = null;
			var json:String = "";
			try
			{
				json = bytes.readUTF() ;
				jsonObj = JSON.decode(json) ;
			}
			catch(e:*)
			{
				trace("json parse error");
			}
			
			return jsonObj;
		}
		
	}
}