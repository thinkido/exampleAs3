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
	public dynamic final class sc_minigame_01_done extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.gameserver.sc_minigame_01_done.result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var result$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearResult():void {
			hasField$0 &= 0xfffffffe;
			result$field = new Boolean();
		}

		public function get hasResult():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set result(value:Boolean):void {
			hasField$0 |= 0x1;
			result$field = value;
		}

		public function get result():Boolean {
			return result$field;
		}

		/**
		 *  @private
		 */
		public static const EARNPOINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_minigame_01_done.earnPoint", "earnPoint", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var earnPoint$field:int;

		public function clearEarnPoint():void {
			hasField$0 &= 0xfffffffd;
			earnPoint$field = new int();
		}

		public function get hasEarnPoint():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set earnPoint(value:int):void {
			hasField$0 |= 0x2;
			earnPoint$field = value;
		}

		public function get earnPoint():int {
			return earnPoint$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasResult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, result$field);
			}
			if (hasEarnPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, earnPoint$field);
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
			var earnPoint$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_01_done.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (earnPoint$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_01_done.earnPoint cannot be set twice.');
					}
					++earnPoint$count;
					this.earnPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
