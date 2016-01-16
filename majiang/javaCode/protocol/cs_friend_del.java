package protocol;
// Generated by proto2javame, Sat Jan 09 02:23:16 CST 2016.

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

public final class cs_friend_del extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final String id;
	private static final int fieldNumberId = 1;
	private final boolean hasId;

	private final String idtype;
	private static final int fieldNumberIdtype = 2;
	private final boolean hasIdtype;


	public static Builder newBuilder() {
		return new Builder();
	}

	private cs_friend_del(final Builder builder) {
			this.id = builder.id;
			this.hasId = builder.hasId;
			this.idtype = builder.idtype;
			this.hasIdtype = builder.hasIdtype;
			}

	public static class Builder {
		private String id;
		private boolean hasId = false;

		private String idtype;
		private boolean hasIdtype = false;


		private Builder() {
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

		public cs_friend_del build() {
			return new cs_friend_del(this);
		}
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

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasId) retValue += "id = " + this.id + TAB;
		if(hasIdtype) retValue += "idtype = " + this.idtype + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasId) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberId, id);
		if(hasIdtype) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberIdtype, idtype);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasId) writer.writeString(fieldNumberId, id);
		if(hasIdtype) writer.writeString(fieldNumberIdtype, idtype);
	}

	static cs_friend_del parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final cs_friend_del.Builder builder = cs_friend_del.newBuilder();

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
				builder.setId(reader.readString(fieldNumber));
				break;
			case fieldNumberIdtype:
				builder.setIdtype(reader.readString(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		cs_friend_del.unknownTagHandler = unknownTagHandler;
	}

	public static cs_friend_del parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static cs_friend_del parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static cs_friend_del parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}