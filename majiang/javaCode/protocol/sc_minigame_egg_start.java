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

public final class sc_minigame_egg_start extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final java.util.Vector eggs;
	private static final int fieldNumberEggs = 1;

	private final java.util.Vector awards;
	private static final int fieldNumberAwards = 2;

	private final int remain_times;
	private static final int fieldNumberRemain_times = 3;
	private final boolean hasRemain_times;

	private final int change_remain_times;
	private static final int fieldNumberChange_remain_times = 4;
	private final boolean hasChange_remain_times;

	private final int current_base;
	private static final int fieldNumberCurrent_base = 5;
	private final boolean hasCurrent_base;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_minigame_egg_start(final Builder builder) {
			this.eggs = builder.eggs;
			this.awards = builder.awards;
			this.remain_times = builder.remain_times;
			this.hasRemain_times = builder.hasRemain_times;
			this.change_remain_times = builder.change_remain_times;
			this.hasChange_remain_times = builder.hasChange_remain_times;
			this.current_base = builder.current_base;
			this.hasCurrent_base = builder.hasCurrent_base;
			}

	public static class Builder {
		private java.util.Vector eggs = new java.util.Vector();
		private boolean hasEggs = false;

		private java.util.Vector awards = new java.util.Vector();
		private boolean hasAwards = false;

		private int remain_times;
		private boolean hasRemain_times = false;

		private int change_remain_times;
		private boolean hasChange_remain_times = false;

		private int current_base;
		private boolean hasCurrent_base = false;


		private Builder() {
		}

		public Builder setEggs(final java.util.Vector eggs) {
			if(!hasEggs) {
				hasEggs = true;
			}
			this.eggs = eggs;
			return this;
		}


		public Builder addElementEggs(final t_egg_item element) {
			if(!hasEggs) {
				hasEggs = true;
			}
			eggs.addElement(element);
			return this;
		}

		public Builder setAwards(final java.util.Vector awards) {
			if(!hasAwards) {
				hasAwards = true;
			}
			this.awards = awards;
			return this;
		}


		public Builder addElementAwards(final t_award_item element) {
			if(!hasAwards) {
				hasAwards = true;
			}
			awards.addElement(element);
			return this;
		}

		public Builder setRemain_times(final int remain_times) {
			this.remain_times = remain_times;
			this.hasRemain_times = true;
			return this;
		}

		public Builder setChange_remain_times(final int change_remain_times) {
			this.change_remain_times = change_remain_times;
			this.hasChange_remain_times = true;
			return this;
		}

		public Builder setCurrent_base(final int current_base) {
			this.current_base = current_base;
			this.hasCurrent_base = true;
			return this;
		}

		public sc_minigame_egg_start build() {
			return new sc_minigame_egg_start(this);
		}
	}

	public java.util.Vector getEggs() {
		return eggs;
	}

	public java.util.Vector getAwards() {
		return awards;
	}

	public int getRemain_times() {
		return remain_times;
	}

	public boolean hasRemain_times() {
		return hasRemain_times;
	}

	public int getChange_remain_times() {
		return change_remain_times;
	}

	public boolean hasChange_remain_times() {
		return hasChange_remain_times;
	}

	public int getCurrent_base() {
		return current_base;
	}

	public boolean hasCurrent_base() {
		return hasCurrent_base;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		retValue += "eggs = " + this.eggs + TAB;
		retValue += "awards = " + this.awards + TAB;
		if(hasRemain_times) retValue += "remain_times = " + this.remain_times + TAB;
		if(hasChange_remain_times) retValue += "change_remain_times = " + this.change_remain_times + TAB;
		if(hasCurrent_base) retValue += "current_base = " + this.current_base + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasRemain_times) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberRemain_times, remain_times);
		if(hasChange_remain_times) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberChange_remain_times, change_remain_times);
		if(hasCurrent_base) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberCurrent_base, current_base);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberEggs, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, eggs);
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberAwards, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, awards);

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		writer.writeList(fieldNumberEggs, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, eggs);
		writer.writeList(fieldNumberAwards, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, awards);
		if(hasRemain_times) writer.writeInt(fieldNumberRemain_times, remain_times);
		if(hasChange_remain_times) writer.writeInt(fieldNumberChange_remain_times, change_remain_times);
		if(hasCurrent_base) writer.writeInt(fieldNumberCurrent_base, current_base);
	}

	static sc_minigame_egg_start parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_minigame_egg_start.Builder builder = sc_minigame_egg_start.newBuilder();

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
			case fieldNumberEggs:
			 java.util.Vector vcEggs = reader.readMessages(fieldNumberEggs);
				for(int i = 0 ; i < vcEggs.size(); i++) {
					byte[] eachBinData = (byte[]) vcEggs.elementAt(i);
					t_egg_item.Builder builderEggs = t_egg_item.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolEggs = true;
					int nestedFieldEggs = -1;
					while(boolEggs) {
						nestedFieldEggs = getNextFieldNumber(innerInputReader);
						boolEggs = t_egg_item.populateBuilderWithField(innerInputReader, builderEggs, nestedFieldEggs);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementEggs(builderEggs.build());
				}
				break;
			case fieldNumberAwards:
			 java.util.Vector vcAwards = reader.readMessages(fieldNumberAwards);
				for(int i = 0 ; i < vcAwards.size(); i++) {
					byte[] eachBinData = (byte[]) vcAwards.elementAt(i);
					t_award_item.Builder builderAwards = t_award_item.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolAwards = true;
					int nestedFieldAwards = -1;
					while(boolAwards) {
						nestedFieldAwards = getNextFieldNumber(innerInputReader);
						boolAwards = t_award_item.populateBuilderWithField(innerInputReader, builderAwards, nestedFieldAwards);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementAwards(builderAwards.build());
				}
				break;
			case fieldNumberRemain_times:
				builder.setRemain_times(reader.readInt(fieldNumber));
				break;
			case fieldNumberChange_remain_times:
				builder.setChange_remain_times(reader.readInt(fieldNumber));
				break;
			case fieldNumberCurrent_base:
				builder.setCurrent_base(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_minigame_egg_start.unknownTagHandler = unknownTagHandler;
	}

	public static sc_minigame_egg_start parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_minigame_egg_start parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_minigame_egg_start parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}