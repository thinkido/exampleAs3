package protocol.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.hallserver.place_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_update_places extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PLACE_INFOS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.hallserver.sc_update_places.place_infos", "placeInfos", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.hallserver.place_info; });

		[ArrayElementType("protocol.hallserver.place_info")]
		public var placeInfos:Array = [];

		/**
		 *  @private
		 */
		public static const QUEST_CAN_FETCH:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_update_places.quest_can_fetch", "questCanFetch", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var quest_can_fetch$field:int;

		private var hasField$0:uint = 0;

		public function clearQuestCanFetch():void {
			hasField$0 &= 0xfffffffe;
			quest_can_fetch$field = new int();
		}

		public function get hasQuestCanFetch():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set questCanFetch(value:int):void {
			hasField$0 |= 0x1;
			quest_can_fetch$field = value;
		}

		public function get questCanFetch():int {
			return quest_can_fetch$field;
		}

		/**
		 *  @private
		 */
		public static const ACH_CAN_FETCH:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_update_places.ach_can_fetch", "achCanFetch", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ach_can_fetch$field:int;

		public function clearAchCanFetch():void {
			hasField$0 &= 0xfffffffd;
			ach_can_fetch$field = new int();
		}

		public function get hasAchCanFetch():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set achCanFetch(value:int):void {
			hasField$0 |= 0x2;
			ach_can_fetch$field = value;
		}

		public function get achCanFetch():int {
			return ach_can_fetch$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var placeInfos$index:uint = 0; placeInfos$index < this.placeInfos.length; ++placeInfos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.placeInfos[placeInfos$index]);
			}
			if (hasQuestCanFetch) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, quest_can_fetch$field);
			}
			if (hasAchCanFetch) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, ach_can_fetch$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var quest_can_fetch$count:uint = 0;
			var ach_can_fetch$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.placeInfos.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.hallserver.place_info()));
					break;
				case 2:
					if (quest_can_fetch$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_update_places.questCanFetch cannot be set twice.');
					}
					++quest_can_fetch$count;
					this.questCanFetch = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (ach_can_fetch$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_update_places.achCanFetch cannot be set twice.');
					}
					++ach_can_fetch$count;
					this.achCanFetch = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
