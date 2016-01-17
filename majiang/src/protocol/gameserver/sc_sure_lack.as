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
	public dynamic final class sc_sure_lack extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIMEOUT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_sure_lack.timeout", "timeout", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var timeout$field:int;

		private var hasField$0:uint = 0;

		public function clearTimeout():void {
			hasField$0 &= 0xfffffffe;
			timeout$field = new int();
		}

		public function get hasTimeout():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set timeout(value:int):void {
			hasField$0 |= 0x1;
			timeout$field = value;
		}

		public function get timeout():int {
			return timeout$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTimeout) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, timeout$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var timeout$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (timeout$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_sure_lack.timeout cannot be set twice.');
					}
					++timeout$count;
					this.timeout = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
