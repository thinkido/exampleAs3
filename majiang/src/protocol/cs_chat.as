package protocol;
// Generated by proto2javame, Sat Jan 09 02:23:17 CST 2016.

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

public final class cs_chat extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int seat_index;
	private static final int fieldNumberSeat_index = 1;
	private final boolean hasSeat_index;

	private final String name;
	private static final int fieldNumberName = 2;
	private final boolean hasName;

	private final String id;
	private static final int fieldNumberId = 3;
	private final boolean hasId;

	private final String idtype;
	private static final int fieldNumberIdtype = 4;
	private final boolean hasIdtype;

	private final String msg;
	private static final int fieldNumberMsg = 5;
	private final boolean hasMsg;


	public static Builder newBuilder() {
		return new Builder();
	}

	private cs_chat(final Builder builder) {
			this.seat_index = builder.seat_index;
			this.hasSeat_index = builder.hasSeat_index;
			this.name = builder.name;
			this.hasName = builder.hasName;
			this.id = builder.id;
			this.hasId = builder.hasId;
			this.idtype = builder.idtype;
			this.hasIdtype = builder.hasIdtype;
			this.msg = builder.msg;
			this.hasMsg = builder.hasMsg;
			}

	public static class Builder {
		private int seat_index;
		private boolean hasSeat_index = false;

		private String name;
		private boolean hasName = false;

		private String id;
		private boolean hasId = false;

		private String idtype;
		private boolean hasIdtype = false;

		private String msg;
		private boolean hasMsg = false;


		private Builder() {
		}

		public Builder setSeat_index(final int seat_index) {
			this.seat_index = seat_index;
			this.hasSeat_index = true;
			return this;
		}

		public Builder setName(final String name) {
			this.name = name;
			this.hasName = true;
			return this;
		}

		public Builder setId(final String id) {
			this.id = id;
			this.hasId = true;
			return this;
		}

		public Builder setIdtype(final String idtype) {
			this.idtype = idtype;
			this.hasIdtype = true;
			return this;
		}

		public Builder setMsg(final String msg) {
			this.msg = msg;
			this.hasMsg = true;
			return this;
		}

		public cs_chat build() {
			return new cs_chat(this);
		}
	}

	public int getSeat_index() {
		return seat_index;
	}

	public boolean hasSeat_index() {
		return hasSeat_index;
	}

	public String getName() {
		return name;
	}

	public boolean hasName() {
		return hasName;
	}

	public String getId() {
		return id;
	}

	public boolean hasId() {
		return hasId;
	}

	public String getIdtype() {
		return idtype;
	}

	public boolean hasIdtype() {
		return hasIdtype;
	}

	public String getMsg() {
		return msg;
	}

	public boolean hasMsg() {
		return hasMsg;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasSeat_index) retValue += "seat_index = " + this.seat_index + TAB;
		if(hasName) retValue += "name = " + this.name + TAB;
		if(hasId) retValue += "id = " + this.id + TAB;
		if(hasIdtype) retValue += "idtype = " + this.idtype + TAB;
		if(hasMsg) retValue += "msg = " + this.msg + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasSeat_index) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberSeat_index, seat_index);
		if(hasName) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberName, name);
		if(hasId) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberId, id);
		if(hasIdtype) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberIdtype, idtype);
		if(hasMsg) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberMsg, msg);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasSeat_index) writer.writeInt(fieldNumberSeat_index, seat_index);
		if(hasName) writer.writeString(fieldNumberName, name);
		if(hasId) writer.writeString(fieldNumberId, id);
		if(hasIdtype) writer.writeString(fieldNumberIdtype, idtype);
		if(hasMsg) writer.writeString(fieldNumberMsg, msg);
	}

	static cs_chat parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final cs_chat.Builder builder = cs_chat.newBuilder();

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
			case fieldNumberName:
				builder.setName(reader.readString(fieldNumber));
				break;
			case fieldNumberId:
				builder.setId(reader.readString(fieldNumber));
				break;
			case fieldNumberIdtype:
				builder.setIdtype(reader.readString(fieldNumber));
				break;
			case fieldNumberMsg:
				builder.setMsg(reader.readString(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		cs_chat.unknownTagHandler = unknownTagHandler;
	}

	public static cs_chat parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static cs_chat parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static cs_chat parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}