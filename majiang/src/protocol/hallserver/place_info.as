package protos.hallserver {
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
	public dynamic final class place_info extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.place_info.id", "id", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var id$field:String;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:String):void {
			id$field = value;
		}

		public function get id():String {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.place_info.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const BASE_ZHU:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.place_info.base_zhu", "baseZhu", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var base_zhu$field:int;

		private var hasField$0:uint = 0;

		public function clearBaseZhu():void {
			hasField$0 &= 0xfffffffe;
			base_zhu$field = new int();
		}

		public function get hasBaseZhu():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set baseZhu(value:int):void {
			hasField$0 |= 0x1;
			base_zhu$field = value;
		}

		public function get baseZhu():int {
			return base_zhu$field;
		}

		/**
		 *  @private
		 */
		public static const PLAYER_NUM:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.place_info.player_num", "playerNum", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var player_num$field:int;

		public function clearPlayerNum():void {
			hasField$0 &= 0xfffffffd;
			player_num$field = new int();
		}

		public function get hasPlayerNum():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set playerNum(value:int):void {
			hasField$0 |= 0x2;
			player_num$field = value;
		}

		public function get playerNum():int {
			return player_num$field;
		}

		/**
		 *  @private
		 */
		public static const REQ_PLAYER_GOLD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.place_info.req_player_gold", "reqPlayerGold", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var req_player_gold$field:int;

		public function clearReqPlayerGold():void {
			hasField$0 &= 0xfffffffb;
			req_player_gold$field = new int();
		}

		public function get hasReqPlayerGold():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set reqPlayerGold(value:int):void {
			hasField$0 |= 0x4;
			req_player_gold$field = value;
		}

		public function get reqPlayerGold():int {
			return req_player_gold$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_ENTER:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protos.hallserver.place_info.can_enter", "canEnter", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_enter$field:Boolean;

		public function clearCanEnter():void {
			hasField$0 &= 0xfffffff7;
			can_enter$field = new Boolean();
		}

		public function get hasCanEnter():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set canEnter(value:Boolean):void {
			hasField$0 |= 0x8;
			can_enter$field = value;
		}

		public function get canEnter():Boolean {
			return can_enter$field;
		}

		/**
		 *  @private
		 */
		public static const CHU_TILE_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.place_info.chu_tile_time", "chuTileTime", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chu_tile_time$field:int;

		public function clearChuTileTime():void {
			hasField$0 &= 0xffffffef;
			chu_tile_time$field = new int();
		}

		public function get hasChuTileTime():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set chuTileTime(value:int):void {
			hasField$0 |= 0x10;
			chu_tile_time$field = value;
		}

		public function get chuTileTime():int {
			return chu_tile_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasBaseZhu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, base_zhu$field);
			}
			if (hasPlayerNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, player_num$field);
			}
			if (hasReqPlayerGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, req_player_gold$field);
			}
			if (hasCanEnter) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_enter$field);
			}
			if (hasChuTileTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, chu_tile_time$field);
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
			var name$count:uint = 0;
			var base_zhu$count:uint = 0;
			var player_num$count:uint = 0;
			var req_player_gold$count:uint = 0;
			var can_enter$count:uint = 0;
			var chu_tile_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: place_info.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: place_info.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (base_zhu$count != 0) {
						throw new flash.errors.IOError('Bad data format: place_info.baseZhu cannot be set twice.');
					}
					++base_zhu$count;
					this.baseZhu = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (player_num$count != 0) {
						throw new flash.errors.IOError('Bad data format: place_info.playerNum cannot be set twice.');
					}
					++player_num$count;
					this.playerNum = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (req_player_gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: place_info.reqPlayerGold cannot be set twice.');
					}
					++req_player_gold$count;
					this.reqPlayerGold = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (can_enter$count != 0) {
						throw new flash.errors.IOError('Bad data format: place_info.canEnter cannot be set twice.');
					}
					++can_enter$count;
					this.canEnter = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 10:
					if (chu_tile_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: place_info.chuTileTime cannot be set twice.');
					}
					++chu_tile_time$count;
					this.chuTileTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
