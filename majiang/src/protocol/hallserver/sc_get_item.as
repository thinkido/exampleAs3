package protos.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.hallserver.t_myitem;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_get_item extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GOLD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_get_item.gold", "gold", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ITEMS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.hallserver.sc_get_item.items", "items", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.hallserver.t_myitem; });

		[ArrayElementType("protos.hallserver.t_myitem")]
		public var items:Array = [];

		/**
		 *  @private
		 */
		public static const GOLD_COST:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protos.hallserver.sc_get_item.gold_cost", "goldCost", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
			if (hasGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, gold$field);
			}
			for (var items$index:uint = 0; items$index < this.items.length; ++items$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.items[items$index]);
			}
			if (hasGoldCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
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
			var gold$count:uint = 0;
			var gold_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_get_item.gold cannot be set twice.');
					}
					++gold$count;
					this.gold = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					this.items.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protos.hallserver.t_myitem()));
					break;
				case 3:
					if (gold_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_get_item.goldCost cannot be set twice.');
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
