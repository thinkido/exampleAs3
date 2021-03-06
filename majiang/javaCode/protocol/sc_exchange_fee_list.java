package protocol;
// Generated by proto2javame, Wed Jan 13 00:12:46 CST 2016.

import java.io.IOException;
import java.io.InputStream;


import net.jarlehansen.protobuf.javame.input.InputReader;
import net.jarlehansen.protobuf.javame.input.DelimitedInputStream;
import net.jarlehansen.protobuf.javame.input.DelimitedSizeUtil;
import net.jarlehansen.protobuf.javame.ComputeSizeUtil;
import net.jarlehansen.protobuf.javame.output.OutputWriter;
import net.jarlehansen.protobuf.javame.AbstractOutputWriter;
import net.jarlehansen.protobuf.javame.input.taghandler.UnknownTagHandler;
import net.jarlehansen.protobuf.javame.input.taghandler.DefaultUnknownTagHandlerImpl;

public final class sc_exchange_fee_list extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final java.util.Vector st_fee_list;
	private static final int fieldNumberSt_fee_list = 1;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_exchange_fee_list(final Builder builder) {
			this.st_fee_list = builder.st_fee_list;
			}

	public static class Builder {
		private java.util.Vector st_fee_list = new java.util.Vector();
		private boolean hasSt_fee_list = false;


		private Builder() {
		}

		public Builder setSt_fee_list(final java.util.Vector st_fee_list) {
			if(!hasSt_fee_list) {
				hasSt_fee_list = true;
			}
			this.st_fee_list = st_fee_list;
			return this;
		}


		public Builder addElementSt_fee_list(final st_fee element) {
			if(!hasSt_fee_list) {
				hasSt_fee_list = true;
			}
			st_fee_list.addElement(element);
			return this;
		}

		public sc_exchange_fee_list build() {
			return new sc_exchange_fee_list(this);
		}
	}

	public java.util.Vector getSt_fee_list() {
		return st_fee_list;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		retValue += "st_fee_list = " + this.st_fee_list + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberSt_fee_list, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, st_fee_list);

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		writer.writeList(fieldNumberSt_fee_list, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, st_fee_list);
	}

	static sc_exchange_fee_list parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_exchange_fee_list.Builder builder = sc_exchange_fee_list.newBuilder();

		while (nextFieldNumber > 0) {
			if(!populateBuilderWithField(reader, builder, nextFieldNumber)) {
				reader.getPreviousTagDataTypeAndReadContent();
			}
			nextFieldNumber = getNextFieldNumber(reader);
		}

		return builder.build();
	}

	static int getNextFieldNumber(final InputReader reader) throws IOException {
		return reader.getNextFieldNumber();
	}

	static boolean populateBuilderWithField(final InputReader reader, final Builder builder, final int fieldNumber) throws IOException {
		boolean fieldFound = true;
		switch (fieldNumber) {
			case fieldNumberSt_fee_list:
			 java.util.Vector vcSt_fee_list = reader.readMessages(fieldNumberSt_fee_list);
				for(int i = 0 ; i < vcSt_fee_list.size(); i++) {
					byte[] eachBinData = (byte[]) vcSt_fee_list.elementAt(i);
					st_fee.Builder builderSt_fee_list = st_fee.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolSt_fee_list = true;
					int nestedFieldSt_fee_list = -1;
					while(boolSt_fee_list) {
						nestedFieldSt_fee_list = getNextFieldNumber(innerInputReader);
						boolSt_fee_list = st_fee.populateBuilderWithField(innerInputReader, builderSt_fee_list, nestedFieldSt_fee_list);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementSt_fee_list(builderSt_fee_list.build());
				}
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_exchange_fee_list.unknownTagHandler = unknownTagHandler;
	}

	public static sc_exchange_fee_list parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_exchange_fee_list parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_exchange_fee_list parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}