package net.jarlehansen.protobuf.javame.input
{

	import java.io.IOException;
	import java.io.InputStream;
	
	import net.jarlehansen.protobuf.javame.original.input.CodedInputStream;
	
	/**
	 * 
	 * @author hansjar@gmail.com Jarle Hansen
	 *
	 */
	public class DelimitedSizeUtil {
		
		public function DelimitedSizeUtil() {
		}
		
		public static function readDelimitedSize(input:InputStream):int
		{
			return CodedInputStream.readDelimitedSize(input);
		}
	}
}
