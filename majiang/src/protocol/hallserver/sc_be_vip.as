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
	public dynamic final class sc_be_vip extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DAY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_be_vip.day", "day", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var day$field:int;

		private var hasField$0:uint = 0;

		public function clearDay():void {
			hasField$0 &= 0xfffffffe;
			day$field = new int();
		}

		public function get hasDay():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set day(value:int):void {
			hasField$0 |= 0x1;
			day$field = value;
		}

		public function get day():int {
			return day$field;
		}

		/**
		 *  @private
		 */
		public static const GOLD_COST:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protos.hallserver.sc_be_vip.gold_cost", "goldCost", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gold_cost$field:Int64;

		public function clearGoldCost():void {
			gold_cost$field = null;
		}

		public function get hasGoldCost():Boolean {
			return gold_cost$field != null;
		}

		public function set goldCost(value:Int64):void {
			gold_cost$field = value;
		}

		public function get goldCost():Int64 {
			return gold_cost$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, day$field);
			}
			if (hasGoldCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, gold_cost$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var day$count:uint = 0;
			var gold_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (day$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_be_vip.day cannot be set twice.');
					}
					++day$count;
					this.day = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (gold_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_be_vip.goldCost cannot be set twice.');
					}
					++gold_cost$count;
					this.goldCost = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
