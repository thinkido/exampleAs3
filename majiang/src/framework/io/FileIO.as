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
		
		
		/**
		 * 获取网络输入流
		 * 
		 * @param url
		 * @return
		 */
		static public function getNetInputStream(url:String):InputStream{
			try
			{
				var c:HttpConnection= null;
				var iss:InputStream= null;
				c = HttpConnection(Connector.open(url, Connector.READ));
				var rc:int= c.getResponseCode();
				if(rc != HttpConnection.HTTP_OK)
				{
					trace(rc + " http request wrong: " + url, "LogManager.LEVEL_ERROR");
				}
				else
				{
					iss = c.openInputStream();
					return iss;
				}
			}
			catch(e:*)
			{
				trace(" http request wrong: " + url, "LogManager.LEVEL_ERROR");
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
			
			return null;
		}
		
		/**
		 * 获取网络数据
		 * 
		 * @param url
		 * @return
		 */
		static public function getHttpData(url:String):HttpData{
			var hd:HttpData= null;
			try
			{
				var c:HttpConnection= null;
				var dis:DataInputStream= null;
				c = HttpConnection(Connector.open(url, Connector.READ_WRITE));
				c.setRequestMethod(HttpConnection.GET);
				var rc:int= c.getResponseCode();
				if(rc != HttpConnection.HTTP_OK)
				{
					throw new IOException("HTTP get response code: " + rc);
				}
				else
				{
					dis = c.openDataInputStream();
					var len:int= int(c.getLength());
					var b:Array= new byte[len];
					dis.readFully(b);
					hd = new HttpData(rc, dis, b);
					return hd;
				}
			}
			catch(e:*)
			{
				trace("http get error: " + url, "LogManager.LEVEL_ERROR");
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
			return hd;
		}
		
		static public function getHttpData(url:String, args:Object):HttpData{
			return getHttpData(url + "?" + encodeParams(args));
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
		
		/**
		 * 获取网络数据
		 * 
		 * @param url
		 * @param args
		 * @return
		 * @throws IOException
		 */
		static public function postHttpData(url:String, ...args):HttpData{
			var c:HttpConnection= null;
			var iss:InputStream= null;
			var os:OutputStream= null;
			var rc:int;
			try
			{
				c = HttpConnection(Connector.open(url));
				c.setRequestMethod(HttpConnection.POST);
				c.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
				os = c.openOutputStream();
				if(args != null && args.length > 0 )
				{
					var strParam:String= encodeParams(args);
					var postData:Array= strParam.getBytes("UTF-8");
					c.setRequestProperty("User-Agent", "Profile/MIDP-2.0 Configuration/CLDC-1.1");
					c.setRequestProperty("Content-Language", "en-US");
					c.setRequestProperty("Content-Length", String.valueOf(postData.length));
					os.write(postData);
				}
				os.flush();
				rc = c.getResponseCode();
				if(rc != HttpConnection.HTTP_OK)
				{
					throw new IOException("HTTP post response code: " + rc);
				}
				iss = c.openInputStream();
				var len:int= int(c.getLength());
				if(len > 0)
				{
					var actual:int= 0;
					var bytesread:int= 0;
					var data:Array= [];
					while((bytesread != len) && (actual != -1))
					{
						actual = iss.read(data, bytesread, len - bytesread);
						bytesread += actual;
					}
					var httpData:HttpData= new HttpData(rc, iss, data);
					return httpData;
				}
			}
			catch(e:*)
			{
				trace("http post error:", "LogManager.LEVEL_ERROR");
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
			constly
			{
				try
				{
					if(iss != null)
					iss.close();
					if(os != null)
						os.close();
					if(c != null)
						c.close();
				}
				catch(e:*)
				{
					trace( e.getStackTrace() );   //e.printStackTrace();
				}
			}
			return null;
		}
		
		/**
		 * 获取输入流
		 * 
		 * @param path
		 * @return
		 */
		static public function getInputStream(path:String):InputStream{
			var iss:InputStream= MIDlet.getResourceAsStream(path);
			return iss;
		}
		
	}
}