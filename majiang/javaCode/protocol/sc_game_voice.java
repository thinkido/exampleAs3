package protocol;
// Generated by proto2javame, Wed Jan 13 00:12:47 CST 2016.

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

public final class sc_game_voice extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int seat_index;
	private static final int fieldNumberSeat_index = 1;
	private final boolean hasSeat_index;

	private final net.jarlehansen.protobuf.javame.ByteString data;
	private static final int fieldNumberData = 2;
	private final boolean hasData;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_game_voice(final Builder builder) {
			this.seat_index = builder.seat_index;
			this.hasSeat_index = builder.hasSeat_index;
			this.data = builder.data;
			this.hasData = builder.hasData;
			}

	public static class Builder {
		private int seat_index;
		private boolean hasSeat_index = false;

		private net.jarlehansen.protobuf.javame.ByteString data;
		private boolean hasData = false;


		private Builder() {
		}

		public Builder setSeat_index(final int seat_index) {
			this.seat_index = seat_index;
			this.hasSeat_index = true;
			return this;
		}

		public Builder setData(final net.jarlehansen.protobuf.javame.ByteString data) {
			this.data = data;
			this.hasData = true;
			return this;
		}

		public sc_game_voice build() {
			return new sc_game_voice(this);
		}
	}

	public int getSeat_index() {
		return seat_index;
	}

	public boolean hasSeat_index() {
		return hasSeat_index;
	}

	public net.jarlehansen.protobuf.javame.ByteString getData() {
		return data;
	}

	public boolean hasData() {
		return hasData;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasSeat_index) retValue += "seat_index = " + this.seat_index + TAB;
		if(hasData) retValue += "data = " + this.data + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasSeat_index) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberSeat_index, seat_index);
		if(hasData) totalSize += ComputeSizeUtil.computeByteStringSize(fieldNumberData, data);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasSeat_index) writer.writeInt(fieldNumberSeat_index, seat_index);
		if(hasData) writer.writeByteString(fieldNumberData, data);
	}

	static sc_game_voice parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_game_voice.Builder builder = sc_game_voice.newBuilder();

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
			case fieldNumberSeat_index:
				builder.setSeat_index(reader.readInt(fieldNumber));
				break;
			case fieldNumberData:
				builder.setData(reader.readByteString(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_game_voice.unknownTagHandler = unknownTagHandler;
	}

	public static sc_game_voice parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_game_voice parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_game_voice parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}