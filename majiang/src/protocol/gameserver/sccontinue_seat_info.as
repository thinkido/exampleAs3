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
	import protocol.gameserver.stplayer_info;
	import protocol.gameserver.sccomplex_tile;
	import protocol.gameserver.st_hu_desc;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sccontinue_seat_info extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sccontinue_seat_info.seat_index", "seatIndex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const PLAYER_INFO:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sccontinue_seat_info.player_info", "playerInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.stplayer_info; });

		private var player_info$field:protocol.gameserver.stplayer_info;

		public function clearPlayerInfo():void {
			player_info$field = null;
		}

		public function get hasPlayerInfo():Boolean {
			return player_info$field != null;
		}

		public function set playerInfo(value:protocol.gameserver.stplayer_info):void {
			player_info$field = value;
		}

		public function get playerInfo():protocol.gameserver.stplayer_info {
			return player_info$field;
		}

		/**
		 *  @private
		 */
		public static const READY:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.gameserver.sccontinue_seat_info.ready", "ready", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ready$field:Boolean;

		public function clearReady():void {
			hasField$0 &= 0xfffffffd;
			ready$field = new Boolean();
		}

		public function get hasReady():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set ready(value:Boolean):void {
			hasField$0 |= 0x2;
			ready$field = value;
		}

		public function get ready():Boolean {
			return ready$field;
		}

		/**
		 *  @private
		 */
		public static const LACK:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sccontinue_seat_info.lack", "lack", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lack$field:int;

		public function clearLack():void {
			hasField$0 &= 0xfffffffb;
			lack$field = new int();
		}

		public function get hasLack():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set lack(value:int):void {
			hasField$0 |= 0x4;
			lack$field = value;
		}

		public function get lack():int {
			return lack$field;
		}

		/**
		 *  @private
		 */
		public static const IS_HU:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.gameserver.sccontinue_seat_info.is_hu", "isHu", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_hu$field:Boolean;

		public function clearIsHu():void {
			hasField$0 &= 0xfffffff7;
			is_hu$field = new Boolean();
		}

		public function get hasIsHu():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isHu(value:Boolean):void {
			hasField$0 |= 0x8;
			is_hu$field = value;
		}

		public function get isHu():Boolean {
			return is_hu$field;
		}

		/**
		 *  @private
		 */
		public static const HU_SEQ:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protocol.gameserver.sccontinue_seat_info.hu_seq", "huSeq", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var huSeq:Array = [];

		/**
		 *  @private
		 */
		public static const HAND_SEQ_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sccontinue_seat_info.hand_seq_count", "handSeqCount", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hand_seq_count$field:int;

		public function clearHandSeqCount():void {
			hasField$0 &= 0xffffffef;
			hand_seq_count$field = new int();
		}

		public function get hasHandSeqCount():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set handSeqCount(value:int):void {
			hasField$0 |= 0x10;
			hand_seq_count$field = value;
		}

		public function get handSeqCount():int {
			return hand_seq_count$field;
		}

		/**
		 *  @private
		 */
		public static const MO_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sccontinue_seat_info.mo_count", "moCount", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mo_count$field:int;

		public function clearMoCount():void {
			hasField$0 &= 0xffffffdf;
			mo_count$field = new int();
		}

		public function get hasMoCount():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set moCount(value:int):void {
			hasField$0 |= 0x20;
			mo_count$field = value;
		}

		public function get moCount():int {
			return mo_count$field;
		}

		/**
		 *  @private
		 */
		public static const HAND_SEQ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sccontinue_seat_info.hand_seq", "handSeq", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_hand_seq; });

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
		public static const COMPLEX_SEQ:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sccontinue_seat_info.complex_seq", "complexSeq", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.sccomplex_tile; });

		[ArrayElementType("protocol.gameserver.sccomplex_tile")]
		public var complexSeq:Array = [];

		/**
		 *  @private
		 */
		public static const CHUED_SEQ:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protocol.gameserver.sccontinue_seat_info.chued_seq", "chuedSeq", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var chuedSeq:Array = [];

		/**
		 *  @private
		 */
		public static const HU_DESC:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.sccontinue_seat_info.hu_desc", "huDesc", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_hu_desc; });

		[ArrayElementType("protocol.gameserver.st_hu_desc")]
		public var huDesc:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat_index$field);
			}
			if (hasPlayerInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, player_info$field);
			}
			if (hasReady) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, ready$field);
			}
			if (hasLack) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, lack$field);
			}
			if (hasIsHu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_hu$field);
			}
			for (var huSeq$index:uint = 0; huSeq$index < this.huSeq.length; ++huSeq$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.huSeq[huSeq$index]);
			}
			if (hasHandSeqCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, hand_seq_count$field);
			}
			if (hasMoCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, mo_count$field);
			}
			if (hasHandSeq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, hand_seq$field);
			}
			for (var complexSeq$index:uint = 0; complexSeq$index < this.complexSeq.length; ++complexSeq$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.complexSeq[complexSeq$index]);
			}
			for (var chuedSeq$index:uint = 0; chuedSeq$index < this.chuedSeq.length; ++chuedSeq$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.chuedSeq[chuedSeq$index]);
			}
			for (var huDesc$index:uint = 0; huDesc$index < this.huDesc.length; ++huDesc$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.huDesc[huDesc$index]);
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
			var player_info$count:uint = 0;
			var ready$count:uint = 0;
			var lack$count:uint = 0;
			var is_hu$count:uint = 0;
			var hand_seq_count$count:uint = 0;
			var mo_count$count:uint = 0;
			var hand_seq$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: sccontinue_seat_info.seatIndex cannot be set twice.');
					}
					++seat_index$count;
					this.seatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (player_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: sccontinue_seat_info.playerInfo cannot be set twice.');
					}
					++player_info$count;
					this.playerInfo = new protocol.gameserver.stplayer_info();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.playerInfo);
					break;
				case 3:
					if (ready$count != 0) {
						throw new flash.errors.IOError('Bad data format: sccontinue_seat_info.ready cannot be set twice.');
					}
					++ready$count;
					this.ready = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if (lack$count != 0) {
						throw new flash.errors.IOError('Bad data format: sccontinue_seat_info.lack cannot be set twice.');
					}
					++lack$count;
					this.lack = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (is_hu$count != 0) {
						throw new flash.errors.IOError('Bad data format: sccontinue_seat_info.isHu cannot be set twice.');
					}
					++is_hu$count;
					this.isHu = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.huSeq);
						break;
					}
					this.huSeq.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 7:
					if (hand_seq_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: sccontinue_seat_info.handSeqCount cannot be set twice.');
					}
					++hand_seq_count$count;
					this.handSeqCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (mo_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: sccontinue_seat_info.moCount cannot be set twice.');
					}
					++mo_count$count;
					this.moCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (hand_seq$count != 0) {
						throw new flash.errors.IOError('Bad data format: sccontinue_seat_info.handSeq cannot be set twice.');
					}
					++hand_seq$count;
					this.handSeq = new protocol.gameserver.st_hand_seq();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.handSeq);
					break;
				case 10:
					this.complexSeq.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.sccomplex_tile()));
					break;
				case 11:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.chuedSeq);
						break;
					}
					this.chuedSeq.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 12:
					this.huDesc.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_hu_desc()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
