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

public final class cs_minigame_01_choose extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final boolean big;
	private static final int fieldNumberBig = 1;
	private final boolean hasBig;


	public static Builder newBuilder() {
		return new Builder();
	}

	private cs_minigame_01_choose(final Builder builder) {
			this.big = builder.big;
			this.hasBig = builder.hasBig;
			}

	public static class Builder {
		private boolean big;
		private boolean hasBig = false;


		private Builder() {
		}

		public Builder setBig(final boolean big) {
			this.big = big;
			this.hasBig = true;
			return this;
		}

		public cs_minigame_01_choose build() {
			return new cs_minigame_01_choose(this);
		}
	}

	public boolean getBig() {
		return big;
	}

	public boolean hasBig() {
		return hasBig;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasBig) retValue += "big = " + this.big + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasBig) totalSize += ComputeSizeUtil.computeBooleanSize(fieldNumberBig, big);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasBig) writer.writeBoolean(fieldNumberBig, big);
	}

	static cs_minigame_01_choose parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final cs_minigame_01_choose.Builder builder = cs_minigame_01_choose.newBuilder();

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
			case fieldNumberBig:
				builder.setBig(reader.readBoolean(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		cs_minigame_01_choose.unknownTagHandler = unknownTagHandler;
	}

	public static cs_minigame_01_choose parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static cs_minigame_01_choose parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static cs_minigame_01_choose parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}