package protos.gameserver {
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
	public dynamic final class t_award_item extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const AWARD_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.t_award_item.award_id", "awardId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var award_id$field:int;

		private var hasField$0:uint = 0;

		public function clearAwardId():void {
			hasField$0 &= 0xfffffffe;
			award_id$field = new int();
		}

		public function get hasAwardId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set awardId(value:int):void {
			hasField$0 |= 0x1;
			award_id$field = value;
		}

		public function get awardId():int {
			return award_id$field;
		}

		/**
		 *  @private
		 */
		public static const AWARD_DESC:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.gameserver.t_award_item.award_desc", "awardDesc", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var award_desc$field:String;

		public function clearAwardDesc():void {
			award_desc$field = null;
		}

		public function get hasAwardDesc():Boolean {
			return award_desc$field != null;
		}

		public function set awardDesc(value:String):void {
			award_desc$field = value;
		}

		public function get awardDesc():String {
			return award_desc$field;
		}

		/**
		 *  @private
		 */
		public static const AWARD_AVAILABLE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protos.gameserver.t_award_item.award_available", "awardAvailable", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var award_available$field:Boolean;

		public function clearAwardAvailable():void {
			hasField$0 &= 0xfffffffd;
			award_available$field = new Boolean();
		}

		public function get hasAwardAvailable():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set awardAvailable(value:Boolean):void {
			hasField$0 |= 0x2;
			award_available$field = value;
		}

		public function get awardAvailable():Boolean {
			return award_available$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAwardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, award_id$field);
			}
			if (hasAwardDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, award_desc$field);
			}
			if (hasAwardAvailable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, award_available$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var award_id$count:uint = 0;
			var award_desc$count:uint = 0;
			var award_available$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (award_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_award_item.awardId cannot be set twice.');
					}
					++award_id$count;
					this.awardId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (award_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_award_item.awardDesc cannot be set twice.');
					}
					++award_desc$count;
					this.awardDesc = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (award_available$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_award_item.awardAvailable cannot be set twice.');
					}
					++award_available$count;
					this.awardAvailable = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
