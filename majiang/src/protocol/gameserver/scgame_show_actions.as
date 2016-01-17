package protos.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.gameserver.st_hu_desc;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class scgame_show_actions extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.scgame_show_actions.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SUB_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.scgame_show_actions.sub_id", "subId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TILE_SEQ:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protos.gameserver.scgame_show_actions.tile_seq", "tileSeq", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var tileSeq:Array = [];

		/**
		 *  @private
		 */
		public static const HU_DESC:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protos.gameserver.scgame_show_actions.hu_desc", "huDesc", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.gameserver.st_hu_desc; });

		private var hu_desc$field:protos.gameserver.st_hu_desc;

		public function clearHuDesc():void {
			hu_desc$field = null;
		}

		public function get hasHuDesc():Boolean {
			return hu_desc$field != null;
		}

		public function set huDesc(value:protos.gameserver.st_hu_desc):void {
			hu_desc$field = value;
		}

		public function get huDesc():protos.gameserver.st_hu_desc {
			return hu_desc$field;
		}

		/**
		 *  @private
		 */
		public static const ACTED_SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.scgame_show_actions.acted_seat_index", "actedSeatIndex", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var acted_seat_index$field:int;

		public function clearActedSeatIndex():void {
			hasField$0 &= 0xfffffffb;
			acted_seat_index$field = new int();
		}

		public function get hasActedSeatIndex():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set actedSeatIndex(value:int):void {
			hasField$0 |= 0x4;
			acted_seat_index$field = value;
		}

		public function get actedSeatIndex():int {
			return acted_seat_index$field;
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
			for (var tileSeq$index:uint = 0; tileSeq$index < this.tileSeq.length; ++tileSeq$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.tileSeq[tileSeq$index]);
			}
			if (hasHuDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, hu_desc$field);
			}
			if (hasActedSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, acted_seat_index$field);
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
			var hu_desc$count:uint = 0;
			var acted_seat_index$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: scgame_show_actions.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (sub_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: scgame_show_actions.subId cannot be set twice.');
					}
					++sub_id$count;
					this.subId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.tileSeq);
						break;
					}
					this.tileSeq.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 4:
					if (hu_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: scgame_show_actions.huDesc cannot be set twice.');
					}
					++hu_desc$count;
					this.huDesc = new protos.gameserver.st_hu_desc();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.huDesc);
					break;
				case 5:
					if (acted_seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: scgame_show_actions.actedSeatIndex cannot be set twice.');
					}
					++acted_seat_index$count;
					this.actedSeatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
