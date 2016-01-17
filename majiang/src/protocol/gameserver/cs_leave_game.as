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
	public dynamic final class cs_leave_game extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WHY:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.gameserver.cs_leave_game.why", "why", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var why$field:String;

		public function clearWhy():void {
			why$field = null;
		}

		public function get hasWhy():Boolean {
			return why$field != null;
		}

		public function set why(value:String):void {
			why$field = value;
		}

		public function get why():String {
			return why$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWhy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, why$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var why$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (why$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_leave_game.why cannot be set twice.');
					}
					++why$count;
					this.why = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
