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

public final class sc_send_online_gift extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int result;
	private static final int fieldNumberResult = 1;
	private final boolean hasResult;

	private final long gold;
	private static final int fieldNumberGold = 2;
	private final boolean hasGold;

	private final long diamond;
	private static final int fieldNumberDiamond = 3;
	private final boolean hasDiamond;

	private final int time;
	private static final int fieldNumberTime = 4;
	private final boolean hasTime;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_send_online_gift(final Builder builder) {
			this.result = builder.result;
			this.hasResult = builder.hasResult;
			this.gold = builder.gold;
			this.hasGold = builder.hasGold;
			this.diamond = builder.diamond;
			this.hasDiamond = builder.hasDiamond;
			this.time = builder.time;
			this.hasTime = builder.hasTime;
			}

	public static class Builder {
		private int result;
		private boolean hasResult = false;

		private long gold;
		private boolean hasGold = false;

		private long diamond;
		private boolean hasDiamond = false;

		private int time;
		private boolean hasTime = false;


		private Builder() {
		}

		public Builder setResult(final int result) {
			this.result = result;
			this.hasResult = true;
			return this;
		}

		public Builder setGold(final long gold) {
			this.gold = gold;
			this.hasGold = true;
			return this;
		}

		public Builder setDiamond(final long diamond) {
			this.diamond = diamond;
			this.hasDiamond = true;
			return this;
		}

		public Builder setTime(final int time) {
			this.time = time;
			this.hasTime = true;
			return this;
		}

		public sc_send_online_gift build() {
			return new sc_send_online_gift(this);
		}
	}

	public int getResult() {
		return result;
	}

	public boolean hasResult() {
		return hasResult;
	}

	public long getGold() {
		return gold;
	}

	public boolean hasGold() {
		return hasGold;
	}

	public long getDiamond() {
		return diamond;
	}

	public boolean hasDiamond() {
		return hasDiamond;
	}

	public int getTime() {
		return time;
	}

	public boolean hasTime() {
		return hasTime;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasResult) retValue += "result = " + this.result + TAB;
		if(hasGold) retValue += "gold = " + this.gold + TAB;
		if(hasDiamond) retValue += "diamond = " + this.diamond + TAB;
		if(hasTime) retValue += "time = " + this.time + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasResult) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberResult, result);
		if(hasGold) totalSize += ComputeSizeUtil.computeLongSize(fieldNumberGold, gold);
		if(hasDiamond) totalSize += ComputeSizeUtil.computeLongSize(fieldNumberDiamond, diamond);
		if(hasTime) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberTime, time);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasResult) writer.writeInt(fieldNumberResult, result);
		if(hasGold) writer.writeLong(fieldNumberGold, gold);
		if(hasDiamond) writer.writeLong(fieldNumberDiamond, diamond);
		if(hasTime) writer.writeInt(fieldNumberTime, time);
	}

	static sc_send_online_gift parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_send_online_gift.Builder builder = sc_send_online_gift.newBuilder();

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
			case fieldNumberResult:
				builder.setResult(reader.readInt(fieldNumber));
				break;
			case fieldNumberGold:
				builder.setGold(reader.readLong(fieldNumber));
				break;
			case fieldNumberDiamond:
				builder.setDiamond(reader.readLong(fieldNumber));
				break;
			case fieldNumberTime:
				builder.setTime(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_send_online_gift.unknownTagHandler = unknownTagHandler;
	}

	public static sc_send_online_gift parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_send_online_gift parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_send_online_gift parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}