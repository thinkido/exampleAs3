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
	public dynamic final class sc_minigame_01_start extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.gameserver.sc_minigame_01_start.result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ERROR:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.sc_minigame_01_start.error", "error", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var error$field:String;

		public function clearError():void {
			error$field = null;
		}

		public function get hasError():Boolean {
			return error$field != null;
		}

		public function set error(value:String):void {
			error$field = value;
		}

		public function get error():String {
			return error$field;
		}

		/**
		 *  @private
		 */
		public static const CURPOINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_minigame_01_start.curPoint", "curPoint", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var curPoint$field:int;

		public function clearCurPoint():void {
			hasField$0 &= 0xfffffffd;
			curPoint$field = new int();
		}

		public function get hasCurPoint():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set curPoint(value:int):void {
			hasField$0 |= 0x2;
			curPoint$field = value;
		}

		public function get curPoint():int {
			return curPoint$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasResult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, result$field);
			}
			if (hasError) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, error$field);
			}
			if (hasCurPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, curPoint$field);
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
			var error$count:uint = 0;
			var curPoint$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_01_start.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (error$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_01_start.error cannot be set twice.');
					}
					++error$count;
					this.error = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (curPoint$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_01_start.curPoint cannot be set twice.');
					}
					++curPoint$count;
					this.curPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
