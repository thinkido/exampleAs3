
package game.control;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.microedition.io.Connector;
import javax.microedition.io.HttpConnection;

public class YiuHttpManager
{

	public static String PostOptJson(String url, String param)
	{
		HttpConnection hc = null;
		InputStream is = null;
		ByteArrayOutputStream bos = new ByteArrayOutputStream();

		String res = "{}";

		try
		{
			hc = (HttpConnection)Connector.open(url);
			hc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			hc.setRequestMethod(HttpConnection.POST);

			OutputStream dout = hc.openOutputStream();

			dout.write(param.getBytes());
			if(dout != null)
			{
				dout.close();
				dout = null;
			}

			int ch;
			is = hc.openInputStream();

			while((ch = is.read()) != -1)
			{
				bos.write(ch);
			}
			res = bos.toString();
		}
		catch(Exception e)
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

				if(is != null)
					is.close();

				if(hc != null)
					hc.close();
			}
			catch(Exception e2)
			{
				e2.printStackTrace();
			}
		}

		return res;
	}
}
