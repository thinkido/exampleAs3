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

public final class sc_end_game extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final java.util.Vector seq_infos;
	private static final int fieldNumberSeq_infos = 1;

	private final boolean liuju;
	private static final int fieldNumberLiuju = 2;
	private final boolean hasLiuju;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_end_game(final Builder builder) {
			this.seq_infos = builder.seq_infos;
			this.liuju = builder.liuju;
			this.hasLiuju = builder.hasLiuju;
			}

	public static class Builder {
		private java.util.Vector seq_infos = new java.util.Vector();
		private boolean hasSeq_infos = false;

		private boolean liuju;
		private boolean hasLiuju = false;


		private Builder() {
		}

		public Builder setSeq_infos(final java.util.Vector seq_infos) {
			if(!hasSeq_infos) {
				hasSeq_infos = true;
			}
			this.seq_infos = seq_infos;
			return this;
		}


		public Builder addElementSeq_infos(final all_seq_info element) {
			if(!hasSeq_infos) {
				hasSeq_infos = true;
			}
			seq_infos.addElement(element);
			return this;
		}

		public Builder setLiuju(final boolean liuju) {
			this.liuju = liuju;
			this.hasLiuju = true;
			return this;
		}

		public sc_end_game build() {
			return new sc_end_game(this);
		}
	}

	public java.util.Vector getSeq_infos() {
		return seq_infos;
	}

	public boolean getLiuju() {
		return liuju;
	}

	public boolean hasLiuju() {
		return hasLiuju;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		retValue += "seq_infos = " + this.seq_infos + TAB;
		if(hasLiuju) retValue += "liuju = " + this.liuju + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasLiuju) totalSize += ComputeSizeUtil.computeBooleanSize(fieldNumberLiuju, liuju);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberSeq_infos, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, seq_infos);

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		writer.writeList(fieldNumberSeq_infos, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, seq_infos);
		if(hasLiuju) writer.writeBoolean(fieldNumberLiuju, liuju);
	}

	static sc_end_game parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_end_game.Builder builder = sc_end_game.newBuilder();

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
			case fieldNumberSeq_infos:
			 java.util.Vector vcSeq_infos = reader.readMessages(fieldNumberSeq_infos);
				for(int i = 0 ; i < vcSeq_infos.size(); i++) {
					byte[] eachBinData = (byte[]) vcSeq_infos.elementAt(i);
					all_seq_info.Builder builderSeq_infos = all_seq_info.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolSeq_infos = true;
					int nestedFieldSeq_infos = -1;
					while(boolSeq_infos) {
						nestedFieldSeq_infos = getNextFieldNumber(innerInputReader);
						boolSeq_infos = all_seq_info.populateBuilderWithField(innerInputReader, builderSeq_infos, nestedFieldSeq_infos);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementSeq_infos(builderSeq_infos.build());
				}
				break;
			case fieldNumberLiuju:
				builder.setLiuju(reader.readBoolean(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_end_game.unknownTagHandler = unknownTagHandler;
	}

	public static sc_end_game parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_end_game parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_end_game parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}