package protos.gameserver {
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
	public dynamic final class sc_gold_reset extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GOLD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_gold_reset.gold", "gold", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TOTAL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_gold_reset.total", "total", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total$field:int;

		public function clearTotal():void {
			hasField$0 &= 0xfffffffd;
			total$field = new int();
		}

		public function get hasTotal():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set total(value:int):void {
			hasField$0 |= 0x2;
			total$field = value;
		}

		public function get total():int {
			return total$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, gold$field);
			}
			if (hasTotal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, total$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gold$count:uint = 0;
			var total$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_gold_reset.gold cannot be set twice.');
					}
					++gold$count;
					this.gold = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (total$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_gold_reset.total cannot be set twice.');
					}
					++total$count;
					this.total = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
