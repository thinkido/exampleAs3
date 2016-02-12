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
	public dynamic final class st_money_transfer extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PERSON:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.st_money_transfer.person", "person", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var person$field:int;

		private var hasField$0:uint = 0;

		public function clearPerson():void {
			hasField$0 &= 0xfffffffe;
			person$field = new int();
		}

		public function get hasPerson():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set person(value:int):void {
			hasField$0 |= 0x1;
			person$field = value;
		}

		public function get person():int {
			return person$field;
		}

		/**
		 *  @private
		 */
		public static const ATM:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.st_money_transfer.atm", "atm", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var atm$field:int;

		public function clearAtm():void {
			hasField$0 &= 0xfffffffd;
			atm$field = new int();
		}

		public function get hasAtm():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set atm(value:int):void {
			hasField$0 |= 0x2;
			atm$field = value;
		}

		public function get atm():int {
			return atm$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.st_money_transfer.money", "money", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:int;

		public function clearMoney():void {
			hasField$0 &= 0xfffffffb;
			money$field = new int();
		}

		public function get hasMoney():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set money(value:int):void {
			hasField$0 |= 0x4;
			money$field = value;
		}

		public function get money():int {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const TRANSFER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.st_money_transfer.transfer", "transfer", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var transfer$field:int;

		public function clearTransfer():void {
			hasField$0 &= 0xfffffff7;
			transfer$field = new int();
		}

		public function get hasTransfer():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set transfer(value:int):void {
			hasField$0 |= 0x8;
			transfer$field = value;
		}

		public function get transfer():int {
			return transfer$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPerson) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, person$field);
			}
			if (hasAtm) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, atm$field);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, money$field);
			}
			if (hasTransfer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, transfer$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var person$count:uint = 0;
			var atm$count:uint = 0;
			var money$count:uint = 0;
			var transfer$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (person$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_money_transfer.person cannot be set twice.');
					}
					++person$count;
					this.person = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (atm$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_money_transfer.atm cannot be set twice.');
					}
					++atm$count;
					this.atm = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_money_transfer.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (transfer$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_money_transfer.transfer cannot be set twice.');
					}
					++transfer$count;
					this.transfer = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
