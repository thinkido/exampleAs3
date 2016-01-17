package protos.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.gameserver.stplayer_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class scenter_seat_info extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PLAYER_INFO:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protos.gameserver.scenter_seat_info.player_info", "playerInfo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.gameserver.stplayer_info; });

		private var player_info$field:protos.gameserver.stplayer_info;

		public function clearPlayerInfo():void {
			player_info$field = null;
		}

		public function get hasPlayerInfo():Boolean {
			return player_info$field != null;
		}

		public function set playerInfo(value:protos.gameserver.stplayer_info):void {
			player_info$field = value;
		}

		public function get playerInfo():protos.gameserver.stplayer_info {
			return player_info$field;
		}

		/**
		 *  @private
		 */
		public static const READY:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protos.gameserver.scenter_seat_info.ready", "ready", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ready$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearReady():void {
			hasField$0 &= 0xfffffffe;
			ready$field = new Boolean();
		}

		public function get hasReady():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set ready(value:Boolean):void {
			hasField$0 |= 0x1;
			ready$field = value;
		}

		public function get ready():Boolean {
			return ready$field;
		}

		/**
		 *  @private
		 */
		public static const SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.scenter_seat_info.seat_index", "seatIndex", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPlayerInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, player_info$field);
			}
			if (hasReady) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, ready$field);
			}
			if (hasSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat_index$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var player_info$count:uint = 0;
			var ready$count:uint = 0;
			var seat_index$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (player_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: scenter_seat_info.playerInfo cannot be set twice.');
					}
					++player_info$count;
					this.playerInfo = new protos.gameserver.stplayer_info();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.playerInfo);
					break;
				case 2:
					if (ready$count != 0) {
						throw new flash.errors.IOError('Bad data format: scenter_seat_info.ready cannot be set twice.');
					}
					++ready$count;
					this.ready = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 3:
					if (seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: scenter_seat_info.seatIndex cannot be set twice.');
					}
					++seat_index$count;
					this.seatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
