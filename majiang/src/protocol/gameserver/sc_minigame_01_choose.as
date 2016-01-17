package protos.gameserver {
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
	public dynamic final class sc_minigame_01_choose extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RIGHT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protos.gameserver.sc_minigame_01_choose.right", "right", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var right$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearRight():void {
			hasField$0 &= 0xfffffffe;
			right$field = new Boolean();
		}

		public function get hasRight():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set right(value:Boolean):void {
			hasField$0 |= 0x1;
			right$field = value;
		}

		public function get right():Boolean {
			return right$field;
		}

		/**
		 *  @private
		 */
		public static const CURPOINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_minigame_01_choose.curPoint", "curPoint", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
			if (hasRight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, right$field);
			}
			if (hasCurPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
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
			var right$count:uint = 0;
			var curPoint$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (right$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_01_choose.right cannot be set twice.');
					}
					++right$count;
					this.right = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (curPoint$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_01_choose.curPoint cannot be set twice.');
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
