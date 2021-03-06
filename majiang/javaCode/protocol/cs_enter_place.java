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

public final class cs_enter_place extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final String place_id;
	private static final int fieldNumberPlace_id = 1;
	private final boolean hasPlace_id;

	private final String usr_key;
	private static final int fieldNumberUsr_key = 2;
	private final boolean hasUsr_key;


	public static Builder newBuilder() {
		return new Builder();
	}

	private cs_enter_place(final Builder builder) {
			this.place_id = builder.place_id;
			this.hasPlace_id = builder.hasPlace_id;
			this.usr_key = builder.usr_key;
			this.hasUsr_key = builder.hasUsr_key;
			}

	public static class Builder {
		private String place_id;
		private boolean hasPlace_id = false;

		private String usr_key;
		private boolean hasUsr_key = false;


		private Builder() {
		}

		public Builder setPlace_id(final String place_id) {
			this.place_id = place_id;
			this.hasPlace_id = true;
			return this;
		}

		public Builder setUsr_key(final String usr_key) {
			this.usr_key = usr_key;
			this.hasUsr_key = true;
			return this;
		}

		public cs_enter_place build() {
			return new cs_enter_place(this);
		}
	}

	public String getPlace_id() {
		return place_id;
	}

	public boolean hasPlace_id() {
		return hasPlace_id;
	}

	public String getUsr_key() {
		return usr_key;
	}

	public boolean hasUsr_key() {
		return hasUsr_key;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasPlace_id) retValue += "place_id = " + this.place_id + TAB;
		if(hasUsr_key) retValue += "usr_key = " + this.usr_key + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasPlace_id) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberPlace_id, place_id);
		if(hasUsr_key) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberUsr_key, usr_key);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasPlace_id) writer.writeString(fieldNumberPlace_id, place_id);
		if(hasUsr_key) writer.writeString(fieldNumberUsr_key, usr_key);
	}

	static cs_enter_place parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final cs_enter_place.Builder builder = cs_enter_place.newBuilder();

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
			case fieldNumberPlace_id:
				builder.setPlace_id(reader.readString(fieldNumber));
				break;
			case fieldNumberUsr_key:
				builder.setUsr_key(reader.readString(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		cs_enter_place.unknownTagHandler = unknownTagHandler;
	}

	public static cs_enter_place parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static cs_enter_place parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static cs_enter_place parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}