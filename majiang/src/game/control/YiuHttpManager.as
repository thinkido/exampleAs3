package game.control
	{
	
	
	public class YiuHttpManager
	{
		public static function PostOptJson( url:String,  param:String):String
		{
			var hc:HttpConnection = null;
			var input:InputStream = null;
			var bos:ByteArrayOutputStream = new ByteArrayOutputStream();
	
			var res:String = "{}";
	
			try
			{
				hc = Connector.open(url) as HttpConnection;
				hc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
				hc.setRequestMethod(HttpConnection.POST);
	
				var dout:OutputStream = hc.openOutputStream();
	
				dout.write(param.getBytes());
				if(dout != null)
				{
					dout.close();
					dout = null;
				}
	
				var ch:int;
				input = hc.openInputStream();
	
				while((ch = input.read()) != -1)
				{
					bos.write(ch);
				}
				res = bos.toString();
			}
			catch(e:*)
			{
				// if an error occurred connecting to the server.
				// throw new Exception(e.getMessage());
	
			}
			finally
			{
				try
				{
					if(bos != null)
						bos.close();
	
					if(input != null)
						input.close();
	
					if(hc != null)
						hc.close();
				}
				catch(e2:Error)
				{
					e2.printStackTrace();
				}
			}
	
			return res;
		}
	}
}
