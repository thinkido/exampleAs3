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

public final class t_friend_data extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final String id;
	private static final int fieldNumberId = 1;
	private final boolean hasId;

	private final String idtype;
	private static final int fieldNumberIdtype = 2;
	private final boolean hasIdtype;

	private final String name;
	private static final int fieldNumberName = 3;
	private final boolean hasName;

	private final int gold;
	private static final int fieldNumberGold = 4;
	private final boolean hasGold;

	private final int level;
	private static final int fieldNumberLevel = 5;
	private final boolean hasLevel;

	private final int exp;
	private static final int fieldNumberExp = 6;
	private final boolean hasExp;

	private final int sex;
	private static final int fieldNumberSex = 7;
	private final boolean hasSex;

	private final int vip;
	private static final int fieldNumberVip = 8;
	private final boolean hasVip;

	private final int win_count;
	private static final int fieldNumberWin_count = 9;
	private final boolean hasWin_count;

	private final int lose_count;
	private static final int fieldNumberLose_count = 10;
	private final boolean hasLose_count;

	private final int ping_count;
	private static final int fieldNumberPing_count = 11;
	private final boolean hasPing_count;

	private final boolean online;
	private static final int fieldNumberOnline = 12;
	private final boolean hasOnline;

	private final boolean ingame;
	private static final int fieldNumberIngame = 13;
	private final boolean hasIngame;

	private final int oid;
	private static final int fieldNumberOid = 14;
	private final boolean hasOid;

	private final long last_login_time;
	private static final int fieldNumberLast_login_time = 15;
	private final boolean hasLast_login_time;

	private final int portrait;
	private static final int fieldNumberPortrait = 16;
	private final boolean hasPortrait;


	public static Builder newBuilder() {
		return new Builder();
	}

	private t_friend_data(final Builder builder) {
			this.id = builder.id;
			this.hasId = builder.hasId;
			this.idtype = builder.idtype;
			this.hasIdtype = builder.hasIdtype;
			this.name = builder.name;
			this.hasName = builder.hasName;
			this.gold = builder.gold;
			this.hasGold = builder.hasGold;
			this.level = builder.level;
			this.hasLevel = builder.hasLevel;
			this.exp = builder.exp;
			this.hasExp = builder.hasExp;
			this.sex = builder.sex;
			this.hasSex = builder.hasSex;
			this.vip = builder.vip;
			this.hasVip = builder.hasVip;
			this.win_count = builder.win_count;
			this.hasWin_count = builder.hasWin_count;
			this.lose_count = builder.lose_count;
			this.hasLose_count = builder.hasLose_count;
			this.ping_count = builder.ping_count;
			this.hasPing_count = builder.hasPing_count;
			this.online = builder.online;
			this.hasOnline = builder.hasOnline;
			this.ingame = builder.ingame;
			this.hasIngame = builder.hasIngame;
			this.oid = builder.oid;
			this.hasOid = builder.hasOid;
			this.last_login_time = builder.last_login_time;
			this.hasLast_login_time = builder.hasLast_login_time;
			this.portrait = builder.portrait;
			this.hasPortrait = builder.hasPortrait;
			}

	public static class Builder {
		private String id;
		private boolean hasId = false;

		private String idtype;
		private boolean hasIdtype = false;

		private String name;
		private boolean hasName = false;

		private int gold;
		private boolean hasGold = false;

		private int level;
		private boolean hasLevel = false;

		private int exp;
		private boolean hasExp = false;

		private int sex;
		private boolean hasSex = false;

		private int vip;
		private boolean hasVip = false;

		private int win_count;
		private boolean hasWin_count = false;

		private int lose_count;
		private boolean hasLose_count = false;

		private int ping_count;
		private boolean hasPing_count = false;

		private boolean online;
		private boolean hasOnline = false;

		private boolean ingame;
		private boolean hasIngame = false;

		private int oid;
		private boolean hasOid = false;

		private long last_login_time;
		private boolean hasLast_login_time = false;

		private int portrait;
		private boolean hasPortrait = false;


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

		public Builder setName(final String name) {
			this.name = name;
			this.hasName = true;
			return this;
		}

		public Builder setGold(final int gold) {
			this.gold = gold;
			this.hasGold = true;
			return this;
		}

		public Builder setLevel(final int level) {
			this.level = level;
			this.hasLevel = true;
			return this;
		}

		public Builder setExp(final int exp) {
			this.exp = exp;
			this.hasExp = true;
			return this;
		}

		public Builder setSex(final int sex) {
			this.sex = sex;
			this.hasSex = true;
			return this;
		}

		public Builder setVip(final int vip) {
			this.vip = vip;
			this.hasVip = true;
			return this;
		}

		public Builder setWin_count(final int win_count) {
			this.win_count = win_count;
			this.hasWin_count = true;
			return this;
		}

		public Builder setLose_count(final int lose_count) {
			this.lose_count = lose_count;
			this.hasLose_count = true;
			return this;
		}

		public Builder setPing_count(final int ping_count) {
			this.ping_count = ping_count;
			this.hasPing_count = true;
			return this;
		}

		public Builder setOnline(final boolean online) {
			this.online = online;
			this.hasOnline = true;
			return this;
		}

		public Builder setIngame(final boolean ingame) {
			this.ingame = ingame;
			this.hasIngame = true;
			return this;
		}

		public Builder setOid(final int oid) {
			this.oid = oid;
			this.hasOid = true;
			return this;
		}

		public Builder setLast_login_time(final long last_login_time) {
			this.last_login_time = last_login_time;
			this.hasLast_login_time = true;
			return this;
		}

		public Builder setPortrait(final int portrait) {
			this.portrait = portrait;
			this.hasPortrait = true;
			return this;
		}

		public t_friend_data build() {
			return new t_friend_data(this);
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

	public String getName() {
		return name;
	}

	public boolean hasName() {
		return hasName;
	}

	public int getGold() {
		return gold;
	}

	public boolean hasGold() {
		return hasGold;
	}

	public int getLevel() {
		return level;
	}

	public boolean hasLevel() {
		return hasLevel;
	}

	public int getExp() {
		return exp;
	}

	public boolean hasExp() {
		return hasExp;
	}

	public int getSex() {
		return sex;
	}

	public boolean hasSex() {
		return hasSex;
	}

	public int getVip() {
		return vip;
	}

	public boolean hasVip() {
		return hasVip;
	}

	public int getWin_count() {
		return win_count;
	}

	public boolean hasWin_count() {
		return hasWin_count;
	}

	public int getLose_count() {
		return lose_count;
	}

	public boolean hasLose_count() {
		return hasLose_count;
	}

	public int getPing_count() {
		return ping_count;
	}

	public boolean hasPing_count() {
		return hasPing_count;
	}

	public boolean getOnline() {
		return online;
	}

	public boolean hasOnline() {
		return hasOnline;
	}

	public boolean getIngame() {
		return ingame;
	}

	public boolean hasIngame() {
		return hasIngame;
	}

	public int getOid() {
		return oid;
	}

	public boolean hasOid() {
		return hasOid;
	}

	public long getLast_login_time() {
		return last_login_time;
	}

	public boolean hasLast_login_time() {
		return hasLast_login_time;
	}

	public int getPortrait() {
		return portrait;
	}

	public boolean hasPortrait() {
		return hasPortrait;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasId) retValue += "id = " + this.id + TAB;
		if(hasIdtype) retValue += "idtype = " + this.idtype + TAB;
		if(hasName) retValue += "name = " + this.name + TAB;
		if(hasGold) retValue += "gold = " + this.gold + TAB;
		if(hasLevel) retValue += "level = " + this.level + TAB;
		if(hasExp) retValue += "exp = " + this.exp + TAB;
		if(hasSex) retValue += "sex = " + this.sex + TAB;
		if(hasVip) retValue += "vip = " + this.vip + TAB;
		if(hasWin_count) retValue += "win_count = " + this.win_count + TAB;
		if(hasLose_count) retValue += "lose_count = " + this.lose_count + TAB;
		if(hasPing_count) retValue += "ping_count = " + this.ping_count + TAB;
		if(hasOnline) retValue += "online = " + this.online + TAB;
		if(hasIngame) retValue += "ingame = " + this.ingame + TAB;
		if(hasOid) retValue += "oid = " + this.oid + TAB;
		if(hasLast_login_time) retValue += "last_login_time = " + this.last_login_time + TAB;
		if(hasPortrait) retValue += "portrait = " + this.portrait + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasId) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberId, id);
		if(hasIdtype) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberIdtype, idtype);
		if(hasName) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberName, name);
		if(hasGold) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberGold, gold);
		if(hasLevel) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberLevel, level);
		if(hasExp) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberExp, exp);
		if(hasSex) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberSex, sex);
		if(hasVip) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberVip, vip);
		if(hasWin_count) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberWin_count, win_count);
		if(hasLose_count) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberLose_count, lose_count);
		if(hasPing_count) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberPing_count, ping_count);
		if(hasOnline) totalSize += ComputeSizeUtil.computeBooleanSize(fieldNumberOnline, online);
		if(hasIngame) totalSize += ComputeSizeUtil.computeBooleanSize(fieldNumberIngame, ingame);
		if(hasOid) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberOid, oid);
		if(hasLast_login_time) totalSize += ComputeSizeUtil.computeLongSize(fieldNumberLast_login_time, last_login_time);
		if(hasPortrait) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberPortrait, portrait);
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
		if(hasName) writer.writeString(fieldNumberName, name);
		if(hasGold) writer.writeInt(fieldNumberGold, gold);
		if(hasLevel) writer.writeInt(fieldNumberLevel, level);
		if(hasExp) writer.writeInt(fieldNumberExp, exp);
		if(hasSex) writer.writeInt(fieldNumberSex, sex);
		if(hasVip) writer.writeInt(fieldNumberVip, vip);
		if(hasWin_count) writer.writeInt(fieldNumberWin_count, win_count);
		if(hasLose_count) writer.writeInt(fieldNumberLose_count, lose_count);
		if(hasPing_count) writer.writeInt(fieldNumberPing_count, ping_count);
		if(hasOnline) writer.writeBoolean(fieldNumberOnline, online);
		if(hasIngame) writer.writeBoolean(fieldNumberIngame, ingame);
		if(hasOid) writer.writeInt(fieldNumberOid, oid);
		if(hasLast_login_time) writer.writeLong(fieldNumberLast_login_time, last_login_time);
		if(hasPortrait) writer.writeInt(fieldNumberPortrait, portrait);
	}

	static t_friend_data parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final t_friend_data.Builder builder = t_friend_data.newBuilder();

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
			case fieldNumberName:
				builder.setName(reader.readString(fieldNumber));
				break;
			case fieldNumberGold:
				builder.setGold(reader.readInt(fieldNumber));
				break;
			case fieldNumberLevel:
				builder.setLevel(reader.readInt(fieldNumber));
				break;
			case fieldNumberExp:
				builder.setExp(reader.readInt(fieldNumber));
				break;
			case fieldNumberSex:
				builder.setSex(reader.readInt(fieldNumber));
				break;
			case fieldNumberVip:
				builder.setVip(reader.readInt(fieldNumber));
				break;
			case fieldNumberWin_count:
				builder.setWin_count(reader.readInt(fieldNumber));
				break;
			case fieldNumberLose_count:
				builder.setLose_count(reader.readInt(fieldNumber));
				break;
			case fieldNumberPing_count:
				builder.setPing_count(reader.readInt(fieldNumber));
				break;
			case fieldNumberOnline:
				builder.setOnline(reader.readBoolean(fieldNumber));
				break;
			case fieldNumberIngame:
				builder.setIngame(reader.readBoolean(fieldNumber));
				break;
			case fieldNumberOid:
				builder.setOid(reader.readInt(fieldNumber));
				break;
			case fieldNumberLast_login_time:
				builder.setLast_login_time(reader.readLong(fieldNumber));
				break;
			case fieldNumberPortrait:
				builder.setPortrait(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		t_friend_data.unknownTagHandler = unknownTagHandler;
	}

	public static t_friend_data parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static t_friend_data parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static t_friend_data parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}