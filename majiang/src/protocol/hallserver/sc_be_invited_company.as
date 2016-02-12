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
	public dynamic final class sc_be_invited_company extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FROM_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_be_invited_company.from_name", "fromName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var from_name$field:String;

		public function clearFromName():void {
			from_name$field = null;
		}

		public function get hasFromName():Boolean {
			return from_name$field != null;
		}

		public function set fromName(value:String):void {
			from_name$field = value;
		}

		public function get fromName():String {
			return from_name$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_HOST:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_be_invited_company.from_host", "fromHost", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var from_host$field:String;

		public function clearFromHost():void {
			from_host$field = null;
		}

		public function get hasFromHost():Boolean {
			return from_host$field != null;
		}

		public function set fromHost(value:String):void {
			from_host$field = value;
		}

		public function get fromHost():String {
			return from_host$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_PORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_be_invited_company.from_port", "fromPort", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_port$field:int;

		private var hasField$0:uint = 0;

		public function clearFromPort():void {
			hasField$0 &= 0xfffffffe;
			from_port$field = new int();
		}

		public function get hasFromPort():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set fromPort(value:int):void {
			hasField$0 |= 0x1;
			from_port$field = value;
		}

		public function get fromPort():int {
			return from_port$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_TABLE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_be_invited_company.from_table", "fromTable", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_table$field:int;

		public function clearFromTable():void {
			hasField$0 &= 0xfffffffd;
			from_table$field = new int();
		}

		public function get hasFromTable():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set fromTable(value:int):void {
			hasField$0 |= 0x2;
			from_table$field = value;
		}

		public function get fromTable():int {
			return from_table$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_SEAT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_be_invited_company.from_seat", "fromSeat", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_seat$field:int;

		public function clearFromSeat():void {
			hasField$0 &= 0xfffffffb;
			from_seat$field = new int();
		}

		public function get hasFromSeat():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set fromSeat(value:int):void {
			hasField$0 |= 0x4;
			from_seat$field = value;
		}

		public function get fromSeat():int {
			return from_seat$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_be_invited_company.from_id", "fromId", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var from_id$field:String;

		public function clearFromId():void {
			from_id$field = null;
		}

		public function get hasFromId():Boolean {
			return from_id$field != null;
		}

		public function set fromId(value:String):void {
			from_id$field = value;
		}

		public function get fromId():String {
			return from_id$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_be_invited_company.from_idtype", "fromIdtype", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var from_idtype$field:String;

		public function clearFromIdtype():void {
			from_idtype$field = null;
		}

		public function get hasFromIdtype():Boolean {
			return from_idtype$field != null;
		}

		public function set fromIdtype(value:String):void {
			from_idtype$field = value;
		}

		public function get fromIdtype():String {
			return from_idtype$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFromName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, from_name$field);
			}
			if (hasFromHost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, from_host$field);
			}
			if (hasFromPort) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, from_port$field);
			}
			if (hasFromTable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, from_table$field);
			}
			if (hasFromSeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, from_seat$field);
			}
			if (hasFromId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, from_id$field);
			}
			if (hasFromIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, from_idtype$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var from_name$count:uint = 0;
			var from_host$count:uint = 0;
			var from_port$count:uint = 0;
			var from_table$count:uint = 0;
			var from_seat$count:uint = 0;
			var from_id$count:uint = 0;
			var from_idtype$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (from_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_be_invited_company.fromName cannot be set twice.');
					}
					++from_name$count;
					this.fromName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (from_host$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_be_invited_company.fromHost cannot be set twice.');
					}
					++from_host$count;
					this.fromHost = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (from_port$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_be_invited_company.fromPort cannot be set twice.');
					}
					++from_port$count;
					this.fromPort = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (from_table$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_be_invited_company.fromTable cannot be set twice.');
					}
					++from_table$count;
					this.fromTable = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (from_seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_be_invited_company.fromSeat cannot be set twice.');
					}
					++from_seat$count;
					this.fromSeat = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (from_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_be_invited_company.fromId cannot be set twice.');
					}
					++from_id$count;
					this.fromId = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 7:
					if (from_idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_be_invited_company.fromIdtype cannot be set twice.');
					}
					++from_idtype$count;
					this.fromIdtype = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
