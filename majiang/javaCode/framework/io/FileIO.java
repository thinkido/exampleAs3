
package framework.io;

import game.control.LogManager;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.microedition.io.Connector;
import javax.microedition.io.HttpConnection;
import javax.microedition.midlet.MIDlet;
import javax.microedition.rms.RecordStore;
import javax.microedition.rms.RecordStoreException;
import javax.microedition.rms.RecordStoreFullException;
import javax.microedition.rms.RecordStoreNotFoundException;

import org.json.me.JSONException;
import org.json.me.JSONObject;

/**
 * 文件操作
 * 
 * @author Jing
 */
public class FileIO
{

	/**
	 * 读取文件
	 * 
	 * @param path
	 * @return
	 */
	static public byte[] getFile(String path)
	{
		InputStream is = MIDlet.class.getResourceAsStream(path);
		if(null == is)
		{
			LogManager.getInstance().log("文件不存在: " + path, LogManager.LEVEL_ERROR);
			return null;
		}

		int length = 0;
		byte[] bytes = null;
		try
		{
			length = is.available();
			bytes = new byte[length];
			is.read(bytes, 0, length);
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}

		return bytes;
	}

	/**
	 * 以字符串形式读取文件内容
	 * 
	 * @return
	 */
	static public JSONObject getJson(String path)
	{
		JSONObject jsonObj = null;
		InputStream is = MIDlet.class.getResourceAsStream(path);
		if(null == is)
		{
			LogManager.getInstance().log("JSON文件不存在: " + path, LogManager.LEVEL_ERROR);
			return null;
		}
		int length = 0;
		try
		{
			length = is.available();
			byte[] bs = new byte[length];
			is.read(bs, 0, length);
			String json = new String(bs, 0, length, "UTF-8");
			jsonObj = new JSONObject(json);
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		catch(JSONException e)
		{
			e.printStackTrace();
		}

		return jsonObj;
	}

	/**
	 * 获取网络输入流
	 * 
	 * @param url
	 * @return
	 */
	static public InputStream getNetInputStream(String url)
	{
		try
		{
			HttpConnection c = null;
			InputStream is = null;
			c = (HttpConnection)Connector.open(url, Connector.READ);
			int rc = c.getResponseCode();
			if(rc != HttpConnection.HTTP_OK)
			{
				LogManager.getInstance().log(rc + " http request wrong: " + url, LogManager.LEVEL_ERROR);
			}
			else
			{
				is = c.openInputStream();
				return is;
			}
		}
		catch(IOException e)
		{
			LogManager.getInstance().log(" http request wrong: " + url, LogManager.LEVEL_ERROR);
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 获取网络数据
	 * 
	 * @param url
	 * @return
	 */
	static public HttpData getHttpData(String url)
	{
		HttpData hd = null;
		try
		{
			HttpConnection c = null;
			DataInputStream dis = null;
			c = (HttpConnection)Connector.open(url, Connector.READ_WRITE);
			c.setRequestMethod(HttpConnection.GET);
			int rc = c.getResponseCode();
			if(rc != HttpConnection.HTTP_OK)
			{
				throw new IOException("HTTP get response code: " + rc);
			}
			else
			{
				dis = c.openDataInputStream();
				int len = (int)c.getLength();
				byte[] b = new byte[len];
				dis.readFully(b);
				hd = new HttpData(rc, dis, b);
				return hd;
			}
		}
		catch(Exception e)
		{
			LogManager.getInstance().log("http get error: " + url, LogManager.LEVEL_ERROR);
			e.printStackTrace();
		}
		return hd;
	}

	static public HttpData getHttpData(String url, Hashtable args)
	{
		return getHttpData(url + "?" + encodeParams(args));
	}

	static public String encodeParams(Hashtable args)
	{
		String strParam = "";
		for(Enumeration enumobj = args.keys(); enumobj.hasMoreElements();)
		{
			String key = (String)enumobj.nextElement();
			String value = (String)args.get(key);
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
	static public HttpData postHttpData(String url, Hashtable args)
	{
		HttpConnection c = null;
		InputStream is = null;
		OutputStream os = null;
		int rc;
		try
		{
			c = (HttpConnection)Connector.open(url);
			c.setRequestMethod(HttpConnection.POST);
			c.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			os = c.openOutputStream();
			if(args != null && !args.isEmpty())
			{
				String strParam = encodeParams(args);
				byte[] postData = strParam.getBytes("UTF-8");
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
			is = c.openInputStream();
			int len = (int)c.getLength();
			if(len > 0)
			{
				int actual = 0;
				int bytesread = 0;
				byte[] data = new byte[len];
				while((bytesread != len) && (actual != -1))
				{
					actual = is.read(data, bytesread, len - bytesread);
					bytesread += actual;
				}
				HttpData httpData = new HttpData(rc, is, data);
				return httpData;
			}
		}
		catch(Exception e)
		{
			LogManager.getInstance().log("http post error:", LogManager.LEVEL_ERROR);
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(is != null)
					is.close();
				if(os != null)
					os.close();
				if(c != null)
					c.close();
			}
			catch(IOException e)
			{
				e.printStackTrace();
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
	static public InputStream getInputStream(String path)
	{
		InputStream is = MIDlet.class.getResourceAsStream(path);
		return is;
	}

	/**
	 * 保存文件内容到RMS
	 * 
	 * @param b
	 * @return
	 */
	static public boolean rmsSave(byte[] b, String storeName)
	{
		try
		{
			RecordStore rs = RecordStore.openRecordStore(storeName, true);
			if(rs.getNumRecords() == 0)
			{
				rs.addRecord(b, 0, b.length);
			}
			else
			{
				rs.setRecord(1, b, 0, b.length);
			}
			rs.closeRecordStore();
			return true;
		}
		catch(RecordStoreFullException e)
		{
			e.printStackTrace();
		}
		catch(RecordStoreNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(RecordStoreException e)
		{
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 从RMS读取内容
	 * 
	 * @param name
	 * @return
	 */
	static public byte[] rmsLoad(String storeName)
	{
		try
		{
			RecordStore rs = RecordStore.openRecordStore(storeName, false);
			if(rs.getNumRecords() > 0)
			{
				byte[] b = rs.getRecord(1);
				return b;
			}
			rs.closeRecordStore();
			return null;
		}
		catch(RecordStoreFullException e)
		{
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
		catch(RecordStoreNotFoundException e)
		{
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
		catch(RecordStoreException e)
		{
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
		return null;
	}
}
