
package framework.nio;

/**
 * 字节数组缓冲区
 * 
 * @author Jing
 */
public class ByteArray
{

	/**
	 * 使用现有的字节数组作为缓冲区
	 * 
	 * @param bytes
	 * @return
	 */
	public static ByteArray wrap(byte[] bytes)
	{
		return new ByteArray(bytes);
	}

	/**
	 * 创建指定大小的缓冲区
	 * 
	 * @param capacity
	 * @return
	 */
	public static ByteArray allocateDirect(int capacity)
	{
		return new ByteArray(new byte[capacity]);
	}

	// 指针位置
	private int _position = 0;
	
	public void position(int pos)
	{
		if(pos < 0 || pos >= _ba.length)
		{
			pos = 0;
		}
		_position = pos;
	}

	private byte[] _ba = null;
	
	public byte[] array()
	{
		return _ba;
	}

	private ByteArray(byte[] bytes)
	{
		_ba = bytes;
	}

	public short getShort()
	{
		int a = _ba[_position] & 0xFF;
		int b = _ba[_position + 1] << 8 & 0xFF00;
		short v = (short)(a | b);
		_position += 2;
		return v;
	}
	
	public void putShort(short value)
	{
		_ba[_position] = (byte)(value & 0xFF);
		_ba[_position + 1] = (byte)(value >> 8 & 0xFF);
		_position += 2;
	}

	public int getInt()
	{
		int d = _ba[_position] & 0xFF;
		int c = _ba[_position + 1] << 8 & 0xFF00;
		int b = _ba[_position + 2] << 16 & 0xFF0000;
		int a = _ba[_position + 3] << 24 & 0xFF000000;
		int v = a | b | c | d;
		_position += 4;
		return v;
	}
	
	public void putInt(int value)
	{
		_ba[_position] = (byte)(value & 0xFF);
		_ba[_position + 1] = (byte)(value >> 8 & 0xFF);
		_ba[_position + 2] = (byte)(value >> 16 & 0xFF);
		_ba[_position + 3] = (byte)(value >> 24 & 0xFF);
		_position += 4;
	}

	public void get(byte[] dst)
	{
		int copySize = dst.length;
		if(_position + copySize > _ba.length)
		{
			copySize = _ba.length - _position;
		}

		System.arraycopy(_ba, _position, dst, 0, copySize);
		_position += copySize;
	}
	
	public void put(byte[] src)
	{
		int copySize = src.length;
		if(_position + copySize > _ba.length)
		{
			copySize = _ba.length - _position;
		}
		
		System.arraycopy(src, 0, _ba, _position, copySize);
		_position += copySize;
	}
}
