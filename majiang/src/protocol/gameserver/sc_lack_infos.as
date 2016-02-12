package protocol.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.gameserver.st_lack_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_lack_infos extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const INFOS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_lack_infos.infos", "infos", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_lack_info; });

		[ArrayElementType("protocol.gameserver.st_lack_info")]
		public var infos:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var infos$index:uint = 0; infos$index < this.infos.length; ++infos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.infos[infos$index]);
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
					this.infos.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_lack_info()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
