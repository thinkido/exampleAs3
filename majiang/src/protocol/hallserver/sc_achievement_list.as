package protos.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.hallserver.st_achievement;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_achievement_list extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LIST:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.hallserver.sc_achievement_list.list", "list", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.hallserver.st_achievement; });

		[ArrayElementType("protos.hallserver.st_achievement")]
		public var list:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var list$index:uint = 0; list$index < this.list.length; ++list$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.list[list$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.list.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protos.hallserver.st_achievement()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
