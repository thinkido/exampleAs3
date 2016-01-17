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
	public dynamic final class sc_broadcast_msg extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MSG:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.sc_broadcast_msg.msg", "msg", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var msg$field:String;

		public function clearMsg():void {
			msg$field = null;
		}

		public function get hasMsg():Boolean {
			return msg$field != null;
		}

		public function set msg(value:String):void {
			msg$field = value;
		}

		public function get msg():String {
			return msg$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, msg$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var msg$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (msg$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_broadcast_msg.msg cannot be set twice.');
					}
					++msg$count;
					this.msg = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
