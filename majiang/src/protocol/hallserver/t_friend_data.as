package protocol.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class t_friend_data extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.t_friend_data.id", "id", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var id$field:String;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:String):void {
			id$field = value;
		}

		public function get id():String {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.t_friend_data.idtype", "idtype", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var idtype$field:String;

		public function clearIdtype():void {
			idtype$field = null;
		}

		public function get hasIdtype():Boolean {
			return idtype$field != null;
		}

		public function set idtype(value:String):void {
			idtype$field = value;
		}

		public function get idtype():String {
			return idtype$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.t_friend_data.name", "name", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const GOLD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.gold", "gold", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gold$field:int;

		private var hasField$0:uint = 0;

		public function clearGold():void {
			hasField$0 &= 0xfffffffe;
			gold$field = new int();
		}

		public function get hasGold():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set gold(value:int):void {
			hasField$0 |= 0x1;
			gold$field = value;
		}

		public function get gold():int {
			return gold$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.level", "level", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffd;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x2;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const EXP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.exp", "exp", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp$field:int;

		public function clearExp():void {
			hasField$0 &= 0xfffffffb;
			exp$field = new int();
		}

		public function get hasExp():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set exp(value:int):void {
			hasField$0 |= 0x4;
			exp$field = value;
		}

		public function get exp():int {
			return exp$field;
		}

		/**
		 *  @private
		 */
		public static const SEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.sex", "sex", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sex$field:int;

		public function clearSex():void {
			hasField$0 &= 0xfffffff7;
			sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x8;
			sex$field = value;
		}

		public function get sex():int {
			return sex$field;
		}

		/**
		 *  @private
		 */
		public static const VIP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.vip", "vip", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip$field:int;

		public function clearVip():void {
			hasField$0 &= 0xffffffef;
			vip$field = new int();
		}

		public function get hasVip():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set vip(value:int):void {
			hasField$0 |= 0x10;
			vip$field = value;
		}

		public function get vip():int {
			return vip$field;
		}

		/**
		 *  @private
		 */
		public static const WIN_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.win_count", "winCount", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var win_count$field:int;

		public function clearWinCount():void {
			hasField$0 &= 0xffffffdf;
			win_count$field = new int();
		}

		public function get hasWinCount():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set winCount(value:int):void {
			hasField$0 |= 0x20;
			win_count$field = value;
		}

		public function get winCount():int {
			return win_count$field;
		}

		/**
		 *  @private
		 */
		public static const LOSE_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.lose_count", "loseCount", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lose_count$field:int;

		public function clearLoseCount():void {
			hasField$0 &= 0xffffffbf;
			lose_count$field = new int();
		}

		public function get hasLoseCount():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set loseCount(value:int):void {
			hasField$0 |= 0x40;
			lose_count$field = value;
		}

		public function get loseCount():int {
			return lose_count$field;
		}

		/**
		 *  @private
		 */
		public static const PING_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.ping_count", "pingCount", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ping_count$field:int;

		public function clearPingCount():void {
			hasField$0 &= 0xffffff7f;
			ping_count$field = new int();
		}

		public function get hasPingCount():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set pingCount(value:int):void {
			hasField$0 |= 0x80;
			ping_count$field = value;
		}

		public function get pingCount():int {
			return ping_count$field;
		}

		/**
		 *  @private
		 */
		public static const ONLINE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.t_friend_data.online", "online", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var online$field:Boolean;

		public function clearOnline():void {
			hasField$0 &= 0xfffffeff;
			online$field = new Boolean();
		}

		public function get hasOnline():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set online(value:Boolean):void {
			hasField$0 |= 0x100;
			online$field = value;
		}

		public function get online():Boolean {
			return online$field;
		}

		/**
		 *  @private
		 */
		public static const INGAME:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.t_friend_data.ingame", "ingame", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ingame$field:Boolean;

		public function clearIngame():void {
			hasField$0 &= 0xfffffdff;
			ingame$field = new Boolean();
		}

		public function get hasIngame():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set ingame(value:Boolean):void {
			hasField$0 |= 0x200;
			ingame$field = value;
		}

		public function get ingame():Boolean {
			return ingame$field;
		}

		/**
		 *  @private
		 */
		public static const OID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.oid", "oid", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var oid$field:int;

		public function clearOid():void {
			hasField$0 &= 0xfffffbff;
			oid$field = new int();
		}

		public function get hasOid():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set oid(value:int):void {
			hasField$0 |= 0x400;
			oid$field = value;
		}

		public function get oid():int {
			return oid$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_LOGIN_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protocol.hallserver.t_friend_data.last_login_time", "lastLoginTime", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_login_time$field:Int64;

		public function clearLastLoginTime():void {
			last_login_time$field = null;
		}

		public function get hasLastLoginTime():Boolean {
			return last_login_time$field != null;
		}

		public function set lastLoginTime(value:Int64):void {
			last_login_time$field = value;
		}

		public function get lastLoginTime():Int64 {
			return last_login_time$field;
		}

		/**
		 *  @private
		 */
		public static const PORTRAIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_friend_data.portrait", "portrait", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var portrait$field:int;

		public function clearPortrait():void {
			hasField$0 &= 0xfffff7ff;
			portrait$field = new int();
		}

		public function get hasPortrait():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set portrait(value:int):void {
			hasField$0 |= 0x800;
			portrait$field = value;
		}

		public function get portrait():int {
			return portrait$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, idtype$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, gold$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, exp$field);
			}
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, sex$field);
			}
			if (hasVip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vip$field);
			}
			if (hasWinCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, win_count$field);
			}
			if (hasLoseCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, lose_count$field);
			}
			if (hasPingCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, ping_count$field);
			}
			if (hasOnline) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, online$field);
			}
			if (hasIngame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, ingame$field);
			}
			if (hasOid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, oid$field);
			}
			if (hasLastLoginTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, last_login_time$field);
			}
			if (hasPortrait) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, portrait$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			var name$count:uint = 0;
			var gold$count:uint = 0;
			var level$count:uint = 0;
			var exp$count:uint = 0;
			var sex$count:uint = 0;
			var vip$count:uint = 0;
			var win_count$count:uint = 0;
			var lose_count$count:uint = 0;
			var ping_count$count:uint = 0;
			var online$count:uint = 0;
			var ingame$count:uint = 0;
			var oid$count:uint = 0;
			var last_login_time$count:uint = 0;
			var portrait$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.idtype cannot be set twice.');
					}
					++idtype$count;
					this.idtype = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.gold cannot be set twice.');
					}
					++gold$count;
					this.gold = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (vip$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.vip cannot be set twice.');
					}
					++vip$count;
					this.vip = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (win_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.winCount cannot be set twice.');
					}
					++win_count$count;
					this.winCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (lose_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.loseCount cannot be set twice.');
					}
					++lose_count$count;
					this.loseCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (ping_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.pingCount cannot be set twice.');
					}
					++ping_count$count;
					this.pingCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (online$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.online cannot be set twice.');
					}
					++online$count;
					this.online = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 13:
					if (ingame$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.ingame cannot be set twice.');
					}
					++ingame$count;
					this.ingame = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 14:
					if (oid$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.oid cannot be set twice.');
					}
					++oid$count;
					this.oid = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 15:
					if (last_login_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.lastLoginTime cannot be set twice.');
					}
					++last_login_time$count;
					this.lastLoginTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 16:
					if (portrait$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_friend_data.portrait cannot be set twice.');
					}
					++portrait$count;
					this.portrait = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
