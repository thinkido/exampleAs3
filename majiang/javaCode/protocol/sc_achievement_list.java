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

public final class sc_achievement_list extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final java.util.Vector list;
	private static final int fieldNumberList = 1;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_achievement_list(final Builder builder) {
			this.list = builder.list;
			}

	public static class Builder {
		private java.util.Vector list = new java.util.Vector();
		private boolean hasList = false;


		private Builder() {
		}

		public Builder setList(final java.util.Vector list) {
			if(!hasList) {
				hasList = true;
			}
			this.list = list;
			return this;
		}


		public Builder addElementList(final st_achievement element) {
			if(!hasList) {
				hasList = true;
			}
			list.addElement(element);
			return this;
		}

		public sc_achievement_list build() {
			return new sc_achievement_list(this);
		}
	}

	public java.util.Vector getList() {
		return list;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		retValue += "list = " + this.list + TAB;
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
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberList, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, list);

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		writer.writeList(fieldNumberList, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, list);
	}

	static sc_achievement_list parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_achievement_list.Builder builder = sc_achievement_list.newBuilder();

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
			case fieldNumberList:
			 java.util.Vector vcList = reader.readMessages(fieldNumberList);
				for(int i = 0 ; i < vcList.size(); i++) {
					byte[] eachBinData = (byte[]) vcList.elementAt(i);
					st_achievement.Builder builderList = st_achievement.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolList = true;
					int nestedFieldList = -1;
					while(boolList) {
						nestedFieldList = getNextFieldNumber(innerInputReader);
						boolList = st_achievement.populateBuilderWithField(innerInputReader, builderList, nestedFieldList);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementList(builderList.build());
				}
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_achievement_list.unknownTagHandler = unknownTagHandler;
	}

	public static sc_achievement_list parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_achievement_list parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_achievement_list parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}