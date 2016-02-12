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
	public dynamic final class cs_confirm_be_invited_company extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ACCEPTED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.gameserver.cs_confirm_be_invited_company.accepted", "accepted", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accepted$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearAccepted():void {
			hasField$0 &= 0xfffffffe;
			accepted$field = new Boolean();
		}

		public function get hasAccepted():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set accepted(value:Boolean):void {
			hasField$0 |= 0x1;
			accepted$field = value;
		}

		public function get accepted():Boolean {
			return accepted$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.cs_confirm_be_invited_company.id", "id", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.cs_confirm_be_invited_company.idtype", "idtype", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const TO_HOST:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.cs_confirm_be_invited_company.to_host", "toHost", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var to_host$field:String;

		public function clearToHost():void {
			to_host$field = null;
		}

		public function get hasToHost():Boolean {
			return to_host$field != null;
		}

		public function set toHost(value:String):void {
			to_host$field = value;
		}

		public function get toHost():String {
			return to_host$field;
		}

		/**
		 *  @private
		 */
		public static const TO_PORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.cs_confirm_be_invited_company.to_port", "toPort", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var to_port$field:int;

		public function clearToPort():void {
			hasField$0 &= 0xfffffffd;
			to_port$field = new int();
		}

		public function get hasToPort():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set toPort(value:int):void {
			hasField$0 |= 0x2;
			to_port$field = value;
		}

		public function get toPort():int {
			return to_port$field;
		}

		/**
		 *  @private
		 */
		public static const TO_TABLE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.cs_confirm_be_invited_company.to_table", "toTable", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var to_table$field:int;

		public function clearToTable():void {
			hasField$0 &= 0xfffffffb;
			to_table$field = new int();
		}

		public function get hasToTable():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set toTable(value:int):void {
			hasField$0 |= 0x4;
			to_table$field = value;
		}

		public function get toTable():int {
			return to_table$field;
		}

		/**
		 *  @private
		 */
		public static const TO_SEAT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.cs_confirm_be_invited_company.to_seat", "toSeat", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var to_seat$field:int;

		public function clearToSeat():void {
			hasField$0 &= 0xfffffff7;
			to_seat$field = new int();
		}

		public function get hasToSeat():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set toSeat(value:int):void {
			hasField$0 |= 0x8;
			to_seat$field = value;
		}

		public function get toSeat():int {
			return to_seat$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAccepted) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, accepted$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, idtype$field);
			}
			if (hasToHost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, to_host$field);
			}
			if (hasToPort) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, to_port$field);
			}
			if (hasToTable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, to_table$field);
			}
			if (hasToSeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, to_seat$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var accepted$count:uint = 0;
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			var to_host$count:uint = 0;
			var to_port$count:uint = 0;
			var to_table$count:uint = 0;
			var to_seat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (accepted$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_confirm_be_invited_company.accepted cannot be set twice.');
					}
					++accepted$count;
					this.accepted = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_confirm_be_invited_company.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_confirm_be_invited_company.idtype cannot be set twice.');
					}
					++idtype$count;
					this.idtype = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (to_host$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_confirm_be_invited_company.toHost cannot be set twice.');
					}
					++to_host$count;
					this.toHost = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (to_port$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_confirm_be_invited_company.toPort cannot be set twice.');
					}
					++to_port$count;
					this.toPort = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (to_table$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_confirm_be_invited_company.toTable cannot be set twice.');
					}
					++to_table$count;
					this.toTable = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (to_seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_confirm_be_invited_company.toSeat cannot be set twice.');
					}
					++to_seat$count;
					this.toSeat = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
