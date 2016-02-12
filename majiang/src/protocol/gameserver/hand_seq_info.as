package protocol.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.gameserver.st_hand_seq;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class hand_seq_info extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.hand_seq_info.seat_index", "seatIndex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var seat_index$field:int;

		private var hasField$0:uint = 0;

		public function clearSeatIndex():void {
			hasField$0 &= 0xfffffffe;
			seat_index$field = new int();
		}

		public function get hasSeatIndex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set seatIndex(value:int):void {
			hasField$0 |= 0x1;
			seat_index$field = value;
		}

		public function get seatIndex():int {
			return seat_index$field;
		}

		/**
		 *  @private
		 */
		public static const HAND_SEQ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protocol.gameserver.hand_seq_info.hand_seq", "handSeq", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_hand_seq; });

		private var hand_seq$field:protocol.gameserver.st_hand_seq;

		public function clearHandSeq():void {
			hand_seq$field = null;
		}

		public function get hasHandSeq():Boolean {
			return hand_seq$field != null;
		}

		public function set handSeq(value:protocol.gameserver.st_hand_seq):void {
			hand_seq$field = value;
		}

		public function get handSeq():protocol.gameserver.st_hand_seq {
			return hand_seq$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat_index$field);
			}
			if (hasHandSeq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, hand_seq$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var seat_index$count:uint = 0;
			var hand_seq$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: hand_seq_info.seatIndex cannot be set twice.');
					}
					++seat_index$count;
					this.seatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (hand_seq$count != 0) {
						throw new flash.errors.IOError('Bad data format: hand_seq_info.handSeq cannot be set twice.');
					}
					++hand_seq$count;
					this.handSeq = new protocol.gameserver.st_hand_seq();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.handSeq);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
