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

public final class sc_protocol_pack extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int id;
	private static final int fieldNumberId = 1;
	private final boolean hasId;

	private final java.util.Vector pack;
	private static final int fieldNumberPack = 2;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_protocol_pack(final Builder builder) {
			this.id = builder.id;
			this.hasId = builder.hasId;
			this.pack = builder.pack;
			}

	public static class Builder {
		private int id;
		private boolean hasId = false;

		private java.util.Vector pack = new java.util.Vector();
		private boolean hasPack = false;


		private Builder() {
		}

		public Builder setId(final int id) {
			this.id = id;
			this.hasId = true;
			return this;
		}

		public Builder setPack(final java.util.Vector pack) {
			if(!hasPack) {
				hasPack = true;
			}
			this.pack = pack;
			return this;
		}


		public Builder addElementPack(final protocol element) {
			if(!hasPack) {
				hasPack = true;
			}
			pack.addElement(element);
			return this;
		}

		public sc_protocol_pack build() {
			return new sc_protocol_pack(this);
		}
	}

	public int getId() {
		return id;
	}

	public boolean hasId() {
		return hasId;
	}

	public java.util.Vector getPack() {
		return pack;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasId) retValue += "id = " + this.id + TAB;
		retValue += "pack = " + this.pack + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasId) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberId, id);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberPack, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, pack);

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasId) writer.writeInt(fieldNumberId, id);
		writer.writeList(fieldNumberPack, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, pack);
	}

	static sc_protocol_pack parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_protocol_pack.Builder builder = sc_protocol_pack.newBuilder();

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
			case fieldNumberPack:
			 java.util.Vector vcPack = reader.readMessages(fieldNumberPack);
				for(int i = 0 ; i < vcPack.size(); i++) {
					byte[] eachBinData = (byte[]) vcPack.elementAt(i);
					protocol.Builder builderPack = protocol.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolPack = true;
					int nestedFieldPack = -1;
					while(boolPack) {
						nestedFieldPack = getNextFieldNumber(innerInputReader);
						boolPack = protocol.populateBuilderWithField(innerInputReader, builderPack, nestedFieldPack);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementPack(builderPack.build());
				}
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_protocol_pack.unknownTagHandler = unknownTagHandler;
	}

	public static sc_protocol_pack parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_protocol_pack parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_protocol_pack parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}