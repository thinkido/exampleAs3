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

public final class sc_gold_reset extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int gold;
	private static final int fieldNumberGold = 1;
	private final boolean hasGold;

	private final int total;
	private static final int fieldNumberTotal = 2;
	private final boolean hasTotal;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_gold_reset(final Builder builder) {
			this.gold = builder.gold;
			this.hasGold = builder.hasGold;
			this.total = builder.total;
			this.hasTotal = builder.hasTotal;
			}

	public static class Builder {
		private int gold;
		private boolean hasGold = false;

		private int total;
		private boolean hasTotal = false;


		private Builder() {
		}

		public Builder setGold(final int gold) {
			this.gold = gold;
			this.hasGold = true;
			return this;
		}

		public Builder setTotal(final int total) {
			this.total = total;
			this.hasTotal = true;
			return this;
		}

		public sc_gold_reset build() {
			return new sc_gold_reset(this);
		}
	}

	public int getGold() {
		return gold;
	}

	public boolean hasGold() {
		return hasGold;
	}

	public int getTotal() {
		return total;
	}

	public boolean hasTotal() {
		return hasTotal;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasGold) retValue += "gold = " + this.gold + TAB;
		if(hasTotal) retValue += "total = " + this.total + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasGold) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberGold, gold);
		if(hasTotal) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberTotal, total);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasGold) writer.writeInt(fieldNumberGold, gold);
		if(hasTotal) writer.writeInt(fieldNumberTotal, total);
	}

	static sc_gold_reset parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_gold_reset.Builder builder = sc_gold_reset.newBuilder();

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
			case fieldNumberGold:
				builder.setGold(reader.readInt(fieldNumber));
				break;
			case fieldNumberTotal:
				builder.setTotal(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_gold_reset.unknownTagHandler = unknownTagHandler;
	}

	public static sc_gold_reset parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_gold_reset parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_gold_reset parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}