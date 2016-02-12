package protocol.hallserver {
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
	public dynamic final class t_duration extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BEGIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_duration.begin", "begin", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var begin$field:int;

		private var hasField$0:uint = 0;

		public function clearBegin():void {
			hasField$0 &= 0xfffffffe;
			begin$field = new int();
		}

		public function get hasBegin():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set begin(value:int):void {
			hasField$0 |= 0x1;
			begin$field = value;
		}

		public function get begin():int {
			return begin$field;
		}

		/**
		 *  @private
		 */
		public static const END:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_duration.end", "end", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var end$field:int;

		public function clearEnd():void {
			hasField$0 &= 0xfffffffd;
			end$field = new int();
		}

		public function get hasEnd():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set end(value:int):void {
			hasField$0 |= 0x2;
			end$field = value;
		}

		public function get end():int {
			return end$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBegin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, begin$field);
			}
			if (hasEnd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, end$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var begin$count:uint = 0;
			var end$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (begin$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_duration.begin cannot be set twice.');
					}
					++begin$count;
					this.begin = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (end$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_duration.end cannot be set twice.');
					}
					++end$count;
					this.end = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
