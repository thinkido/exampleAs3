package protocol.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.gameserver.scgame_show_actions;
	import protocol.gameserver.sccontinue_seat_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_continue_game extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BANKER_SEAT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.banker_seat", "bankerSeat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banker_seat$field:int;

		private var hasField$0:uint = 0;

		public function clearBankerSeat():void {
			hasField$0 &= 0xfffffffe;
			banker_seat$field = new int();
		}

		public function get hasBankerSeat():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set bankerSeat(value:int):void {
			hasField$0 |= 0x1;
			banker_seat$field = value;
		}

		public function get bankerSeat():int {
			return banker_seat$field;
		}

		/**
		 *  @private
		 */
		public static const SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.seat_index", "seatIndex", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var seat_index$field:int;

		public function clearSeatIndex():void {
			hasField$0 &= 0xfffffffd;
			seat_index$field = new int();
		}

		public function get hasSeatIndex():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set seatIndex(value:int):void {
			hasField$0 |= 0x2;
			seat_index$field = value;
		}

		public function get seatIndex():int {
			return seat_index$field;
		}

		/**
		 *  @private
		 */
		public static const LACK_SECOND:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.lack_second", "lackSecond", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lack_second$field:int;

		public function clearLackSecond():void {
			hasField$0 &= 0xfffffffb;
			lack_second$field = new int();
		}

		public function get hasLackSecond():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set lackSecond(value:int):void {
			hasField$0 |= 0x4;
			lack_second$field = value;
		}

		public function get lackSecond():int {
			return lack_second$field;
		}

		/**
		 *  @private
		 */
		public static const CURR_TURN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.curr_turn", "currTurn", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var curr_turn$field:int;

		public function clearCurrTurn():void {
			hasField$0 &= 0xfffffff7;
			curr_turn$field = new int();
		}

		public function get hasCurrTurn():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set currTurn(value:int):void {
			hasField$0 |= 0x8;
			curr_turn$field = value;
		}

		public function get currTurn():int {
			return curr_turn$field;
		}

		/**
		 *  @private
		 */
		public static const TURN_SECOND:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.turn_second", "turnSecond", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var turn_second$field:int;

		public function clearTurnSecond():void {
			hasField$0 &= 0xffffffef;
			turn_second$field = new int();
		}

		public function get hasTurnSecond():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set turnSecond(value:int):void {
			hasField$0 |= 0x10;
			turn_second$field = value;
		}

		public function get turnSecond():int {
			return turn_second$field;
		}

		/**
		 *  @private
		 */
		public static const THINKING:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.gameserver.sc_continue_game.thinking", "thinking", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var thinking$field:Boolean;

		public function clearThinking():void {
			hasField$0 &= 0xffffffdf;
			thinking$field = new Boolean();
		}

		public function get hasThinking():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set thinking(value:Boolean):void {
			hasField$0 |= 0x20;
			thinking$field = value;
		}

		public function get thinking():Boolean {
			return thinking$field;
		}

		/**
		 *  @private
		 */
		public static const THINK_SECOND:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.think_second", "thinkSecond", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var think_second$field:int;

		public function clearThinkSecond():void {
			hasField$0 &= 0xffffffbf;
			think_second$field = new int();
		}

		public function get hasThinkSecond():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set thinkSecond(value:int):void {
			hasField$0 |= 0x40;
			think_second$field = value;
		}

		public function get thinkSecond():int {
			return think_second$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_ACTIONS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_continue_game.show_actions", "showActions", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.scgame_show_actions; });

		[ArrayElementType("protocol.gameserver.scgame_show_actions")]
		public var showActions:Array = [];

		/**
		 *  @private
		 */
		public static const SEAT_INFOES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_continue_game.seat_infoes", "seatInfoes", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.sccontinue_seat_info; });

		[ArrayElementType("protocol.gameserver.sccontinue_seat_info")]
		public var seatInfoes:Array = [];

		/**
		 *  @private
		 */
		public static const TILES_REMAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.tiles_remain", "tilesRemain", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tiles_remain$field:int;

		public function clearTilesRemain():void {
			hasField$0 &= 0xffffff7f;
			tiles_remain$field = new int();
		}

		public function get hasTilesRemain():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set tilesRemain(value:int):void {
			hasField$0 |= 0x80;
			tiles_remain$field = value;
		}

		public function get tilesRemain():int {
			return tiles_remain$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.roomid", "roomid", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var roomid$field:int;

		public function clearRoomid():void {
			hasField$0 &= 0xfffffeff;
			roomid$field = new int();
		}

		public function get hasRoomid():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set roomid(value:int):void {
			hasField$0 |= 0x100;
			roomid$field = value;
		}

		public function get roomid():int {
			return roomid$field;
		}

		/**
		 *  @private
		 */
		public static const SERVICE_GOLD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.service_gold", "serviceGold", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var service_gold$field:int;

		public function clearServiceGold():void {
			hasField$0 &= 0xfffffdff;
			service_gold$field = new int();
		}

		public function get hasServiceGold():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set serviceGold(value:int):void {
			hasField$0 |= 0x200;
			service_gold$field = value;
		}

		public function get serviceGold():int {
			return service_gold$field;
		}

		/**
		 *  @private
		 */
		public static const MA_SEAT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.ma_seat", "maSeat", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ma_seat$field:int;

		public function clearMaSeat():void {
			hasField$0 &= 0xfffffbff;
			ma_seat$field = new int();
		}

		public function get hasMaSeat():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set maSeat(value:int):void {
			hasField$0 |= 0x400;
			ma_seat$field = value;
		}

		public function get maSeat():int {
			return ma_seat$field;
		}

		/**
		 *  @private
		 */
		public static const ROOM_LEVEL:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.gameserver.sc_continue_game.room_level", "roomLevel", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const ROOM_BASE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_continue_game.room_base", "roomBase", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var room_base$field:int;

		public function clearRoomBase():void {
			hasField$0 &= 0xfffff7ff;
			room_base$field = new int();
		}

		public function get hasRoomBase():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set roomBase(value:int):void {
			hasField$0 |= 0x800;
			room_base$field = value;
		}

		public function get roomBase():int {
			return room_base$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBankerSeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, banker_seat$field);
			}
			if (hasSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat_index$field);
			}
			if (hasLackSecond) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, lack_second$field);
			}
			if (hasCurrTurn) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, curr_turn$field);
			}
			if (hasTurnSecond) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, turn_second$field);
			}
			if (hasThinking) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, thinking$field);
			}
			if (hasThinkSecond) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, think_second$field);
			}
			for (var showActions$index:uint = 0; showActions$index < this.showActions.length; ++showActions$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.showActions[showActions$index]);
			}
			for (var seatInfoes$index:uint = 0; seatInfoes$index < this.seatInfoes.length; ++seatInfoes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.seatInfoes[seatInfoes$index]);
			}
			if (hasTilesRemain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tiles_remain$field);
			}
			if (hasRoomid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, roomid$field);
			}
			if (hasServiceGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, service_gold$field);
			}
			if (hasMaSeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, ma_seat$field);
			}
			if (hasRoomLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, room_level$field);
			}
			if (hasRoomBase) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
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
			var banker_seat$count:uint = 0;
			var seat_index$count:uint = 0;
			var lack_second$count:uint = 0;
			var curr_turn$count:uint = 0;
			var turn_second$count:uint = 0;
			var thinking$count:uint = 0;
			var think_second$count:uint = 0;
			var tiles_remain$count:uint = 0;
			var roomid$count:uint = 0;
			var service_gold$count:uint = 0;
			var ma_seat$count:uint = 0;
			var room_level$count:uint = 0;
			var room_base$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (banker_seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.bankerSeat cannot be set twice.');
					}
					++banker_seat$count;
					this.bankerSeat = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.seatIndex cannot be set twice.');
					}
					++seat_index$count;
					this.seatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (lack_second$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.lackSecond cannot be set twice.');
					}
					++lack_second$count;
					this.lackSecond = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (curr_turn$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.currTurn cannot be set twice.');
					}
					++curr_turn$count;
					this.currTurn = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (turn_second$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.turnSecond cannot be set twice.');
					}
					++turn_second$count;
					this.turnSecond = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (thinking$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.thinking cannot be set twice.');
					}
					++thinking$count;
					this.thinking = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 7:
					if (think_second$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.thinkSecond cannot be set twice.');
					}
					++think_second$count;
					this.thinkSecond = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					this.showActions.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.scgame_show_actions()));
					break;
				case 9:
					this.seatInfoes.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.sccontinue_seat_info()));
					break;
				case 10:
					if (tiles_remain$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.tilesRemain cannot be set twice.');
					}
					++tiles_remain$count;
					this.tilesRemain = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (roomid$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.roomid cannot be set twice.');
					}
					++roomid$count;
					this.roomid = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (service_gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.serviceGold cannot be set twice.');
					}
					++service_gold$count;
					this.serviceGold = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 13:
					if (ma_seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.maSeat cannot be set twice.');
					}
					++ma_seat$count;
					this.maSeat = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 14:
					if (room_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.roomLevel cannot be set twice.');
					}
					++room_level$count;
					this.roomLevel = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 15:
					if (room_base$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_continue_game.roomBase cannot be set twice.');
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
