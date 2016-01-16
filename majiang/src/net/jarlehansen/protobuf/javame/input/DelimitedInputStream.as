package net.jarlehansen.protobuf.javame.input
{
	
	import java.io.IOException;
	import java.io.InputStream;
	
	/**
	 * 
	 * @author Google (http://code.google.com/p/protobuf/)
	 * @author hansjar@gmail.com Jarle Hansen
	 * 
	 */
	public class DelimitedInputStream extends InputStream 
	{
		private var input:InputStream;
		private var limit:int;
	
		public function DelimitedInputStream( input:InputStream,  limit:int) {
			this.input = input;
			this.limit = limit;
		}
	
		/*public int available() throws IOException {
			return Math.min(super.available(), limit);
		}*/
		public function available():int
		{
			return Math.min(super.available(), limit);
		}
	
		public function read():int 
		{
			if (limit <= 0)
				return -1;
			var result:int = input.read();
			if (result >= 0)
				--limit;
			return result;
		}
	
		public function read_a( b:*/*byte[]*/,  off:int, len:int):int
		{
			if (limit <= 0)
				return -1;
			len = Math.min(len, limit);
			var result:int = super.read(b, off, len);
			if (result >= 0)
				limit -= result;
			return result;
		}
	
		public function skip(n:Number):Number
		{
			var result:Number = super.skip(Math.min(n, limit));
			if (result >= 0)
				limit -= result;
			return result;
		}
	}
}	
