package net.jarlehansen.protobuf.javame.input
{

	import java.io.IOException;
	import java.io.InputStream;
	import java.util.Vector;
	
	import net.jarlehansen.protobuf.javame.ByteString;
	import net.jarlehansen.protobuf.javame.input.taghandler.UnknownTagHandler;
	import net.jarlehansen.protobuf.javame.original.WireFormat;
	import net.jarlehansen.protobuf.javame.original.input.CodedInputStream;
	
	/**
	 * 
	 * @author hansjar@gmail.com Jarle Hansen
	 * 
	 */
	public class InputReader {
		private var unknownTagHandler:UnknownTagHandler;
	
		private var codedInput:CodedInputStream;
		private var previousTag:int = 0;
	
		public function InputReader( buffer:byte[], unknownTagHandler:UnknownTagHandler) 
		{
			codedInput = CodedInputStream.newInstance(buffer);
			this.unknownTagHandler = unknownTagHandler;
		}
	
		public function InputReader_a( input:InputStream, unknownTagHandler:UnknownTagHandler):void
		{
			codedInput = CodedInputStream.newInstance(input);
			this.unknownTagHandler = unknownTagHandler;
		}
		
		public function InputReader_b( input:DelimitedInputStream, unknownTagHandler:UnknownTagHandler):void
		{
			codedInput = CodedInputStream.newInstance(input);
			this.unknownTagHandler = unknownTagHandler;
		}
		
		public function readInt(fieldNumber:int):UnknownTagHandler 
		{
			return codedInput.readInt32();
		}
	
		public function readString(fieldNumber:int):String
		{
			return codedInput.readString();
		}
	
		public function readBoolean( fieldNumber:int):Boolean 
		{
			return codedInput.readBool();
		}
	
		public function readDouble(fieldNumber:int):Number
		{
			return codedInput.readDouble();
		}
	
		public function readFloat(fieldNumber:int):Number
		{
			return codedInput.readFloat();
		}
	
		public function readLong(fieldNumber:int):Number {
			return codedInput.readInt64();
		}
	
		public function readByteString( fieldNumber:int):ByteString
		{
			return codedInput.readBytes();
		}
	
		public function readMessageStart():int
		{
			return codedInput.readMessageStart();
		}
		
		public function getNextFieldNumber():int
		{
			previousTag = codedInput.readTag();
			return WireFormat.getTagFieldNumber(previousTag);
		}
	
		public function getPreviousTagDataTypeAndReadContent():void
		{
			var dataType:int= WireFormat.getTagWireType(previousTag);
			var stringBuffer:StringBuffer = new StringBuffer();
			stringBuffer.append("FieldNumber: ").append(WireFormat.getTagFieldNumber(previousTag)).append(" - ");
	
			switch (dataType)
			{
			case WireFormat.WIRETYPE_FIXED32:
				stringBuffer.append("float value: ").append(Float.toString(codedInput.readFloat()));
				break;
			case WireFormat.WIRETYPE_FIXED64:
				stringBuffer.append("double value: ").append(Double.toString(codedInput.readDouble()));
				break;
			case WireFormat.WIRETYPE_LENGTH_DELIMITED:
				stringBuffer.append("Length delimited (String or ByteString) value: ").append(codedInput.readString());
				break;
			case WireFormat.WIRETYPE_VARINT:
				stringBuffer.append("varint (long, int or boolean) value: ").append(codedInput.readRawVarint64());
				break;
			default:
				break;
			}
	
			unknownTagHandler.unknownTag(stringBuffer.toString());
		}
		
		public function readMessages( fieldNumber:int):Array
		{
			return codedInput.readMessages(fieldNumber);
		}
	}
}
