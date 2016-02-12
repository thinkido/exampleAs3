package protocol.gameserver {
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
	public dynamic final class stplayer_info extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.stplayer_info.pid", "pid", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var pid$field:String;

		public function clearPid():void {
			pid$field = null;
		}

		public function get hasPid():Boolean {
			return pid$field != null;
		}

		public function set pid(value:String):void {
			pid$field = value;
		}

		public function get pid():String {
			return pid$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.stplayer_info.name", "name", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const GOLD:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protocol.gameserver.stplayer_info.gold", "gold", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gold$field:Int64;

		public function clearGold():void {
			gold$field = null;
		}

		public function get hasGold():Boolean {
			return gold$field != null;
		}

		public function set gold(value:Int64):void {
			gold$field = value;
		}

		public function get gold():Int64 {
			return gold$field;
		}

		/**
		 *  @private
		 */
		public static const EXP:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protocol.gameserver.stplayer_info.exp", "exp", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp$field:Int64;

		public function clearExp():void {
			exp$field = null;
		}

		public function get hasExp():Boolean {
			return exp$field != null;
		}

		public function set exp(value:Int64):void {
			exp$field = value;
		}

		public function get exp():Int64 {
			return exp$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.stplayer_info.level", "level", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const SEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.stplayer_info.sex", "sex", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sex$field:int;

		public function clearSex():void {
			hasField$0 &= 0xfffffffd;
			sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x2;
			sex$field = value;
		}

		public function get sex():int {
			return sex$field;
		}

		/**
		 *  @private
		 */
		public static const VIP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.stplayer_info.vip", "vip", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip$field:int;

		public function clearVip():void {
			hasField$0 &= 0xfffffffb;
			vip$field = new int();
		}

		public function get hasVip():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set vip(value:int):void {
			hasField$0 |= 0x4;
			vip$field = value;
		}

		public function get vip():int {
			return vip$field;
		}

		/**
		 *  @private
		 */
		public static const PORTRAIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.stplayer_info.portrait", "portrait", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var portrait$field:int;

		public function clearPortrait():void {
			hasField$0 &= 0xfffffff7;
			portrait$field = new int();
		}

		public function get hasPortrait():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set portrait(value:int):void {
			hasField$0 |= 0x8;
			portrait$field = value;
		}

		public function get portrait():int {
			return portrait$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.stplayer_info.id", "id", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.stplayer_info.idtype", "idtype", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, pid$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, gold$field);
			}
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, exp$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, sex$field);
			}
			if (hasVip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vip$field);
			}
			if (hasPortrait) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, portrait$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, idtype$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var pid$count:uint = 0;
			var name$count:uint = 0;
			var gold$count:uint = 0;
			var exp$count:uint = 0;
			var level$count:uint = 0;
			var sex$count:uint = 0;
			var vip$count:uint = 0;
			var portrait$count:uint = 0;
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (pid$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.pid cannot be set twice.');
					}
					++pid$count;
					this.pid = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.gold cannot be set twice.');
					}
					++gold$count;
					this.gold = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 6:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (vip$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.vip cannot be set twice.');
					}
					++vip$count;
					this.vip = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (portrait$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.portrait cannot be set twice.');
					}
					++portrait$count;
					this.portrait = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 11:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: stplayer_info.idtype cannot be set twice.');
					}
					++idtype$count;
					this.idtype = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
