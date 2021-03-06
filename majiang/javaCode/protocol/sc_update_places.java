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

public final class sc_update_places extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final java.util.Vector place_infos;
	private static final int fieldNumberPlace_infos = 1;

	private final int quest_can_fetch;
	private static final int fieldNumberQuest_can_fetch = 2;
	private final boolean hasQuest_can_fetch;

	private final int ach_can_fetch;
	private static final int fieldNumberAch_can_fetch = 3;
	private final boolean hasAch_can_fetch;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_update_places(final Builder builder) {
			this.place_infos = builder.place_infos;
			this.quest_can_fetch = builder.quest_can_fetch;
			this.hasQuest_can_fetch = builder.hasQuest_can_fetch;
			this.ach_can_fetch = builder.ach_can_fetch;
			this.hasAch_can_fetch = builder.hasAch_can_fetch;
			}

	public static class Builder {
		private java.util.Vector place_infos = new java.util.Vector();
		private boolean hasPlace_infos = false;

		private int quest_can_fetch;
		private boolean hasQuest_can_fetch = false;

		private int ach_can_fetch;
		private boolean hasAch_can_fetch = false;


		private Builder() {
		}

		public Builder setPlace_infos(final java.util.Vector place_infos) {
			if(!hasPlace_infos) {
				hasPlace_infos = true;
			}
			this.place_infos = place_infos;
			return this;
		}


		public Builder addElementPlace_infos(final place_info element) {
			if(!hasPlace_infos) {
				hasPlace_infos = true;
			}
			place_infos.addElement(element);
			return this;
		}

		public Builder setQuest_can_fetch(final int quest_can_fetch) {
			this.quest_can_fetch = quest_can_fetch;
			this.hasQuest_can_fetch = true;
			return this;
		}

		public Builder setAch_can_fetch(final int ach_can_fetch) {
			this.ach_can_fetch = ach_can_fetch;
			this.hasAch_can_fetch = true;
			return this;
		}

		public sc_update_places build() {
			return new sc_update_places(this);
		}
	}

	public java.util.Vector getPlace_infos() {
		return place_infos;
	}

	public int getQuest_can_fetch() {
		return quest_can_fetch;
	}

	public boolean hasQuest_can_fetch() {
		return hasQuest_can_fetch;
	}

	public int getAch_can_fetch() {
		return ach_can_fetch;
	}

	public boolean hasAch_can_fetch() {
		return hasAch_can_fetch;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		retValue += "place_infos = " + this.place_infos + TAB;
		if(hasQuest_can_fetch) retValue += "quest_can_fetch = " + this.quest_can_fetch + TAB;
		if(hasAch_can_fetch) retValue += "ach_can_fetch = " + this.ach_can_fetch + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasQuest_can_fetch) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberQuest_can_fetch, quest_can_fetch);
		if(hasAch_can_fetch) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberAch_can_fetch, ach_can_fetch);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberPlace_infos, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, place_infos);

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		writer.writeList(fieldNumberPlace_infos, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, place_infos);
		if(hasQuest_can_fetch) writer.writeInt(fieldNumberQuest_can_fetch, quest_can_fetch);
		if(hasAch_can_fetch) writer.writeInt(fieldNumberAch_can_fetch, ach_can_fetch);
	}

	static sc_update_places parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_update_places.Builder builder = sc_update_places.newBuilder();

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
			case fieldNumberPlace_infos:
			 java.util.Vector vcPlace_infos = reader.readMessages(fieldNumberPlace_infos);
				for(int i = 0 ; i < vcPlace_infos.size(); i++) {
					byte[] eachBinData = (byte[]) vcPlace_infos.elementAt(i);
					place_info.Builder builderPlace_infos = place_info.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolPlace_infos = true;
					int nestedFieldPlace_infos = -1;
					while(boolPlace_infos) {
						nestedFieldPlace_infos = getNextFieldNumber(innerInputReader);
						boolPlace_infos = place_info.populateBuilderWithField(innerInputReader, builderPlace_infos, nestedFieldPlace_infos);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementPlace_infos(builderPlace_infos.build());
				}
				break;
			case fieldNumberQuest_can_fetch:
				builder.setQuest_can_fetch(reader.readInt(fieldNumber));
				break;
			case fieldNumberAch_can_fetch:
				builder.setAch_can_fetch(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_update_places.unknownTagHandler = unknownTagHandler;
	}

	public static sc_update_places parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_update_places parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_update_places parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}