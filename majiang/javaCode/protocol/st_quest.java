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

public final class st_quest extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int id;
	private static final int fieldNumberId = 1;
	private final boolean hasId;

	private final boolean complete;
	private static final int fieldNumberComplete = 2;
	private final boolean hasComplete;

	private final int count;
	private static final int fieldNumberCount = 3;
	private final boolean hasCount;

	private final boolean fetched;
	private static final int fieldNumberFetched = 4;
	private final boolean hasFetched;


	public static Builder newBuilder() {
		return new Builder();
	}

	private st_quest(final Builder builder) {
			this.id = builder.id;
			this.hasId = builder.hasId;
			this.complete = builder.complete;
			this.hasComplete = builder.hasComplete;
			this.count = builder.count;
			this.hasCount = builder.hasCount;
			this.fetched = builder.fetched;
			this.hasFetched = builder.hasFetched;
			}

	public static class Builder {
		private int id;
		private boolean hasId = false;

		private boolean complete;
		private boolean hasComplete = false;

		private int count;
		private boolean hasCount = false;

		private boolean fetched;
		private boolean hasFetched = false;


		private Builder() {
		}

		public Builder setId(final int id) {
			this.id = id;
			this.hasId = true;
			return this;
		}

		public Builder setComplete(final boolean complete) {
			this.complete = complete;
			this.hasComplete = true;
			return this;
		}

		public Builder setCount(final int count) {
			this.count = count;
			this.hasCount = true;
			return this;
		}

		public Builder setFetched(final boolean fetched) {
			this.fetched = fetched;
			this.hasFetched = true;
			return this;
		}

		public st_quest build() {
			return new st_quest(this);
		}
	}

	public int getId() {
		return id;
	}

	public boolean hasId() {
		return hasId;
	}

	public boolean getComplete() {
		return complete;
	}

	public boolean hasComplete() {
		return hasComplete;
	}

	public int getCount() {
		return count;
	}

	public boolean hasCount() {
		return hasCount;
	}

	public boolean getFetched() {
		return fetched;
	}

	public boolean hasFetched() {
		return hasFetched;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasId) retValue += "id = " + this.id + TAB;
		if(hasComplete) retValue += "complete = " + this.complete + TAB;
		if(hasCount) retValue += "count = " + this.count + TAB;
		if(hasFetched) retValue += "fetched = " + this.fetched + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasId) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberId, id);
		if(hasComplete) totalSize += ComputeSizeUtil.computeBooleanSize(fieldNumberComplete, complete);
		if(hasCount) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberCount, count);
		if(hasFetched) totalSize += ComputeSizeUtil.computeBooleanSize(fieldNumberFetched, fetched);
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
		if(hasComplete) writer.writeBoolean(fieldNumberComplete, complete);
		if(hasCount) writer.writeInt(fieldNumberCount, count);
		if(hasFetched) writer.writeBoolean(fieldNumberFetched, fetched);
	}

	static st_quest parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final st_quest.Builder builder = st_quest.newBuilder();

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
			case fieldNumberComplete:
				builder.setComplete(reader.readBoolean(fieldNumber));
				break;
			case fieldNumberCount:
				builder.setCount(reader.readInt(fieldNumber));
				break;
			case fieldNumberFetched:
				builder.setFetched(reader.readBoolean(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		st_quest.unknownTagHandler = unknownTagHandler;
	}

	public static st_quest parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static st_quest parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static st_quest parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}