package net.jarlehansen.protobuf.javame;

import java.util.Vector;

import net.jarlehansen.protobuf.javame.original.output.CodedOutputStream;


/**
 * 
 * @author hansjar@gmail.com Jarle Hansen
 *
 */
public class ComputeSizeUtil {

	private ComputeSizeUtil() {
	}
	
	public static int computeDelimitedIntSize(final int value) {
		return CodedOutputStream.computeRawVarint32Size(value);
	}
	
	public static int computeIntSize(final int id, final int value) {
		return CodedOutputStream.computeInt32Size(id, value);
	}

	public static int computeStringSize(final int id, final String value) {
		return CodedOutputStream.computeStringSize(id, value);
	}

	public static int computeBooleanSize(final int id, final boolean value) {
		return CodedOutputStream.computeBoolSize(id, value);
	}

	public static int computeDoubleSize(final int id, final double value) {
		return CodedOutputStream.computeDoubleSize(id, value);
	}

	public static int computeFloatSize(final int id, final float value) {
		return CodedOutputStream.computeFloatSize(id, value);
	}

	public static int computeLongSize(final int id, final long value) {
		return CodedOutputStream.computeInt64Size(id, value);
	}

	public static int computeByteStringSize(final int id, final ByteString value) {
		return CodedOutputStream.computeBytesSize(id, value);
	}

	public static int computeMessageSize(final int id, final int value) {
		return CodedOutputStream.computeTagSize(id) + CodedOutputStream.computeRawVarint32Size(value) + value;
	}
	
	public static int computeListSize(final int id, final int dataType, final Vector list) {
		int listSize = 0;
		
		if(list != null) {
			switch (dataType) {
				case SupportedDataTypes.DATA_TYPE_BYTESTRING:
					for (int i = 0; i < list.size(); i++) {
						listSize += computeByteStringSize(id, (ByteString) list.elementAt(i));
					}
					break;
				case SupportedDataTypes.DATA_TYPE_DOUBLE:
					for (int i = 0; i < list.size(); i++) {
						listSize += computeDoubleSize(id, ((Double) list.elementAt(i)).doubleValue());
					}
					break;
				case SupportedDataTypes.DATA_TYPE_FLOAT:
					for (int i = 0; i < list.size(); i++) {
						listSize += computeFloatSize(id, ((Float) list.elementAt(i)).floatValue());
					}
					break;
				case SupportedDataTypes.DATA_TYPE_INT:
					for (int i = 0; i < list.size(); i++) {
						listSize += computeIntSize(id, ((Integer) list.elementAt(i)).intValue());
					}
					break;
				case SupportedDataTypes.DATA_TYPE_LONG:
					for (int i = 0; i < list.size(); i++) {
						listSize += computeLongSize(id, ((Long) list.elementAt(i)).longValue());
					}
					break;
				case SupportedDataTypes.DATA_TYPE_STRING:
					for (int i = 0; i < list.size(); i++) {
						listSize += computeStringSize(id, (String) list.elementAt(i));
					}
					break;
				case SupportedDataTypes.DATA_TYPE_BOOLEAN:
					for (int i = 0; i < list.size(); i++) {
						listSize += computeBooleanSize(id, ((Boolean) list.elementAt(i)).booleanValue());
					}
					break;
				case SupportedDataTypes.DATA_TYPE_CUSTOM:
					for(int i = 0; i < list.size(); i++) {
						listSize += computeMessageSize(id, ((CustomListWriter)list.elementAt(i)).computeSize());
					}
					break;
				default:
					throw new IllegalArgumentException("The data type was not found, the id used was " + dataType);
			}
		}

		return listSize;
	}
}
