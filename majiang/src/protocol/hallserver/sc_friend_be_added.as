package protocol.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.hallserver.st_friend_be_added;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_friend_be_added extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LISTS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.hallserver.sc_friend_be_added.lists", "lists", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.hallserver.st_friend_be_added; });

		[ArrayElementType("protocol.hallserver.st_friend_be_added")]
		public var lists:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var lists$index:uint = 0; lists$index < this.lists.length; ++lists$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.lists[lists$index]);
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
					this.lists.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.hallserver.st_friend_be_added()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
