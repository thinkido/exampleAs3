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

public final class cs_confirm_be_invited_company extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final boolean accepted;
	private static final int fieldNumberAccepted = 1;
	private final boolean hasAccepted;

	private final String id;
	private static final int fieldNumberId = 2;
	private final boolean hasId;

	private final String idtype;
	private static final int fieldNumberIdtype = 3;
	private final boolean hasIdtype;

	private final String to_host;
	private static final int fieldNumberTo_host = 4;
	private final boolean hasTo_host;

	private final int to_port;
	private static final int fieldNumberTo_port = 5;
	private final boolean hasTo_port;

	private final int to_table;
	private static final int fieldNumberTo_table = 6;
	private final boolean hasTo_table;

	private final int to_seat;
	private static final int fieldNumberTo_seat = 7;
	private final boolean hasTo_seat;


	public static Builder newBuilder() {
		return new Builder();
	}

	private cs_confirm_be_invited_company(final Builder builder) {
			this.accepted = builder.accepted;
			this.hasAccepted = builder.hasAccepted;
			this.id = builder.id;
			this.hasId = builder.hasId;
			this.idtype = builder.idtype;
			this.hasIdtype = builder.hasIdtype;
			this.to_host = builder.to_host;
			this.hasTo_host = builder.hasTo_host;
			this.to_port = builder.to_port;
			this.hasTo_port = builder.hasTo_port;
			this.to_table = builder.to_table;
			this.hasTo_table = builder.hasTo_table;
			this.to_seat = builder.to_seat;
			this.hasTo_seat = builder.hasTo_seat;
			}

	public static class Builder {
		private boolean accepted;
		private boolean hasAccepted = false;

		private String id;
		private boolean hasId = false;

		private String idtype;
		private boolean hasIdtype = false;

		private String to_host;
		private boolean hasTo_host = false;

		private int to_port;
		private boolean hasTo_port = false;

		private int to_table;
		private boolean hasTo_table = false;

		private int to_seat;
		private boolean hasTo_seat = false;


		private Builder() {
		}

		public Builder setAccepted(final boolean accepted) {
			this.accepted = accepted;
			this.hasAccepted = true;
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

		public Builder setTo_host(final String to_host) {
			this.to_host = to_host;
			this.hasTo_host = true;
			return this;
		}

		public Builder setTo_port(final int to_port) {
			this.to_port = to_port;
			this.hasTo_port = true;
			return this;
		}

		public Builder setTo_table(final int to_table) {
			this.to_table = to_table;
			this.hasTo_table = true;
			return this;
		}

		public Builder setTo_seat(final int to_seat) {
			this.to_seat = to_seat;
			this.hasTo_seat = true;
			return this;
		}

		public cs_confirm_be_invited_company build() {
			return new cs_confirm_be_invited_company(this);
		}
	}

	public boolean getAccepted() {
		return accepted;
	}

	public boolean hasAccepted() {
		return hasAccepted;
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

	public String getTo_host() {
		return to_host;
	}

	public boolean hasTo_host() {
		return hasTo_host;
	}

	public int getTo_port() {
		return to_port;
	}

	public boolean hasTo_port() {
		return hasTo_port;
	}

	public int getTo_table() {
		return to_table;
	}

	public boolean hasTo_table() {
		return hasTo_table;
	}

	public int getTo_seat() {
		return to_seat;
	}

	public boolean hasTo_seat() {
		return hasTo_seat;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasAccepted) retValue += "accepted = " + this.accepted + TAB;
		if(hasId) retValue += "id = " + this.id + TAB;
		if(hasIdtype) retValue += "idtype = " + this.idtype + TAB;
		if(hasTo_host) retValue += "to_host = " + this.to_host + TAB;
		if(hasTo_port) retValue += "to_port = " + this.to_port + TAB;
		if(hasTo_table) retValue += "to_table = " + this.to_table + TAB;
		if(hasTo_seat) retValue += "to_seat = " + this.to_seat + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasAccepted) totalSize += ComputeSizeUtil.computeBooleanSize(fieldNumberAccepted, accepted);
		if(hasId) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberId, id);
		if(hasIdtype) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberIdtype, idtype);
		if(hasTo_host) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberTo_host, to_host);
		if(hasTo_port) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberTo_port, to_port);
		if(hasTo_table) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberTo_table, to_table);
		if(hasTo_seat) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberTo_seat, to_seat);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasAccepted) writer.writeBoolean(fieldNumberAccepted, accepted);
		if(hasId) writer.writeString(fieldNumberId, id);
		if(hasIdtype) writer.writeString(fieldNumberIdtype, idtype);
		if(hasTo_host) writer.writeString(fieldNumberTo_host, to_host);
		if(hasTo_port) writer.writeInt(fieldNumberTo_port, to_port);
		if(hasTo_table) writer.writeInt(fieldNumberTo_table, to_table);
		if(hasTo_seat) writer.writeInt(fieldNumberTo_seat, to_seat);
	}

	static cs_confirm_be_invited_company parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final cs_confirm_be_invited_company.Builder builder = cs_confirm_be_invited_company.newBuilder();

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
			case fieldNumberAccepted:
				builder.setAccepted(reader.readBoolean(fieldNumber));
				break;
			case fieldNumberId:
				builder.setId(reader.readString(fieldNumber));
				break;
			case fieldNumberIdtype:
				builder.setIdtype(reader.readString(fieldNumber));
				break;
			case fieldNumberTo_host:
				builder.setTo_host(reader.readString(fieldNumber));
				break;
			case fieldNumberTo_port:
				builder.setTo_port(reader.readInt(fieldNumber));
				break;
			case fieldNumberTo_table:
				builder.setTo_table(reader.readInt(fieldNumber));
				break;
			case fieldNumberTo_seat:
				builder.setTo_seat(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		cs_confirm_be_invited_company.unknownTagHandler = unknownTagHandler;
	}

	public static cs_confirm_be_invited_company parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static cs_confirm_be_invited_company parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static cs_confirm_be_invited_company parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}