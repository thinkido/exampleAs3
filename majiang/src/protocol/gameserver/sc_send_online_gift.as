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
	public dynamic final class sc_send_online_gift extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_send_online_gift.result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const GOLD:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protocol.gameserver.sc_send_online_gift.gold", "gold", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gold$field:Int64;

		public function clearGold():void {
			gold$field = null;
		}

		public function get hasGold():Boolean {
			return gold$field != null;
		}

		public function set gold(value:Int64):void {
			gold$field = value;
		}

		public function get gold():Int64 {
			return gold$field;
		}

		/**
		 *  @private
		 */
		public static const DIAMOND:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protocol.gameserver.sc_send_online_gift.diamond", "diamond", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var diamond$field:Int64;

		public function clearDiamond():void {
			diamond$field = null;
		}

		public function get hasDiamond():Boolean {
			return diamond$field != null;
		}

		public function set diamond(value:Int64):void {
			diamond$field = value;
		}

		public function get diamond():Int64 {
			return diamond$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_send_online_gift.time", "time", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:int;

		public function clearTime():void {
			hasField$0 &= 0xfffffffd;
			time$field = new int();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set time(value:int):void {
			hasField$0 |= 0x2;
			time$field = value;
		}

		public function get time():int {
			return time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasResult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, result$field);
			}
			if (hasGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, gold$field);
			}
			if (hasDiamond) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, diamond$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, time$field);
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
			var gold$count:uint = 0;
			var diamond$count:uint = 0;
			var time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_send_online_gift.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_send_online_gift.gold cannot be set twice.');
					}
					++gold$count;
					this.gold = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (diamond$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_send_online_gift.diamond cannot be set twice.');
					}
					++diamond$count;
					this.diamond = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_send_online_gift.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
