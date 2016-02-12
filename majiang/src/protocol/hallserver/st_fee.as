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
	public dynamic final class st_fee extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FEE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.st_fee.fee_id", "feeId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fee_id$field:int;

		private var hasField$0:uint = 0;

		public function clearFeeId():void {
			hasField$0 &= 0xfffffffe;
			fee_id$field = new int();
		}

		public function get hasFeeId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set feeId(value:int):void {
			hasField$0 |= 0x1;
			fee_id$field = value;
		}

		public function get feeId():int {
			return fee_id$field;
		}

		/**
		 *  @private
		 */
		public static const PHONE_NUMBER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.st_fee.phone_number", "phoneNumber", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var phone_number$field:String;

		public function clearPhoneNumber():void {
			phone_number$field = null;
		}

		public function get hasPhoneNumber():Boolean {
			return phone_number$field != null;
		}

		public function set phoneNumber(value:String):void {
			phone_number$field = value;
		}

		public function get phoneNumber():String {
			return phone_number$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.st_fee.time", "time", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:int;

		public function clearTime():void {
			hasField$0 &= 0xfffffffd;
			time$field = new int();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set time(value:int):void {
			hasField$0 |= 0x2;
			time$field = value;
		}

		public function get time():int {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const STATUS:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.st_fee.status", "status", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var status$field:int;

		public function clearStatus():void {
			hasField$0 &= 0xfffffffb;
			status$field = new int();
		}

		public function get hasStatus():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set status(value:int):void {
			hasField$0 |= 0x4;
			status$field = value;
		}

		public function get status():int {
			return status$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFeeId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fee_id$field);
			}
			if (hasPhoneNumber) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, phone_number$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, time$field);
			}
			if (hasStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, status$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var fee_id$count:uint = 0;
			var phone_number$count:uint = 0;
			var time$count:uint = 0;
			var status$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (fee_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_fee.feeId cannot be set twice.');
					}
					++fee_id$count;
					this.feeId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (phone_number$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_fee.phoneNumber cannot be set twice.');
					}
					++phone_number$count;
					this.phoneNumber = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_fee.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (status$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_fee.status cannot be set twice.');
					}
					++status$count;
					this.status = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
