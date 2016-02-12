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
	public dynamic final class cs_inspect_player extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.cs_inspect_player.pid", "pid", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var pid$field:String;

		public function clearPid():void {
			pid$field = null;
		}

		public function get hasPid():Boolean {
			return pid$field != null;
		}

		public function set pid(value:String):void {
			pid$field = value;
		}

		public function get pid():String {
			return pid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, pid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var pid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (pid$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_inspect_player.pid cannot be set twice.');
					}
					++pid$count;
					this.pid = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
