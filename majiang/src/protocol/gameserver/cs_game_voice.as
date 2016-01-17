package protos.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class cs_game_voice extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.cs_game_voice.seat_index", "seatIndex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const DATA:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("protos.gameserver.cs_game_voice.data", "data", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var data$field:flash.utils.ByteArray;

		public function clearData():void {
			data$field = null;
		}

		public function get hasData():Boolean {
			return data$field != null;
		}

		public function set data(value:flash.utils.ByteArray):void {
			data$field = value;
		}

		public function get data():flash.utils.ByteArray {
			return data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat_index$field);
			}
			if (hasData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, data$field);
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
			var data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_game_voice.seatIndex cannot be set twice.');
					}
					++seat_index$count;
					this.seatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (data$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_game_voice.data cannot be set twice.');
					}
					++data$count;
					this.data = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
