package protos.hallserver {
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
	public dynamic final class t_rank_data extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_rank_data.oid", "oid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var oid$field:int;

		private var hasField$0:uint = 0;

		public function clearOid():void {
			hasField$0 &= 0xfffffffe;
			oid$field = new int();
		}

		public function get hasOid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set oid(value:int):void {
			hasField$0 |= 0x1;
			oid$field = value;
		}

		public function get oid():int {
			return oid$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.t_rank_data.id", "id", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.t_rank_data.idtype", "idtype", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.t_rank_data.name", "name", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const RANK:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_rank_data.rank", "rank", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank$field:int;

		public function clearRank():void {
			hasField$0 &= 0xfffffffd;
			rank$field = new int();
		}

		public function get hasRank():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set rank(value:int):void {
			hasField$0 |= 0x2;
			rank$field = value;
		}

		public function get rank():int {
			return rank$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE_INT_1:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_rank_data.value_int_1", "valueInt_1", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var value_int_1$field:int;

		public function clearValueInt_1():void {
			hasField$0 &= 0xfffffffb;
			value_int_1$field = new int();
		}

		public function get hasValueInt_1():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set valueInt_1(value:int):void {
			hasField$0 |= 0x4;
			value_int_1$field = value;
		}

		public function get valueInt_1():int {
			return value_int_1$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE_INT_2:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_rank_data.value_int_2", "valueInt_2", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var value_int_2$field:int;

		public function clearValueInt_2():void {
			hasField$0 &= 0xfffffff7;
			value_int_2$field = new int();
		}

		public function get hasValueInt_2():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set valueInt_2(value:int):void {
			hasField$0 |= 0x8;
			value_int_2$field = value;
		}

		public function get valueInt_2():int {
			return value_int_2$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE_STR:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.t_rank_data.value_str", "valueStr", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var value_str$field:String;

		public function clearValueStr():void {
			value_str$field = null;
		}

		public function get hasValueStr():Boolean {
			return value_str$field != null;
		}

		public function set valueStr(value:String):void {
			value_str$field = value;
		}

		public function get valueStr():String {
			return value_str$field;
		}

		/**
		 *  @private
		 */
		public static const TREND:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_rank_data.trend", "trend", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var trend$field:int;

		public function clearTrend():void {
			hasField$0 &= 0xffffffef;
			trend$field = new int();
		}

		public function get hasTrend():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set trend(value:int):void {
			hasField$0 |= 0x10;
			trend$field = value;
		}

		public function get trend():int {
			return trend$field;
		}

		/**
		 *  @private
		 */
		public static const VIP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_rank_data.vip", "vip", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip$field:int;

		public function clearVip():void {
			hasField$0 &= 0xffffffdf;
			vip$field = new int();
		}

		public function get hasVip():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set vip(value:int):void {
			hasField$0 |= 0x20;
			vip$field = value;
		}

		public function get vip():int {
			return vip$field;
		}

		/**
		 *  @private
		 */
		public static const PORTRAIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_rank_data.portrait", "portrait", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var portrait$field:int;

		public function clearPortrait():void {
			hasField$0 &= 0xffffffbf;
			portrait$field = new int();
		}

		public function get hasPortrait():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set portrait(value:int):void {
			hasField$0 |= 0x40;
			portrait$field = value;
		}

		public function get portrait():int {
			return portrait$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, oid$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, idtype$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, rank$field);
			}
			if (hasValueInt_1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, value_int_1$field);
			}
			if (hasValueInt_2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, value_int_2$field);
			}
			if (hasValueStr) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, value_str$field);
			}
			if (hasTrend) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, trend$field);
			}
			if (hasVip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vip$field);
			}
			if (hasPortrait) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
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
			var oid$count:uint = 0;
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			var name$count:uint = 0;
			var rank$count:uint = 0;
			var value_int_1$count:uint = 0;
			var value_int_2$count:uint = 0;
			var value_str$count:uint = 0;
			var trend$count:uint = 0;
			var vip$count:uint = 0;
			var portrait$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (oid$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.oid cannot be set twice.');
					}
					++oid$count;
					this.oid = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.idtype cannot be set twice.');
					}
					++idtype$count;
					this.idtype = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.rank cannot be set twice.');
					}
					++rank$count;
					this.rank = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (value_int_1$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.valueInt_1 cannot be set twice.');
					}
					++value_int_1$count;
					this.valueInt_1 = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (value_int_2$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.valueInt_2 cannot be set twice.');
					}
					++value_int_2$count;
					this.valueInt_2 = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (value_str$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.valueStr cannot be set twice.');
					}
					++value_str$count;
					this.valueStr = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 9:
					if (trend$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.trend cannot be set twice.');
					}
					++trend$count;
					this.trend = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (vip$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.vip cannot be set twice.');
					}
					++vip$count;
					this.vip = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (portrait$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_rank_data.portrait cannot be set twice.');
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
