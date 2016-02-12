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
	public dynamic final class sc_enter_place extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HOST:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_enter_place.host", "host", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var host$field:String;

		public function clearHost():void {
			host$field = null;
		}

		public function get hasHost():Boolean {
			return host$field != null;
		}

		public function set host(value:String):void {
			host$field = value;
		}

		public function get host():String {
			return host$field;
		}

		/**
		 *  @private
		 */
		public static const PORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_enter_place.port", "port", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var port$field:int;

		private var hasField$0:uint = 0;

		public function clearPort():void {
			hasField$0 &= 0xfffffffe;
			port$field = new int();
		}

		public function get hasPort():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set port(value:int):void {
			hasField$0 |= 0x1;
			port$field = value;
		}

		public function get port():int {
			return port$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, host$field);
			}
			if (hasPort) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, port$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var host$count:uint = 0;
			var port$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (host$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_place.host cannot be set twice.');
					}
					++host$count;
					this.host = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (port$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_place.port cannot be set twice.');
					}
					++port$count;
					this.port = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
