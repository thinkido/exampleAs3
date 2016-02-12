package protocol.hallserver {
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
	public dynamic final class cs_update_profile extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.cs_update_profile.sex", "sex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sex$field:int;

		private var hasField$0:uint = 0;

		public function clearSex():void {
			hasField$0 &= 0xfffffffe;
			sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x1;
			sex$field = value;
		}

		public function get sex():int {
			return sex$field;
		}

		/**
		 *  @private
		 */
		public static const PORTRAIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.cs_update_profile.portrait", "portrait", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var portrait$field:int;

		public function clearPortrait():void {
			hasField$0 &= 0xfffffffd;
			portrait$field = new int();
		}

		public function get hasPortrait():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set portrait(value:int):void {
			hasField$0 |= 0x2;
			portrait$field = value;
		}

		public function get portrait():int {
			return portrait$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, sex$field);
			}
			if (hasPortrait) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, portrait$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var sex$count:uint = 0;
			var portrait$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_update_profile.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (portrait$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_update_profile.portrait cannot be set twice.');
					}
					++portrait$count;
					this.portrait = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
