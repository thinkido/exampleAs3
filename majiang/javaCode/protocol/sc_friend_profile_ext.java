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

public final class sc_friend_profile_ext extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final String id;
	private static final int fieldNumberId = 1;
	private final boolean hasId;

	private final String idtype;
	private static final int fieldNumberIdtype = 2;
	private final boolean hasIdtype;

	private final java.util.Vector achievement;
	private static final int fieldNumberAchievement = 3;


	public static Builder newBuilder() {
		return new Builder();
	}

	private sc_friend_profile_ext(final Builder builder) {
			this.id = builder.id;
			this.hasId = builder.hasId;
			this.idtype = builder.idtype;
			this.hasIdtype = builder.hasIdtype;
			this.achievement = builder.achievement;
			}

	public static class Builder {
		private String id;
		private boolean hasId = false;

		private String idtype;
		private boolean hasIdtype = false;

		private java.util.Vector achievement = new java.util.Vector();
		private boolean hasAchievement = false;


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

		public Builder setAchievement(final java.util.Vector achievement) {
			if(!hasAchievement) {
				hasAchievement = true;
			}
			this.achievement = achievement;
			return this;
		}


		public Builder addElementAchievement(final t_friend_achievement element) {
			if(!hasAchievement) {
				hasAchievement = true;
			}
			achievement.addElement(element);
			return this;
		}

		public sc_friend_profile_ext build() {
			return new sc_friend_profile_ext(this);
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

	public java.util.Vector getAchievement() {
		return achievement;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasId) retValue += "id = " + this.id + TAB;
		if(hasIdtype) retValue += "idtype = " + this.idtype + TAB;
		retValue += "achievement = " + this.achievement + TAB;
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
		messageSize += ComputeSizeUtil.computeListSize(fieldNumberAchievement, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, achievement);

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasId) writer.writeString(fieldNumberId, id);
		if(hasIdtype) writer.writeString(fieldNumberIdtype, idtype);
		writer.writeList(fieldNumberAchievement, net.jarlehansen.protobuf.javame.SupportedDataTypes.DATA_TYPE_CUSTOM, achievement);
	}

	static sc_friend_profile_ext parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final sc_friend_profile_ext.Builder builder = sc_friend_profile_ext.newBuilder();

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
			case fieldNumberAchievement:
			 java.util.Vector vcAchievement = reader.readMessages(fieldNumberAchievement);
				for(int i = 0 ; i < vcAchievement.size(); i++) {
					byte[] eachBinData = (byte[]) vcAchievement.elementAt(i);
					t_friend_achievement.Builder builderAchievement = t_friend_achievement.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolAchievement = true;
					int nestedFieldAchievement = -1;
					while(boolAchievement) {
						nestedFieldAchievement = getNextFieldNumber(innerInputReader);
						boolAchievement = t_friend_achievement.populateBuilderWithField(innerInputReader, builderAchievement, nestedFieldAchievement);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.addElementAchievement(builderAchievement.build());
				}
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		sc_friend_profile_ext.unknownTagHandler = unknownTagHandler;
	}

	public static sc_friend_profile_ext parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static sc_friend_profile_ext parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static sc_friend_profile_ext parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}