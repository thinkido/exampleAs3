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

public final class protocol extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int id;
	private static final int fieldNumberId = 1;
	private final boolean hasId;

	private final net.jarlehansen.protobuf.javame.ByteString content;
	private static final int fieldNumberContent = 2;
	private final boolean hasContent;


	public static Builder newBuilder() {
		return new Builder();
	}

	private protocol(final Builder builder) {
			this.id = builder.id;
			this.hasId = builder.hasId;
			this.content = builder.content;
			this.hasContent = builder.hasContent;
			}

	public static class Builder {
		private int id;
		private boolean hasId = false;

		private net.jarlehansen.protobuf.javame.ByteString content;
		private boolean hasContent = false;


		private Builder() {
		}

		public Builder setId(final int id) {
			this.id = id;
			this.hasId = true;
			return this;
		}

		public Builder setContent(final net.jarlehansen.protobuf.javame.ByteString content) {
			this.content = content;
			this.hasContent = true;
			return this;
		}

		public protocol build() {
			return new protocol(this);
		}
	}

	public int getId() {
		return id;
	}

	public boolean hasId() {
		return hasId;
	}

	public net.jarlehansen.protobuf.javame.ByteString getContent() {
		return content;
	}

	public boolean hasContent() {
		return hasContent;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasId) retValue += "id = " + this.id + TAB;
		if(hasContent) retValue += "content = " + this.content + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasId) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberId, id);
		if(hasContent) totalSize += ComputeSizeUtil.computeByteStringSize(fieldNumberContent, content);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasId) writer.writeInt(fieldNumberId, id);
		if(hasContent) writer.writeByteString(fieldNumberContent, content);
	}

	static protocol parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final protocol.Builder builder = protocol.newBuilder();

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
			case fieldNumberId:
				builder.setId(reader.readInt(fieldNumber));
				break;
			case fieldNumberContent:
				builder.setContent(reader.readByteString(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		protocol.unknownTagHandler = unknownTagHandler;
	}

	public static protocol parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static protocol parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static protocol parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}