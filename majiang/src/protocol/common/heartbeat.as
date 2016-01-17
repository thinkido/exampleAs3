package protos.common {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.common.sc_protocol_pack;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class heartbeat extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NOOP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.common.heartbeat.noop", "noop", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var noop$field:int;

		private var hasField$0:uint = 0;

		public function clearNoop():void {
			hasField$0 &= 0xfffffffe;
			noop$field = new int();
		}

		public function get hasNoop():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set noop(value:int):void {
			hasField$0 |= 0x1;
			noop$field = value;
		}

		public function get noop():int {
			return noop$field;
		}

		/**
		 *  @private
		 */
		public static const VVV:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.common.heartbeat.vvv", "vvv", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.common.sc_protocol_pack; });

		[ArrayElementType("protos.common.sc_protocol_pack")]
		public var vvv:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasNoop) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, noop$field);
			}
			for (var vvv$index:uint = 0; vvv$index < this.vvv.length; ++vvv$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.vvv[vvv$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var noop$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (noop$count != 0) {
						throw new flash.errors.IOError('Bad data format: heartbeat.noop cannot be set twice.');
					}
					++noop$count;
					this.noop = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					this.vvv.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protos.common.sc_protocol_pack()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
