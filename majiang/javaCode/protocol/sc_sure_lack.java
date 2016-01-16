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

public final class sc_sure_lack extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int timeout;
	private static final int fieldNumberTimeout = 2;
	private final boolean hasTimeout;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_sure_lack(final Builder builder) {
			this.timeout = builder.timeout;
			this.hasTimeout = builder.hasTimeout;
			}

	public static class Builder {
		private int timeout;
		private boolean hasTimeout = false;


		private Builder() {
		}

		public Builder setTimeout(final int timeout) {
			this.timeout = timeout;
			this.hasTimeout = true;
			return this;
		}

		public sc_sure_lack build() {
			return new sc_sure_lack(this);
		}
	}

	public int getTimeout() {
		return timeout;
	}

	public boolean hasTimeout() {
		return hasTimeout;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasTimeout) retValue += "timeout = " + this.timeout + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasTimeout) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberTimeout, timeout);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasTimeout) writer.writeInt(fieldNumberTimeout, timeout);
	}

	static sc_sure_lack parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_sure_lack.Builder builder = sc_sure_lack.newBuilder();

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
			case fieldNumberTimeout:
				builder.setTimeout(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_sure_lack.unknownTagHandler = unknownTagHandler;
	}

	public static sc_sure_lack parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_sure_lack parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_sure_lack parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}