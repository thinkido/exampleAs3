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

public final class sc_get_collect_box extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final java.util.Vector c_wan;
	private static final int fieldNumberC_wan = 1;

	private final java.util.Vector c_tong;
	private static final int fieldNumberC_tong = 2;

	private final java.util.Vector c_tiao;
	private static final int fieldNumberC_tiao = 3;

	private final java.util.Vector award_vert;
	private static final int fieldNumberAward_vert = 4;

	private final java.util.Vector award_hori;
	private static final int fieldNumberAward_hori = 5;

	private final int award_status;
	private static final int fieldNumberAward_status = 6;
	private final boolean hasAward_status;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_get_collect_box(final Builder builder) {
			this.c_wan = builder.c_wan;
			this.c_tong = builder.c_tong;
			this.c_tiao = builder.c_tiao;
			this.award_vert = builder.award_vert;
			this.award_hori = builder.award_hori;
			this.award_status = builder.award_status;
			this.hasAward_status = builder.hasAward_status;
			}

	public static class Builder {
		private java.util.Vector c_wan = new java.util.Vector();
		private boolean hasC_wan = false;

		private java.util.Vector c_tong = new java.util.Vector();
		private boolean hasC_tong = false;

		private java.util.Vector c_tiao = new java.util.Vector();
		private boolean hasC_tiao = false;

		private java.util.Vector award_vert = new java.util.Vector();
		private boolean hasAward_vert = false;

		private java.util.Vector award_hori = new java.util.Vector();
		private boolean hasAward_hori = false;

		private int award_status;
		private boolean hasAward_status = false;


		private Builder() {
		}

		public Builder setC_wan(final java.util.Vector c_wan) {
			if(!hasC_wan) {
				hasC_wan = true;
			}
			this.c_wan = c_wan;
			return this;
		}


		public Builder addElementC_wan(final int element) {
			if(!hasC_wan) {
				hasC_wan = true;
			}
			c_wan.addElement(new Integer(element));
			return this;
		}

		public Builder setC_tong(final java.util.Vector c_tong) {
			if(!hasC_tong) {
				hasC_tong = true;
			}
			this.c_tong = c_tong;
			return this;
		}


		public Builder addElementC_tong(final int element) {
			if(!hasC_tong) {
				hasC_tong = true;
			}
			c_tong.addElement(new Integer(element));
			return this;
		}

		public Builder setC_tiao(final java.util.Vector c_tiao) {
			if(!hasC_tiao) {
				hasC_tiao = true;
			}
			this.c_tiao = c_tiao;
			return this;
		}


		public Builder addElementC_tiao(final int element) {
			if(!hasC_tiao) {
				hasC_tiao = true;
			}
			c_tiao.addElement(new Integer(element));
			return this;
		}

		public Builder setAward_vert(final java.util.Vector award_vert) {
			if(!hasAward_vert) {
				hasAward_vert = true;
			}
			this.award_vert = award_vert;
			return this;
		}


		public Builder addElementAward_vert(final int element) {
			if(!hasAward_vert) {
				hasAward_vert = true;
			}
			award_vert.addElement(new Integer(element));
			return this;
		}

		public Builder setAward_hori(final java.util.Vector award_hori) {
			if(!hasAward_hori) {
				hasAward_hori = true;
			}
			this.award_hori = award_hori;
			return this;
		}


		public Builder addElementAward_hori(final int element) {
			if(!hasAward_hori) {
				hasAward_hori = true;
			}
			award_hori.addElement(new Integer(element));
			return this;
		}

		public Builder setAward_status(final int award_status) {
			this.award_status = award_status;
			this.hasAward_status = true;
			return this;
		}

		public sc_get_collect_box build() {
			return new sc_get_collect_box(this);
		}
	}

	public java.util.Vector getC_wan() {
		return c_wan;
	}

	public java.util.Vector getC_tong() {
		return c_tong;
	}

	public java.util.Vector getC_tiao() {
		return c_tiao;
	}

	public java.util.Vector getAward_vert() {
		return award_vert;
	}

	public java.util.Vector getAward_hori() {
		return award_hori;
	}

	public int getAward_status() {
		return award_status;
	}

	public boolean hasAward_status() {
		return hasAward_status;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		retValue += "c_wan = " + this.c_wan + TAB;
		retValue += "c_tong = " + this.c_tong + TAB;
		retValue += "c_tiao = " + this.c_tiao + TAB;
		retValue += "award_vert = " + this.award_vert + TAB;
		retValue += "award_hori = " + this.award_hori + TAB;
		if(hasAward_status) retValue += "award_status = " + this.award_status + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		totalSize += ComputeSizeUtil.computeListSize(fieldNumberC_wan, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, c_wan);
		totalSize += ComputeSizeUtil.computeListSize(fieldNumberC_tong, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, c_tong);
		totalSize += ComputeSizeUtil.computeListSize(fieldNumberC_tiao, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, c_tiao);
		totalSize += ComputeSizeUtil.computeListSize(fieldNumberAward_vert, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, award_vert);
		totalSize += ComputeSizeUtil.computeListSize(fieldNumberAward_hori, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, award_hori);
		if(hasAward_status) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberAward_status, award_status);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		writer.writeList(fieldNumberC_wan, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, c_wan);
		writer.writeList(fieldNumberC_tong, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, c_tong);
		writer.writeList(fieldNumberC_tiao, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, c_tiao);
		writer.writeList(fieldNumberAward_vert, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, award_vert);
		writer.writeList(fieldNumberAward_hori, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_INT, award_hori);
		if(hasAward_status) writer.writeInt(fieldNumberAward_status, award_status);
	}

	static sc_get_collect_box parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_get_collect_box.Builder builder = sc_get_collect_box.newBuilder();

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
			case fieldNumberC_wan:
				builder.addElementC_wan(reader.readInt(fieldNumber));
				break;
			case fieldNumberC_tong:
				builder.addElementC_tong(reader.readInt(fieldNumber));
				break;
			case fieldNumberC_tiao:
				builder.addElementC_tiao(reader.readInt(fieldNumber));
				break;
			case fieldNumberAward_vert:
				builder.addElementAward_vert(reader.readInt(fieldNumber));
				break;
			case fieldNumberAward_hori:
				builder.addElementAward_hori(reader.readInt(fieldNumber));
				break;
			case fieldNumberAward_status:
				builder.setAward_status(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_get_collect_box.unknownTagHandler = unknownTagHandler;
	}

	public static sc_get_collect_box parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_get_collect_box parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_get_collect_box parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}