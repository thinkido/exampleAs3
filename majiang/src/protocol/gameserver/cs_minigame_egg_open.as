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
	public dynamic final class cs_minigame_egg_open extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EGG_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.cs_minigame_egg_open.egg_index", "eggIndex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var egg_index$field:int;

		private var hasField$0:uint = 0;

		public function clearEggIndex():void {
			hasField$0 &= 0xfffffffe;
			egg_index$field = new int();
		}

		public function get hasEggIndex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set eggIndex(value:int):void {
			hasField$0 |= 0x1;
			egg_index$field = value;
		}

		public function get eggIndex():int {
			return egg_index$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEggIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, egg_index$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var egg_index$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (egg_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_minigame_egg_open.eggIndex cannot be set twice.');
					}
					++egg_index$count;
					this.eggIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
