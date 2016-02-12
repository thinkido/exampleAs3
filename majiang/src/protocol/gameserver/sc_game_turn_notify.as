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
	public dynamic final class sc_game_turn_notify extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIMEOUT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_turn_notify.timeout", "timeout", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var timeout$field:int;

		private var hasField$0:uint = 0;

		public function clearTimeout():void {
			hasField$0 &= 0xfffffffe;
			timeout$field = new int();
		}

		public function get hasTimeout():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set timeout(value:int):void {
			hasField$0 |= 0x1;
			timeout$field = value;
		}

		public function get timeout():int {
			return timeout$field;
		}

		/**
		 *  @private
		 */
		public static const SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_turn_notify.seat_index", "seatIndex", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const MO:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.gameserver.sc_game_turn_notify.mo", "mo", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mo$field:Boolean;

		public function clearMo():void {
			hasField$0 &= 0xfffffffb;
			mo$field = new Boolean();
		}

		public function get hasMo():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set mo(value:Boolean):void {
			hasField$0 |= 0x4;
			mo$field = value;
		}

		public function get mo():Boolean {
			return mo$field;
		}

		/**
		 *  @private
		 */
		public static const MO_TILES:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_turn_notify.mo_tiles", "moTiles", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var moTiles:Array = [];

		/**
		 *  @private
		 */
		public static const TILES_REMAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.sc_game_turn_notify.tiles_remain", "tilesRemain", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tiles_remain$field:int;

		public function clearTilesRemain():void {
			hasField$0 &= 0xfffffff7;
			tiles_remain$field = new int();
		}

		public function get hasTilesRemain():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set tilesRemain(value:int):void {
			hasField$0 |= 0x8;
			tiles_remain$field = value;
		}

		public function get tilesRemain():int {
			return tiles_remain$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTimeout) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, timeout$field);
			}
			if (hasSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat_index$field);
			}
			if (hasMo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, mo$field);
			}
			for (var moTiles$index:uint = 0; moTiles$index < this.moTiles.length; ++moTiles$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.moTiles[moTiles$index]);
			}
			if (hasTilesRemain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
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
			var timeout$count:uint = 0;
			var seat_index$count:uint = 0;
			var mo$count:uint = 0;
			var tiles_remain$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (timeout$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_turn_notify.timeout cannot be set twice.');
					}
					++timeout$count;
					this.timeout = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_turn_notify.seatIndex cannot be set twice.');
					}
					++seat_index$count;
					this.seatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (mo$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_turn_notify.mo cannot be set twice.');
					}
					++mo$count;
					this.mo = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.moTiles);
						break;
					}
					this.moTiles.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 5:
					if (tiles_remain$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_game_turn_notify.tilesRemain cannot be set twice.');
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
