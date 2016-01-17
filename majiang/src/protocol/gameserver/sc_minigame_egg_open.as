package protos.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.gameserver.t_award_item;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_minigame_egg_open extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EGG_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_minigame_egg_open.egg_index", "eggIndex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var egg_index$field:int;

		private var hasField$0:uint = 0;

		public function clearEggIndex():void {
			hasField$0 &= 0xfffffffe;
			egg_index$field = new int();
		}

		public function get hasEggIndex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set eggIndex(value:int):void {
			hasField$0 |= 0x1;
			egg_index$field = value;
		}

		public function get eggIndex():int {
			return egg_index$field;
		}

		/**
		 *  @private
		 */
		public static const AWARD:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protos.gameserver.sc_minigame_egg_open.award", "award", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.gameserver.t_award_item; });

		private var award$field:protos.gameserver.t_award_item;

		public function clearAward():void {
			award$field = null;
		}

		public function get hasAward():Boolean {
			return award$field != null;
		}

		public function set award(value:protos.gameserver.t_award_item):void {
			award$field = value;
		}

		public function get award():protos.gameserver.t_award_item {
			return award$field;
		}

		/**
		 *  @private
		 */
		public static const REMAIN_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_minigame_egg_open.remain_times", "remainTimes", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var remain_times$field:int;

		public function clearRemainTimes():void {
			hasField$0 &= 0xfffffffd;
			remain_times$field = new int();
		}

		public function get hasRemainTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set remainTimes(value:int):void {
			hasField$0 |= 0x2;
			remain_times$field = value;
		}

		public function get remainTimes():int {
			return remain_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEggIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, egg_index$field);
			}
			if (hasAward) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, award$field);
			}
			if (hasRemainTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, remain_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var egg_index$count:uint = 0;
			var award$count:uint = 0;
			var remain_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (egg_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_egg_open.eggIndex cannot be set twice.');
					}
					++egg_index$count;
					this.eggIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (award$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_egg_open.award cannot be set twice.');
					}
					++award$count;
					this.award = new protos.gameserver.t_award_item();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.award);
					break;
				case 3:
					if (remain_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_egg_open.remainTimes cannot be set twice.');
					}
					++remain_times$count;
					this.remainTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
