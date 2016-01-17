package protos.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.gameserver.all_seq_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_end_game extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEQ_INFOS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.gameserver.sc_end_game.seq_infos", "seqInfos", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.gameserver.all_seq_info; });

		[ArrayElementType("protos.gameserver.all_seq_info")]
		public var seqInfos:Array = [];

		/**
		 *  @private
		 */
		public static const LIUJU:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protos.gameserver.sc_end_game.liuju", "liuju", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var liuju$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearLiuju():void {
			hasField$0 &= 0xfffffffe;
			liuju$field = new Boolean();
		}

		public function get hasLiuju():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set liuju(value:Boolean):void {
			hasField$0 |= 0x1;
			liuju$field = value;
		}

		public function get liuju():Boolean {
			return liuju$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var seqInfos$index:uint = 0; seqInfos$index < this.seqInfos.length; ++seqInfos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.seqInfos[seqInfos$index]);
			}
			if (hasLiuju) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, liuju$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var liuju$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.seqInfos.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protos.gameserver.all_seq_info()));
					break;
				case 2:
					if (liuju$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_end_game.liuju cannot be set twice.');
					}
					++liuju$count;
					this.liuju = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
