package protocol;
// Generated by proto2javame, Sat Jan 09 02:23:16 CST 2016.

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

public final class t_duration extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int begin;
	private static final int fieldNumberBegin = 1;
	private final boolean hasBegin;

	private final int end;
	private static final int fieldNumberEnd = 2;
	private final boolean hasEnd;


	public static Builder newBuilder() {
		return new Builder();
	}

	private t_duration(final Builder builder) {
			this.begin = builder.begin;
			this.hasBegin = builder.hasBegin;
			this.end = builder.end;
			this.hasEnd = builder.hasEnd;
			}

	public static class Builder {
		private int begin;
		private boolean hasBegin = false;

		private int end;
		private boolean hasEnd = false;


		private Builder() {
		}

		public Builder setBegin(final int begin) {
			this.begin = begin;
			this.hasBegin = true;
			return this;
		}

		public Builder setEnd(final int end) {
			this.end = end;
			this.hasEnd = true;
			return this;
		}

		public t_duration build() {
			return new t_duration(this);
		}
	}

	public int getBegin() {
		return begin;
	}

	public boolean hasBegin() {
		return hasBegin;
	}

	public int getEnd() {
		return end;
	}

	public boolean hasEnd() {
		return hasEnd;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasBegin) retValue += "begin = " + this.begin + TAB;
		if(hasEnd) retValue += "end = " + this.end + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasBegin) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberBegin, begin);
		if(hasEnd) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberEnd, end);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasBegin) writer.writeInt(fieldNumberBegin, begin);
		if(hasEnd) writer.writeInt(fieldNumberEnd, end);
	}

	static t_duration parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final t_duration.Builder builder = t_duration.newBuilder();

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
			case fieldNumberBegin:
				builder.setBegin(reader.readInt(fieldNumber));
				break;
			case fieldNumberEnd:
				builder.setEnd(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		t_duration.unknownTagHandler = unknownTagHandler;
	}

	public static t_duration parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static t_duration parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static t_duration parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}