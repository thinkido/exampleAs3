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

public final class cs_exchange_fee extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int fee_id;
	private static final int fieldNumberFee_id = 1;
	private final boolean hasFee_id;

	private final String phone_number;
	private static final int fieldNumberPhone_number = 2;
	private final boolean hasPhone_number;


	public static Builder newBuilder() {
		return new Builder();
	}

	private cs_exchange_fee(final Builder builder) {
			this.fee_id = builder.fee_id;
			this.hasFee_id = builder.hasFee_id;
			this.phone_number = builder.phone_number;
			this.hasPhone_number = builder.hasPhone_number;
			}

	public static class Builder {
		private int fee_id;
		private boolean hasFee_id = false;

		private String phone_number;
		private boolean hasPhone_number = false;


		private Builder() {
		}

		public Builder setFee_id(final int fee_id) {
			this.fee_id = fee_id;
			this.hasFee_id = true;
			return this;
		}

		public Builder setPhone_number(final String phone_number) {
			this.phone_number = phone_number;
			this.hasPhone_number = true;
			return this;
		}

		public cs_exchange_fee build() {
			return new cs_exchange_fee(this);
		}
	}

	public int getFee_id() {
		return fee_id;
	}

	public boolean hasFee_id() {
		return hasFee_id;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public boolean hasPhone_number() {
		return hasPhone_number;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasFee_id) retValue += "fee_id = " + this.fee_id + TAB;
		if(hasPhone_number) retValue += "phone_number = " + this.phone_number + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasFee_id) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberFee_id, fee_id);
		if(hasPhone_number) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberPhone_number, phone_number);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasFee_id) writer.writeInt(fieldNumberFee_id, fee_id);
		if(hasPhone_number) writer.writeString(fieldNumberPhone_number, phone_number);
	}

	static cs_exchange_fee parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final cs_exchange_fee.Builder builder = cs_exchange_fee.newBuilder();

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
			case fieldNumberFee_id:
				builder.setFee_id(reader.readInt(fieldNumber));
				break;
			case fieldNumberPhone_number:
				builder.setPhone_number(reader.readString(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		cs_exchange_fee.unknownTagHandler = unknownTagHandler;
	}

	public static cs_exchange_fee parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static cs_exchange_fee parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static cs_exchange_fee parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}