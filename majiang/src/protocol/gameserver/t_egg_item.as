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
	public dynamic final class t_egg_item extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EGG_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.t_egg_item.egg_index", "eggIndex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const EGG_AVAILABLE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.gameserver.t_egg_item.egg_available", "eggAvailable", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var egg_available$field:Boolean;

		public function clearEggAvailable():void {
			hasField$0 &= 0xfffffffd;
			egg_available$field = new Boolean();
		}

		public function get hasEggAvailable():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set eggAvailable(value:Boolean):void {
			hasField$0 |= 0x2;
			egg_available$field = value;
		}

		public function get eggAvailable():Boolean {
			return egg_available$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEggIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, egg_index$field);
			}
			if (hasEggAvailable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, egg_available$field);
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
			var egg_available$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (egg_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_egg_item.eggIndex cannot be set twice.');
					}
					++egg_index$count;
					this.eggIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (egg_available$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_egg_item.eggAvailable cannot be set twice.');
					}
					++egg_available$count;
					this.eggAvailable = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
