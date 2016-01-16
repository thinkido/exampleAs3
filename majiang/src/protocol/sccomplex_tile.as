package protocol;
// Generated by proto2javame, Sat Jan 09 02:23:17 CST 2016.

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

public final class sccomplex_tile extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int type;
	private static final int fieldNumberType = 1;
	private final boolean hasType;

	private final int id;
	private static final int fieldNumberId = 2;
	private final boolean hasId;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sccomplex_tile(final Builder builder) {
			this.type = builder.type;
			this.hasType = builder.hasType;
			this.id = builder.id;
			this.hasId = builder.hasId;
			}

	public static class Builder {
		private int type;
		private boolean hasType = false;

		private int id;
		private boolean hasId = false;


		private Builder() {
		}

		public Builder setType(final int type) {
			this.type = type;
			this.hasType = true;
			return this;
		}

		public Builder setId(final int id) {
			this.id = id;
			this.hasId = true;
			return this;
		}

		public sccomplex_tile build() {
			return new sccomplex_tile(this);
		}
	}

	public int getType() {
		return type;
	}

	public boolean hasType() {
		return hasType;
	}

	public int getId() {
		return id;
	}

	public boolean hasId() {
		return hasId;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasType) retValue += "type = " + this.type + TAB;
		if(hasId) retValue += "id = " + this.id + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasType) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberType, type);
		if(hasId) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberId, id);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasType) writer.writeInt(fieldNumberType, type);
		if(hasId) writer.writeInt(fieldNumberId, id);
	}

	static sccomplex_tile parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sccomplex_tile.Builder builder = sccomplex_tile.newBuilder();

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
			case fieldNumberType:
				builder.setType(reader.readInt(fieldNumber));
				break;
			case fieldNumberId:
				builder.setId(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sccomplex_tile.unknownTagHandler = unknownTagHandler;
	}

	public static sccomplex_tile parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sccomplex_tile parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sccomplex_tile parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}