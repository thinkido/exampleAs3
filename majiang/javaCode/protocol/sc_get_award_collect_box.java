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

public final class sc_get_award_collect_box extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int result;
	private static final int fieldNumberResult = 1;
	private final boolean hasResult;

	private final String tips;
	private static final int fieldNumberTips = 2;
	private final boolean hasTips;

	private final int score;
	private static final int fieldNumberScore = 3;
	private final boolean hasScore;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_get_award_collect_box(final Builder builder) {
			this.result = builder.result;
			this.hasResult = builder.hasResult;
			this.tips = builder.tips;
			this.hasTips = builder.hasTips;
			this.score = builder.score;
			this.hasScore = builder.hasScore;
			}

	public static class Builder {
		private int result;
		private boolean hasResult = false;

		private String tips;
		private boolean hasTips = false;

		private int score;
		private boolean hasScore = false;


		private Builder() {
		}

		public Builder setResult(final int result) {
			this.result = result;
			this.hasResult = true;
			return this;
		}

		public Builder setTips(final String tips) {
			this.tips = tips;
			this.hasTips = true;
			return this;
		}

		public Builder setScore(final int score) {
			this.score = score;
			this.hasScore = true;
			return this;
		}

		public sc_get_award_collect_box build() {
			return new sc_get_award_collect_box(this);
		}
	}

	public int getResult() {
		return result;
	}

	public boolean hasResult() {
		return hasResult;
	}

	public String getTips() {
		return tips;
	}

	public boolean hasTips() {
		return hasTips;
	}

	public int getScore() {
		return score;
	}

	public boolean hasScore() {
		return hasScore;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasResult) retValue += "result = " + this.result + TAB;
		if(hasTips) retValue += "tips = " + this.tips + TAB;
		if(hasScore) retValue += "score = " + this.score + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasResult) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberResult, result);
		if(hasTips) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberTips, tips);
		if(hasScore) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberScore, score);
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
		if(hasTips) writer.writeString(fieldNumberTips, tips);
		if(hasScore) writer.writeInt(fieldNumberScore, score);
	}

	static sc_get_award_collect_box parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_get_award_collect_box.Builder builder = sc_get_award_collect_box.newBuilder();

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
			case fieldNumberTips:
				builder.setTips(reader.readString(fieldNumber));
				break;
			case fieldNumberScore:
				builder.setScore(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_get_award_collect_box.unknownTagHandler = unknownTagHandler;
	}

	public static sc_get_award_collect_box parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_get_award_collect_box parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_get_award_collect_box parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}