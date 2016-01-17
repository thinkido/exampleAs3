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
	public dynamic final class sc_minigame_egg_change_group extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EGGS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.gameserver.sc_minigame_egg_change_group.eggs", "eggs", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.gameserver.t_egg_item; });

		[ArrayElementType("protos.gameserver.t_egg_item")]
		public var eggs:Array = [];

		/**
		 *  @private
		 */
		public static const AWARDS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.gameserver.sc_minigame_egg_change_group.awards", "awards", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.gameserver.t_award_item; });

		[ArrayElementType("protos.gameserver.t_award_item")]
		public var awards:Array = [];

		/**
		 *  @private
		 */
		public static const CHANGE_REMAIN_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.sc_minigame_egg_change_group.change_remain_times", "changeRemainTimes", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var change_remain_times$field:int;

		private var hasField$0:uint = 0;

		public function clearChangeRemainTimes():void {
			hasField$0 &= 0xfffffffe;
			change_remain_times$field = new int();
		}

		public function get hasChangeRemainTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set changeRemainTimes(value:int):void {
			hasField$0 |= 0x1;
			change_remain_times$field = value;
		}

		public function get changeRemainTimes():int {
			return change_remain_times$field;
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
			if (hasChangeRemainTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, change_remain_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var change_remain_times$count:uint = 0;
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
					if (change_remain_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_minigame_egg_change_group.changeRemainTimes cannot be set twice.');
					}
					++change_remain_times$count;
					this.changeRemainTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
