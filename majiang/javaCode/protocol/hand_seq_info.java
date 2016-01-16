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

public final class hand_seq_info extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int seat_index;
	private static final int fieldNumberSeat_index = 1;
	private final boolean hasSeat_index;

	private final st_hand_seq hand_seq;
	private static final int fieldNumberHand_seq = 2;
	private final boolean hasHand_seq;


	public static Builder newBuilder() {
		return new Builder();
	}

	private hand_seq_info(final Builder builder) {
			this.seat_index = builder.seat_index;
			this.hasSeat_index = builder.hasSeat_index;
			this.hand_seq = builder.hand_seq;
			this.hasHand_seq = builder.hasHand_seq;
			}

	public static class Builder {
		private int seat_index;
		private boolean hasSeat_index = false;

		private st_hand_seq hand_seq;
		private boolean hasHand_seq = false;


		private Builder() {
		}

		public Builder setSeat_index(final int seat_index) {
			this.seat_index = seat_index;
			this.hasSeat_index = true;
			return this;
		}

		public Builder setHand_seq(final st_hand_seq hand_seq) {
			this.hand_seq = hand_seq;
			this.hasHand_seq = true;
			return this;
		}

		public hand_seq_info build() {
			return new hand_seq_info(this);
		}
	}

	public int getSeat_index() {
		return seat_index;
	}

	public boolean hasSeat_index() {
		return hasSeat_index;
	}

	public st_hand_seq getHand_seq() {
		return hand_seq;
	}

	public boolean hasHand_seq() {
		return hasHand_seq;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasSeat_index) retValue += "seat_index = " + this.seat_index + TAB;
		if(hasHand_seq) retValue += "hand_seq = " + this.hand_seq + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasSeat_index) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberSeat_index, seat_index);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;
		if(hasHand_seq) messageSize += ComputeSizeUtil.computeMessageSize(fieldNumberHand_seq, hand_seq.computeSize());

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasSeat_index) writer.writeInt(fieldNumberSeat_index, seat_index);
		if(hasHand_seq) { writer.writeMessage(fieldNumberHand_seq, hand_seq.computeSize()); hand_seq.writeFields(writer); }
	}

	static hand_seq_info parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final hand_seq_info.Builder builder = hand_seq_info.newBuilder();

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
			case fieldNumberSeat_index:
				builder.setSeat_index(reader.readInt(fieldNumber));
				break;
			case fieldNumberHand_seq:
			 java.util.Vector vcHand_seq = reader.readMessages(fieldNumberHand_seq);
				for(int i = 0 ; i < vcHand_seq.size(); i++) {
					byte[] eachBinData = (byte[]) vcHand_seq.elementAt(i);
					st_hand_seq.Builder builderHand_seq = st_hand_seq.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolHand_seq = true;
					int nestedFieldHand_seq = -1;
					while(boolHand_seq) {
						nestedFieldHand_seq = getNextFieldNumber(innerInputReader);
						boolHand_seq = st_hand_seq.populateBuilderWithField(innerInputReader, builderHand_seq, nestedFieldHand_seq);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.setHand_seq(builderHand_seq.build());
				}
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		hand_seq_info.unknownTagHandler = unknownTagHandler;
	}

	public static hand_seq_info parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static hand_seq_info parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static hand_seq_info parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}