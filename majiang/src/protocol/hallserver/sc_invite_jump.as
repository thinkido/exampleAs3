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
	public dynamic final class sc_invite_jump extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_invite_jump.result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var result$field:int;

		private var hasField$0:uint = 0;

		public function clearResult():void {
			hasField$0 &= 0xfffffffe;
			result$field = new int();
		}

		public function get hasResult():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set result(value:int):void {
			hasField$0 |= 0x1;
			result$field = value;
		}

		public function get result():int {
			return result$field;
		}

		/**
		 *  @private
		 */
		public static const TO_HOST:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.sc_invite_jump.to_host", "toHost", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const TO_PORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_invite_jump.to_port", "toPort", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TO_TABLE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_invite_jump.to_table", "toTable", (4 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TO_SEAT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_invite_jump.to_seat", "toSeat", (5 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const INVITER_ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.sc_invite_jump.inviter_id", "inviterId", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var inviter_id$field:String;

		public function clearInviterId():void {
			inviter_id$field = null;
		}

		public function get hasInviterId():Boolean {
			return inviter_id$field != null;
		}

		public function set inviterId(value:String):void {
			inviter_id$field = value;
		}

		public function get inviterId():String {
			return inviter_id$field;
		}

		/**
		 *  @private
		 */
		public static const INVITER_IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.sc_invite_jump.inviter_idtype", "inviterIdtype", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var inviter_idtype$field:String;

		public function clearInviterIdtype():void {
			inviter_idtype$field = null;
		}

		public function get hasInviterIdtype():Boolean {
			return inviter_idtype$field != null;
		}

		public function set inviterIdtype(value:String):void {
			inviter_idtype$field = value;
		}

		public function get inviterIdtype():String {
			return inviter_idtype$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasResult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, result$field);
			}
			if (hasToHost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, to_host$field);
			}
			if (hasToPort) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, to_port$field);
			}
			if (hasToTable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, to_table$field);
			}
			if (hasToSeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, to_seat$field);
			}
			if (hasInviterId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, inviter_id$field);
			}
			if (hasInviterIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, inviter_idtype$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var result$count:uint = 0;
			var to_host$count:uint = 0;
			var to_port$count:uint = 0;
			var to_table$count:uint = 0;
			var to_seat$count:uint = 0;
			var inviter_id$count:uint = 0;
			var inviter_idtype$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_invite_jump.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (to_host$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_invite_jump.toHost cannot be set twice.');
					}
					++to_host$count;
					this.toHost = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (to_port$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_invite_jump.toPort cannot be set twice.');
					}
					++to_port$count;
					this.toPort = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (to_table$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_invite_jump.toTable cannot be set twice.');
					}
					++to_table$count;
					this.toTable = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (to_seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_invite_jump.toSeat cannot be set twice.');
					}
					++to_seat$count;
					this.toSeat = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (inviter_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_invite_jump.inviterId cannot be set twice.');
					}
					++inviter_id$count;
					this.inviterId = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 7:
					if (inviter_idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_invite_jump.inviterIdtype cannot be set twice.');
					}
					++inviter_idtype$count;
					this.inviterIdtype = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
