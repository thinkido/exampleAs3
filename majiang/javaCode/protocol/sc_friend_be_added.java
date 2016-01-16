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

public final class sc_friend_be_added extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final java.util.Vector lists;
	private static final int fieldNumberLists = 1;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_friend_be_added(final Builder builder) {
			this.lists = builder.lists;
			}

	public static class Builder {
		private java.util.Vector lists = new java.util.Vector();
		private boolean hasLists = false;


		private Builder() {
		}

		public Builder setLists(final java.util.Vector lists) {
			if(!hasLists) {
				hasLists = true;
			}
			this.lists = lists;
			return this;
		}


		public Builder addElementLists(final st_friend_be_added element) {
			if(!hasLists) {
				hasLists = true;
			}
			lists.addElement(element);
			return this;
		}

		public sc_friend_be_added build() {
			return new sc_friend_be_added(this);
		}
	}

	public java.util.Vector getLists() {
		return lists;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		retValue += "lists = " + this.lists + TAB;
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
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberLists, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, lists);

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		writer.writeList(fieldNumberLists, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, lists);
	}

	static sc_friend_be_added parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_friend_be_added.Builder builder = sc_friend_be_added.newBuilder();

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
			case fieldNumberLists:
			 java.util.Vector vcLists = reader.readMessages(fieldNumberLists);
				for(int i = 0 ; i < vcLists.size(); i++) {
					byte[] eachBinData = (byte[]) vcLists.elementAt(i);
					st_friend_be_added.Builder builderLists = st_friend_be_added.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolLists = true;
					int nestedFieldLists = -1;
					while(boolLists) {
						nestedFieldLists = getNextFieldNumber(innerInputReader);
						boolLists = st_friend_be_added.populateBuilderWithField(innerInputReader, builderLists, nestedFieldLists);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementLists(builderLists.build());
				}
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_friend_be_added.unknownTagHandler = unknownTagHandler;
	}

	public static sc_friend_be_added parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_friend_be_added parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_friend_be_added parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}