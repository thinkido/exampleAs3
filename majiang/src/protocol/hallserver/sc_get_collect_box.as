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
	public dynamic final class sc_get_collect_box extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const C_WAN:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protos.hallserver.sc_get_collect_box.c_wan", "cWan", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var cWan:Array = [];

		/**
		 *  @private
		 */
		public static const C_TONG:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protos.hallserver.sc_get_collect_box.c_tong", "cTong", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var cTong:Array = [];

		/**
		 *  @private
		 */
		public static const C_TIAO:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protos.hallserver.sc_get_collect_box.c_tiao", "cTiao", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var cTiao:Array = [];

		/**
		 *  @private
		 */
		public static const AWARD_VERT:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protos.hallserver.sc_get_collect_box.award_vert", "awardVert", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var awardVert:Array = [];

		/**
		 *  @private
		 */
		public static const AWARD_HORI:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protos.hallserver.sc_get_collect_box.award_hori", "awardHori", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var awardHori:Array = [];

		/**
		 *  @private
		 */
		public static const AWARD_STATUS:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_get_collect_box.award_status", "awardStatus", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var award_status$field:int;

		private var hasField$0:uint = 0;

		public function clearAwardStatus():void {
			hasField$0 &= 0xfffffffe;
			award_status$field = new int();
		}

		public function get hasAwardStatus():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set awardStatus(value:int):void {
			hasField$0 |= 0x1;
			award_status$field = value;
		}

		public function get awardStatus():int {
			return award_status$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var cWan$index:uint = 0; cWan$index < this.cWan.length; ++cWan$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.cWan[cWan$index]);
			}
			for (var cTong$index:uint = 0; cTong$index < this.cTong.length; ++cTong$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.cTong[cTong$index]);
			}
			for (var cTiao$index:uint = 0; cTiao$index < this.cTiao.length; ++cTiao$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.cTiao[cTiao$index]);
			}
			for (var awardVert$index:uint = 0; awardVert$index < this.awardVert.length; ++awardVert$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.awardVert[awardVert$index]);
			}
			for (var awardHori$index:uint = 0; awardHori$index < this.awardHori.length; ++awardHori$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.awardHori[awardHori$index]);
			}
			if (hasAwardStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, award_status$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var award_status$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.cWan);
						break;
					}
					this.cWan.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.cTong);
						break;
					}
					this.cTong.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.cTiao);
						break;
					}
					this.cTiao.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.awardVert);
						break;
					}
					this.awardVert.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.awardHori);
						break;
					}
					this.awardHori.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 6:
					if (award_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_get_collect_box.awardStatus cannot be set twice.');
					}
					++award_status$count;
					this.awardStatus = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
