package protocol.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.hallserver.t_rank_data;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_rank_list extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WINDATA:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.hallserver.sc_rank_list.winData", "winData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.hallserver.t_rank_data; });

		[ArrayElementType("protocol.hallserver.t_rank_data")]
		public var winData:Array = [];

		/**
		 *  @private
		 */
		public static const COINDATA:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.hallserver.sc_rank_list.coinData", "coinData", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.hallserver.t_rank_data; });

		[ArrayElementType("protocol.hallserver.t_rank_data")]
		public var coinData:Array = [];

		/**
		 *  @private
		 */
		public static const EXPDATA:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.hallserver.sc_rank_list.expData", "expData", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.hallserver.t_rank_data; });

		[ArrayElementType("protocol.hallserver.t_rank_data")]
		public var expData:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var winData$index:uint = 0; winData$index < this.winData.length; ++winData$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.winData[winData$index]);
			}
			for (var coinData$index:uint = 0; coinData$index < this.coinData.length; ++coinData$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.coinData[coinData$index]);
			}
			for (var expData$index:uint = 0; expData$index < this.expData.length; ++expData$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.expData[expData$index]);
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
					this.winData.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.hallserver.t_rank_data()));
					break;
				case 2:
					this.coinData.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.hallserver.t_rank_data()));
					break;
				case 3:
					this.expData.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.hallserver.t_rank_data()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
