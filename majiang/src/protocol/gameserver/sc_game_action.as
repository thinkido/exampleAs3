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
	import protocol.gameserver.scgame_show_actions;
	import protocol.gameserver.sccomplex_tile;
	import protocol.gameserver.st_money_transfer;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_game_action extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_action.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const SUB_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_action.sub_id", "subId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sub_id$field:int;

		public function clearSubId():void {
			hasField$0 &= 0xfffffffd;
			sub_id$field = new int();
		}

		public function get hasSubId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set subId(value:int):void {
			hasField$0 |= 0x2;
			sub_id$field = value;
		}

		public function get subId():int {
			return sub_id$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_TRANSFER:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_game_action.money_transfer", "moneyTransfer", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_money_transfer; });

		[ArrayElementType("protocol.gameserver.st_money_transfer")]
		public var moneyTransfer:Array = [];

		/**
		 *  @private
		 */
		public static const TILE_TYPE_OR_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_action.tile_type_or_id", "tileTypeOrId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tile_type_or_id$field:int;

		public function clearTileTypeOrId():void {
			hasField$0 &= 0xfffffffb;
			tile_type_or_id$field = new int();
		}

		public function get hasTileTypeOrId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set tileTypeOrId(value:int):void {
			hasField$0 |= 0x4;
			tile_type_or_id$field = value;
		}

		public function get tileTypeOrId():int {
			return tile_type_or_id$field;
		}

		/**
		 *  @private
		 */
		public static const ACT_SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_action.act_seat_index", "actSeatIndex", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var act_seat_index$field:int;

		public function clearActSeatIndex():void {
			hasField$0 &= 0xfffffff7;
			act_seat_index$field = new int();
		}

		public function get hasActSeatIndex():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set actSeatIndex(value:int):void {
			hasField$0 |= 0x8;
			act_seat_index$field = value;
		}

		public function get actSeatIndex():int {
			return act_seat_index$field;
		}

		/**
		 *  @private
		 */
		public static const ACT_HAND_SEQ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_game_action.act_hand_seq", "actHandSeq", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_hand_seq; });

		private var act_hand_seq$field:protocol.gameserver.st_hand_seq;

		public function clearActHandSeq():void {
			act_hand_seq$field = null;
		}

		public function get hasActHandSeq():Boolean {
			return act_hand_seq$field != null;
		}

		public function set actHandSeq(value:protocol.gameserver.st_hand_seq):void {
			act_hand_seq$field = value;
		}

		public function get actHandSeq():protocol.gameserver.st_hand_seq {
			return act_hand_seq$field;
		}

		/**
		 *  @private
		 */
		public static const ACT_HU_SEQ:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_action.act_hu_seq", "actHuSeq", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var actHuSeq:Array = [];

		/**
		 *  @private
		 */
		public static const ACT_COMPLEX_SEQ:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_game_action.act_complex_seq", "actComplexSeq", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.sccomplex_tile; });

		[ArrayElementType("protocol.gameserver.sccomplex_tile")]
		public var actComplexSeq:Array = [];

		/**
		 *  @private
		 */
		public static const ACT_CHUED_SEQ:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_action.act_chued_seq", "actChuedSeq", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var actChuedSeq:Array = [];

		/**
		 *  @private
		 */
		public static const ACTED_SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_action.acted_seat_index", "actedSeatIndex", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var acted_seat_index$field:int;

		public function clearActedSeatIndex():void {
			hasField$0 &= 0xffffffef;
			acted_seat_index$field = new int();
		}

		public function get hasActedSeatIndex():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set actedSeatIndex(value:int):void {
			hasField$0 |= 0x10;
			acted_seat_index$field = value;
		}

		public function get actedSeatIndex():int {
			return acted_seat_index$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_ACTIONS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_game_action.show_actions", "showActions", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.scgame_show_actions; });

		[ArrayElementType("protocol.gameserver.scgame_show_actions")]
		public var showActions:Array = [];

		/**
		 *  @private
		 */
		public static const TILES_REMAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_action.tiles_remain", "tilesRemain", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tiles_remain$field:int;

		public function clearTilesRemain():void {
			hasField$0 &= 0xffffffdf;
			tiles_remain$field = new int();
		}

		public function get hasTilesRemain():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set tilesRemain(value:int):void {
			hasField$0 |= 0x20;
			tiles_remain$field = value;
		}

		public function get tilesRemain():int {
			return tiles_remain$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasSubId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, sub_id$field);
			}
			for (var moneyTransfer$index:uint = 0; moneyTransfer$index < this.moneyTransfer.length; ++moneyTransfer$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.moneyTransfer[moneyTransfer$index]);
			}
			if (hasTileTypeOrId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tile_type_or_id$field);
			}
			if (hasActSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, act_seat_index$field);
			}
			if (hasActHandSeq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, act_hand_seq$field);
			}
			for (var actHuSeq$index:uint = 0; actHuSeq$index < this.actHuSeq.length; ++actHuSeq$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.actHuSeq[actHuSeq$index]);
			}
			for (var actComplexSeq$index:uint = 0; actComplexSeq$index < this.actComplexSeq.length; ++actComplexSeq$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.actComplexSeq[actComplexSeq$index]);
			}
			for (var actChuedSeq$index:uint = 0; actChuedSeq$index < this.actChuedSeq.length; ++actChuedSeq$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.actChuedSeq[actChuedSeq$index]);
			}
			if (hasActedSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, acted_seat_index$field);
			}
			for (var showActions$index:uint = 0; showActions$index < this.showActions.length; ++showActions$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.showActions[showActions$index]);
			}
			if (hasTilesRemain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tiles_remain$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var sub_id$count:uint = 0;
			var tile_type_or_id$count:uint = 0;
			var act_seat_index$count:uint = 0;
			var act_hand_seq$count:uint = 0;
			var acted_seat_index$count:uint = 0;
			var tiles_remain$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_action.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (sub_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_action.subId cannot be set twice.');
					}
					++sub_id$count;
					this.subId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					this.moneyTransfer.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_money_transfer()));
					break;
				case 4:
					if (tile_type_or_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_action.tileTypeOrId cannot be set twice.');
					}
					++tile_type_or_id$count;
					this.tileTypeOrId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (act_seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_action.actSeatIndex cannot be set twice.');
					}
					++act_seat_index$count;
					this.actSeatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (act_hand_seq$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_action.actHandSeq cannot be set twice.');
					}
					++act_hand_seq$count;
					this.actHandSeq = new protocol.gameserver.st_hand_seq();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.actHandSeq);
					break;
				case 7:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.actHuSeq);
						break;
					}
					this.actHuSeq.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 8:
					this.actComplexSeq.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.sccomplex_tile()));
					break;
				case 9:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.actChuedSeq);
						break;
					}
					this.actChuedSeq.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 10:
					if (acted_seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_action.actedSeatIndex cannot be set twice.');
					}
					++acted_seat_index$count;
					this.actedSeatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					this.showActions.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.scgame_show_actions()));
					break;
				case 12:
					if (tiles_remain$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_action.tilesRemain cannot be set twice.');
					}
					++tiles_remain$count;
					this.tilesRemain = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
