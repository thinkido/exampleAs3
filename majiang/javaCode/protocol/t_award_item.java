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

public final class t_award_item extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int award_id;
	private static final int fieldNumberAward_id = 1;
	private final boolean hasAward_id;

	private final String award_desc;
	private static final int fieldNumberAward_desc = 2;
	private final boolean hasAward_desc;

	private final boolean award_available;
	private static final int fieldNumberAward_available = 3;
	private final boolean hasAward_available;


	public static Builder newBuilder() {
		return new Builder();
	}

	private t_award_item(final Builder builder) {
			this.award_id = builder.award_id;
			this.hasAward_id = builder.hasAward_id;
			this.award_desc = builder.award_desc;
			this.hasAward_desc = builder.hasAward_desc;
			this.award_available = builder.award_available;
			this.hasAward_available = builder.hasAward_available;
			}

	public static class Builder {
		private int award_id;
		private boolean hasAward_id = false;

		private String award_desc;
		private boolean hasAward_desc = false;

		private boolean award_available;
		private boolean hasAward_available = false;


		private Builder() {
		}

		public Builder setAward_id(final int award_id) {
			this.award_id = award_id;
			this.hasAward_id = true;
			return this;
		}

		public Builder setAward_desc(final String award_desc) {
			this.award_desc = award_desc;
			this.hasAward_desc = true;
			return this;
		}

		public Builder setAward_available(final boolean award_available) {
			this.award_available = award_available;
			this.hasAward_available = true;
			return this;
		}

		public t_award_item build() {
			return new t_award_item(this);
		}
	}

	public int getAward_id() {
		return award_id;
	}

	public boolean hasAward_id() {
		return hasAward_id;
	}

	public String getAward_desc() {
		return award_desc;
	}

	public boolean hasAward_desc() {
		return hasAward_desc;
	}

	public boolean getAward_available() {
		return award_available;
	}

	public boolean hasAward_available() {
		return hasAward_available;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasAward_id) retValue += "award_id = " + this.award_id + TAB;
		if(hasAward_desc) retValue += "award_desc = " + this.award_desc + TAB;
		if(hasAward_available) retValue += "award_available = " + this.award_available + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasAward_id) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberAward_id, award_id);
		if(hasAward_desc) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberAward_desc, award_desc);
		if(hasAward_available) totalSize += ComputeSizeUtil.computeBooleanSize(fieldNumberAward_available, award_available);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasAward_id) writer.writeInt(fieldNumberAward_id, award_id);
		if(hasAward_desc) writer.writeString(fieldNumberAward_desc, award_desc);
		if(hasAward_available) writer.writeBoolean(fieldNumberAward_available, award_available);
	}

	static t_award_item parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final t_award_item.Builder builder = t_award_item.newBuilder();

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
			case fieldNumberAward_id:
				builder.setAward_id(reader.readInt(fieldNumber));
				break;
			case fieldNumberAward_desc:
				builder.setAward_desc(reader.readString(fieldNumber));
				break;
			case fieldNumberAward_available:
				builder.setAward_available(reader.readBoolean(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		t_award_item.unknownTagHandler = unknownTagHandler;
	}

	public static t_award_item parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static t_award_item parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static t_award_item parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}