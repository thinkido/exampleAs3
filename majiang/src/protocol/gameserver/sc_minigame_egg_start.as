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
	import protos.gameserver.t_egg_item;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_minigame_egg_start extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EGGS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.gameserver.sc_minigame_egg_start.eggs", "eggs", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.gameserver.t_egg_item; });

		[ArrayElementType("protos.gameserver.t_egg_item")]
		public var eggs:Array = [];

		/**
		 *  @private
		 */
		public static const AWARDS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.gameserver.sc_minigame_egg_start.awards", "awards", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.gameserver.t_award_item; });

		[ArrayElementType("protos.gameserver.t_award_item")]
		public var awards:Array = [];

		/**
		 *  @private
		 */
		public static const REMAIN_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_minigame_egg_start.remain_times", "remainTimes", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var remain_times$field:int;

		private var hasField$0:uint = 0;

		public function clearRemainTimes():void {
			hasField$0 &= 0xfffffffe;
			remain_times$field = new int();
		}

		public function get hasRemainTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set remainTimes(value:int):void {
			hasField$0 |= 0x1;
			remain_times$field = value;
		}

		public function get remainTimes():int {
			return remain_times$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_REMAIN_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_minigame_egg_start.change_remain_times", "changeRemainTimes", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var change_remain_times$field:int;

		public function clearChangeRemainTimes():void {
			hasField$0 &= 0xfffffffd;
			change_remain_times$field = new int();
		}

		public function get hasChangeRemainTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set changeRemainTimes(value:int):void {
			hasField$0 |= 0x2;
			change_remain_times$field = value;
		}

		public function get changeRemainTimes():int {
			return change_remain_times$field;
		}

		/**
		 *  @private
		 */
		public static const CURRENT_BASE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_minigame_egg_start.current_base", "currentBase", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var current_base$field:int;

		public function clearCurrentBase():void {
			hasField$0 &= 0xfffffffb;
			current_base$field = new int();
		}

		public function get hasCurrentBase():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set currentBase(value:int):void {
			hasField$0 |= 0x4;
			current_base$field = value;
		}

		public function get currentBase():int {
			return current_base$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var eggs$index:uint = 0; eggs$index < this.eggs.length; ++eggs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.eggs[eggs$index]);
			}
			for (var awards$index:uint = 0; awards$index < this.awards.length; ++awards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.awards[awards$index]);
			}
			if (hasRemainTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, remain_times$field);
			}
			if (hasChangeRemainTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, change_remain_times$field);
			}
			if (hasCurrentBase) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, current_base$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var remain_times$count:uint = 0;
			var change_remain_times$count:uint = 0;
			var current_base$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.eggs.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protos.gameserver.t_egg_item()));
					break;
				case 2:
					this.awards.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protos.gameserver.t_award_item()));
					break;
				case 3:
					if (remain_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_egg_start.remainTimes cannot be set twice.');
					}
					++remain_times$count;
					this.remainTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (change_remain_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_egg_start.changeRemainTimes cannot be set twice.');
					}
					++change_remain_times$count;
					this.changeRemainTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (current_base$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_egg_start.currentBase cannot be set twice.');
					}
					++current_base$count;
					this.currentBase = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
