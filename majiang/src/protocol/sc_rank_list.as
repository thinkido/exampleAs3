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

public final class sc_rank_list extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final java.util.Vector winData;
	private static final int fieldNumberWinData = 1;

	private final java.util.Vector coinData;
	private static final int fieldNumberCoinData = 2;

	private final java.util.Vector expData;
	private static final int fieldNumberExpData = 3;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_rank_list(final Builder builder) {
			this.winData = builder.winData;
			this.coinData = builder.coinData;
			this.expData = builder.expData;
			}

	public static class Builder {
		private java.util.Vector winData = new java.util.Vector();
		private boolean hasWinData = false;

		private java.util.Vector coinData = new java.util.Vector();
		private boolean hasCoinData = false;

		private java.util.Vector expData = new java.util.Vector();
		private boolean hasExpData = false;


		private Builder() {
		}

		public Builder setWinData(final java.util.Vector winData) {
			if(!hasWinData) {
				hasWinData = true;
			}
			this.winData = winData;
			return this;
		}


		public Builder addElementWinData(final t_rank_data element) {
			if(!hasWinData) {
				hasWinData = true;
			}
			winData.addElement(element);
			return this;
		}

		public Builder setCoinData(final java.util.Vector coinData) {
			if(!hasCoinData) {
				hasCoinData = true;
			}
			this.coinData = coinData;
			return this;
		}


		public Builder addElementCoinData(final t_rank_data element) {
			if(!hasCoinData) {
				hasCoinData = true;
			}
			coinData.addElement(element);
			return this;
		}

		public Builder setExpData(final java.util.Vector expData) {
			if(!hasExpData) {
				hasExpData = true;
			}
			this.expData = expData;
			return this;
		}


		public Builder addElementExpData(final t_rank_data element) {
			if(!hasExpData) {
				hasExpData = true;
			}
			expData.addElement(element);
			return this;
		}

		public sc_rank_list build() {
			return new sc_rank_list(this);
		}
	}

	public java.util.Vector getWinData() {
		return winData;
	}

	public java.util.Vector getCoinData() {
		return coinData;
	}

	public java.util.Vector getExpData() {
		return expData;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		retValue += "winData = " + this.winData + TAB;
		retValue += "coinData = " + this.coinData + TAB;
		retValue += "expData = " + this.expData + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberWinData, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, winData);
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberCoinData, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, coinData);
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberExpData, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, expData);

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		writer.writeList(fieldNumberWinData, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, winData);
		writer.writeList(fieldNumberCoinData, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, coinData);
		writer.writeList(fieldNumberExpData, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, expData);
	}

	static sc_rank_list parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_rank_list.Builder builder = sc_rank_list.newBuilder();

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
			case fieldNumberWinData:
			 java.util.Vector vcWinData = reader.readMessages(fieldNumberWinData);
				for(int i = 0 ; i < vcWinData.size(); i++) {
					byte[] eachBinData = (byte[]) vcWinData.elementAt(i);
					t_rank_data.Builder builderWinData = t_rank_data.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolWinData = true;
					int nestedFieldWinData = -1;
					while(boolWinData) {
						nestedFieldWinData = getNextFieldNumber(innerInputReader);
						boolWinData = t_rank_data.populateBuilderWithField(innerInputReader, builderWinData, nestedFieldWinData);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementWinData(builderWinData.build());
				}
				break;
			case fieldNumberCoinData:
			 java.util.Vector vcCoinData = reader.readMessages(fieldNumberCoinData);
				for(int i = 0 ; i < vcCoinData.size(); i++) {
					byte[] eachBinData = (byte[]) vcCoinData.elementAt(i);
					t_rank_data.Builder builderCoinData = t_rank_data.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolCoinData = true;
					int nestedFieldCoinData = -1;
					while(boolCoinData) {
						nestedFieldCoinData = getNextFieldNumber(innerInputReader);
						boolCoinData = t_rank_data.populateBuilderWithField(innerInputReader, builderCoinData, nestedFieldCoinData);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementCoinData(builderCoinData.build());
				}
				break;
			case fieldNumberExpData:
			 java.util.Vector vcExpData = reader.readMessages(fieldNumberExpData);
				for(int i = 0 ; i < vcExpData.size(); i++) {
					byte[] eachBinData = (byte[]) vcExpData.elementAt(i);
					t_rank_data.Builder builderExpData = t_rank_data.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolExpData = true;
					int nestedFieldExpData = -1;
					while(boolExpData) {
						nestedFieldExpData = getNextFieldNumber(innerInputReader);
						boolExpData = t_rank_data.populateBuilderWithField(innerInputReader, builderExpData, nestedFieldExpData);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementExpData(builderExpData.build());
				}
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_rank_list.unknownTagHandler = unknownTagHandler;
	}

	public static sc_rank_list parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_rank_list parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_rank_list parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}