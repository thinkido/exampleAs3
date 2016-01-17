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
	public dynamic final class cs_minigame_01_choose extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BIG:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protos.gameserver.cs_minigame_01_choose.big", "big", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var big$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearBig():void {
			hasField$0 &= 0xfffffffe;
			big$field = new Boolean();
		}

		public function get hasBig():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set big(value:Boolean):void {
			hasField$0 |= 0x1;
			big$field = value;
		}

		public function get big():Boolean {
			return big$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, big$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var big$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (big$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_minigame_01_choose.big cannot be set twice.');
					}
					++big$count;
					this.big = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
