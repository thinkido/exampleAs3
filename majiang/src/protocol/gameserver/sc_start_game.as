package protocol.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.gameserver.hand_seq_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_start_game extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OTHER_INFOES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_start_game.other_infoes", "otherInfoes", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.hand_seq_info; });

		[ArrayElementType("protocol.gameserver.hand_seq_info")]
		public var otherInfoes:Array = [];

		/**
		 *  @private
		 */
		public static const YOU_SEQ_INFO:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sc_start_game.you_seq_info", "youSeqInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.hand_seq_info; });

		private var you_seq_info$field:protocol.gameserver.hand_seq_info;

		public function clearYouSeqInfo():void {
			you_seq_info$field = null;
		}

		public function get hasYouSeqInfo():Boolean {
			return you_seq_info$field != null;
		}

		public function set youSeqInfo(value:protocol.gameserver.hand_seq_info):void {
			you_seq_info$field = value;
		}

		public function get youSeqInfo():protocol.gameserver.hand_seq_info {
			return you_seq_info$field;
		}

		/**
		 *  @private
		 */
		public static const STARTER_SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_start_game.starter_seat_index", "starterSeatIndex", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var starter_seat_index$field:int;

		private var hasField$0:uint = 0;

		public function clearStarterSeatIndex():void {
			hasField$0 &= 0xfffffffe;
			starter_seat_index$field = new int();
		}

		public function get hasStarterSeatIndex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set starterSeatIndex(value:int):void {
			hasField$0 |= 0x1;
			starter_seat_index$field = value;
		}

		public function get starterSeatIndex():int {
			return starter_seat_index$field;
		}

		/**
		 *  @private
		 */
		public static const TILES_REMAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_start_game.tiles_remain", "tilesRemain", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tiles_remain$field:int;

		public function clearTilesRemain():void {
			hasField$0 &= 0xfffffffd;
			tiles_remain$field = new int();
		}

		public function get hasTilesRemain():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set tilesRemain(value:int):void {
			hasField$0 |= 0x2;
			tiles_remain$field = value;
		}

		public function get tilesRemain():int {
			return tiles_remain$field;
		}

		/**
		 *  @private
		 */
		public static const MA_SEAT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_start_game.ma_seat", "maSeat", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ma_seat$field:int;

		public function clearMaSeat():void {
			hasField$0 &= 0xfffffffb;
			ma_seat$field = new int();
		}

		public function get hasMaSeat():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set maSeat(value:int):void {
			hasField$0 |= 0x4;
			ma_seat$field = value;
		}

		public function get maSeat():int {
			return ma_seat$field;
		}

		/**
		 *  @private
		 */
		public static const BANKER_SEAT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_start_game.banker_seat", "bankerSeat", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banker_seat$field:int;

		public function clearBankerSeat():void {
			hasField$0 &= 0xfffffff7;
			banker_seat$field = new int();
		}

		public function get hasBankerSeat():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set bankerSeat(value:int):void {
			hasField$0 |= 0x8;
			banker_seat$field = value;
		}

		public function get bankerSeat():int {
			return banker_seat$field;
		}

		/**
		 *  @private
		 */
		public static const SERVICE_GOLD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_start_game.service_gold", "serviceGold", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var service_gold$field:int;

		public function clearServiceGold():void {
			hasField$0 &= 0xffffffef;
			service_gold$field = new int();
		}

		public function get hasServiceGold():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set serviceGold(value:int):void {
			hasField$0 |= 0x10;
			service_gold$field = value;
		}

		public function get serviceGold():int {
			return service_gold$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var otherInfoes$index:uint = 0; otherInfoes$index < this.otherInfoes.length; ++otherInfoes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.otherInfoes[otherInfoes$index]);
			}
			if (hasYouSeqInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, you_seq_info$field);
			}
			if (hasStarterSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, starter_seat_index$field);
			}
			if (hasTilesRemain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tiles_remain$field);
			}
			if (hasMaSeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, ma_seat$field);
			}
			if (hasBankerSeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, banker_seat$field);
			}
			if (hasServiceGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, service_gold$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var you_seq_info$count:uint = 0;
			var starter_seat_index$count:uint = 0;
			var tiles_remain$count:uint = 0;
			var ma_seat$count:uint = 0;
			var banker_seat$count:uint = 0;
			var service_gold$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.otherInfoes.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.hand_seq_info()));
					break;
				case 2:
					if (you_seq_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_start_game.youSeqInfo cannot be set twice.');
					}
					++you_seq_info$count;
					this.youSeqInfo = new protocol.gameserver.hand_seq_info();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.youSeqInfo);
					break;
				case 3:
					if (starter_seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_start_game.starterSeatIndex cannot be set twice.');
					}
					++starter_seat_index$count;
					this.starterSeatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (tiles_remain$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_start_game.tilesRemain cannot be set twice.');
					}
					++tiles_remain$count;
					this.tilesRemain = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (ma_seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_start_game.maSeat cannot be set twice.');
					}
					++ma_seat$count;
					this.maSeat = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (banker_seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_start_game.bankerSeat cannot be set twice.');
					}
					++banker_seat$count;
					this.bankerSeat = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (service_gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_start_game.serviceGold cannot be set twice.');
					}
					++service_gold$count;
					this.serviceGold = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
