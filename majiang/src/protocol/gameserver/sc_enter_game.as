package protocol.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.gameserver.scenter_seat_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_enter_game extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_enter_game.seat_index", "seatIndex", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SEAT_INFOES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_enter_game.seat_infoes", "seatInfoes", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.scenter_seat_info; });

		[ArrayElementType("protocol.gameserver.scenter_seat_info")]
		public var seatInfoes:Array = [];

		/**
		 *  @private
		 */
		public static const REV_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.sc_enter_game.rev_name", "revName", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var rev_name$field:String;

		public function clearRevName():void {
			rev_name$field = null;
		}

		public function get hasRevName():Boolean {
			return rev_name$field != null;
		}

		public function set revName(value:String):void {
			rev_name$field = value;
		}

		public function get revName():String {
			return rev_name$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_enter_game.roomid", "roomid", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var roomid$field:int;

		public function clearRoomid():void {
			hasField$0 &= 0xfffffffd;
			roomid$field = new int();
		}

		public function get hasRoomid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set roomid(value:int):void {
			hasField$0 |= 0x2;
			roomid$field = value;
		}

		public function get roomid():int {
			return roomid$field;
		}

		/**
		 *  @private
		 */
		public static const ROOM_LEVEL:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.sc_enter_game.room_level", "roomLevel", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var room_level$field:String;

		public function clearRoomLevel():void {
			room_level$field = null;
		}

		public function get hasRoomLevel():Boolean {
			return room_level$field != null;
		}

		public function set roomLevel(value:String):void {
			room_level$field = value;
		}

		public function get roomLevel():String {
			return room_level$field;
		}

		/**
		 *  @private
		 */
		public static const ROOM_BASE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_enter_game.room_base", "roomBase", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var room_base$field:int;

		public function clearRoomBase():void {
			hasField$0 &= 0xfffffffb;
			room_base$field = new int();
		}

		public function get hasRoomBase():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set roomBase(value:int):void {
			hasField$0 |= 0x4;
			room_base$field = value;
		}

		public function get roomBase():int {
			return room_base$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat_index$field);
			}
			for (var seatInfoes$index:uint = 0; seatInfoes$index < this.seatInfoes.length; ++seatInfoes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.seatInfoes[seatInfoes$index]);
			}
			if (hasRevName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, rev_name$field);
			}
			if (hasRoomid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, roomid$field);
			}
			if (hasRoomLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, room_level$field);
			}
			if (hasRoomBase) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, room_base$field);
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
			var rev_name$count:uint = 0;
			var roomid$count:uint = 0;
			var room_level$count:uint = 0;
			var room_base$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_game.seatIndex cannot be set twice.');
					}
					++seat_index$count;
					this.seatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					this.seatInfoes.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.scenter_seat_info()));
					break;
				case 4:
					if (rev_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_game.revName cannot be set twice.');
					}
					++rev_name$count;
					this.revName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (roomid$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_game.roomid cannot be set twice.');
					}
					++roomid$count;
					this.roomid = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (room_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_game.roomLevel cannot be set twice.');
					}
					++room_level$count;
					this.roomLevel = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 7:
					if (room_base$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_game.roomBase cannot be set twice.');
					}
					++room_base$count;
					this.roomBase = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
