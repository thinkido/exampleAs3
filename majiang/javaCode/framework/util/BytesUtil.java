package framework.util;

/**
 * 字节数组工具
 * @author Jing
 *
 */
public class BytesUtil
{
	/**
	 * 将字节数组里的数据整体左移
	 * @param ba
	 * @param pos
	 */
	static public void moveLeft(byte[] ba, int pos)
	{
		for(int i = 0; i < ba.length; i++)
		{			
			int copyPos = i + pos;
			byte copyValue = 0;
			if(copyPos < ba.length)
			{
				copyValue = ba[copyPos];
			}
			ba[i] = copyValue;
		}
	}
}
