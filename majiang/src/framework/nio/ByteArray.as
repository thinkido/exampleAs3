package framework.nio
{
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
	public static function wrap(bytes:Array):ByteArray{
		return new ByteArray(bytes);
	}

	/**
	 * 创建指定大小的缓冲区
	 * 
	 * @param capacity
	 * @return
	 */
	public static function allocateDirect(capacity:int):ByteArray{
		return new ByteArray([capacity]);
	}

	// 指针位置
	private var _position:int= 0;
	
	public function position(pos:int):void{
		if(pos < 0|| pos >= _ba.length)
		{
			pos = 0;
		}
		_position = pos;
	}

	private var _ba:Array= null;
	
	public function array():Array
	{
		return _ba;
	}

	private function ByteArray(bytes:Array)
	{
		_ba = bytes;
	}

	public function getShort():Number{
		var a:int= _ba[_position] & 0xFF;
		var b:int= _ba[_position + 1] << 8& 0xFF00;
		var v:Number= int((a | b));
		_position += 2;
		return v;
	}
	
	public function putShort(value:Number):void{
		_ba[_position] = int(value & 0xFF);
		_ba[_position + 1] = int(value >> 8 & 0xFF);
		_position += 2;
	}

	public function getInt():int{
		var d:int= _ba[_position] & 0xFF;
		var c:int= _ba[_position + 1] << 8& 0xFF00;
		var b:int= _ba[_position + 2] << 16& 0xFF0000;
		var a:int= _ba[_position + 3] << 24& 0xFF000000;
		var v:int= a | b | c | d;
		_position += 4;
		return v;
	}
	
	public function putInt(value:int):void{
		_ba[_position] = int(value & 0xFF);
		_ba[_position + 1] = int(value >> 8 & 0xFF);
		_ba[_position + 2] = int(value >> 16 & 0xFF);
		_ba[_position + 3] = int(value >> 24 & 0xFF);
		_position += 4;
	}

	public function get(dst:Array):void{
		var copySize:int= dst.length;
		if(_position + copySize > _ba.length)
		{
			copySize = _ba.length - _position;
		}

//		System.arraycopy(_ba, _position, dst, 0, copySize);
		dst = _ba.slice(
		_position += copySize;
	}
	
	public function put(src:Array):void{
		var copySize:int= src.length;
		if(_position + copySize > _ba.length)
		{
			copySize = _ba.length - _position;
		}
		
		System.arraycopy(src, 0, _ba, _position, copySize);
		_position += copySize;
	}
}
}