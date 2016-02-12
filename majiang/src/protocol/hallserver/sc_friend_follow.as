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
	public dynamic final class sc_friend_follow extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_friend_follow.result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var result$field:int;

		private var hasField$0:uint = 0;

		public function clearResult():void {
			hasField$0 &= 0xfffffffe;
			result$field = new int();
		}

		public function get hasResult():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set result(value:int):void {
			hasField$0 |= 0x1;
			result$field = value;
		}

		public function get result():int {
			return result$field;
		}

		/**
		 *  @private
		 */
		public static const HOST:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_friend_follow.host", "host", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const PORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_friend_follow.port", "port", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var port$field:int;

		public function clearPort():void {
			hasField$0 &= 0xfffffffd;
			port$field = new int();
		}

		public function get hasPort():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set port(value:int):void {
			hasField$0 |= 0x2;
			port$field = value;
		}

		public function get port():int {
			return port$field;
		}

		/**
		 *  @private
		 */
		public static const TABLE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_friend_follow.table", "table", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var table$field:int;

		public function clearTable():void {
			hasField$0 &= 0xfffffffb;
			table$field = new int();
		}

		public function get hasTable():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set table(value:int):void {
			hasField$0 |= 0x4;
			table$field = value;
		}

		public function get table():int {
			return table$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasResult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, result$field);
			}
			if (hasHost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, host$field);
			}
			if (hasPort) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, port$field);
			}
			if (hasTable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, table$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var result$count:uint = 0;
			var host$count:uint = 0;
			var port$count:uint = 0;
			var table$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_follow.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (host$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_follow.host cannot be set twice.');
					}
					++host$count;
					this.host = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (port$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_follow.port cannot be set twice.');
					}
					++port$count;
					this.port = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (table$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_follow.table cannot be set twice.');
					}
					++table$count;
					this.table = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
