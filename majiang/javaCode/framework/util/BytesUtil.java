package framework.util;

/**
 * �ֽ����鹤��
 * @author Jing
 *
 */
public class BytesUtil
{
	/**
	 * ���ֽ��������������������
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
