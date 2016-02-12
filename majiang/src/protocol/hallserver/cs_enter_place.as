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
	public dynamic final class cs_enter_place extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PLACE_ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_enter_place.place_id", "placeId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var place_id$field:String;

		public function clearPlaceId():void {
			place_id$field = null;
		}

		public function get hasPlaceId():Boolean {
			return place_id$field != null;
		}

		public function set placeId(value:String):void {
			place_id$field = value;
		}

		public function get placeId():String {
			return place_id$field;
		}

		/**
		 *  @private
		 */
		public static const USR_KEY:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_enter_place.usr_key", "usrKey", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var usr_key$field:String;

		public function clearUsrKey():void {
			usr_key$field = null;
		}

		public function get hasUsrKey():Boolean {
			return usr_key$field != null;
		}

		public function set usrKey(value:String):void {
			usr_key$field = value;
		}

		public function get usrKey():String {
			return usr_key$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPlaceId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, place_id$field);
			}
			if (hasUsrKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, usr_key$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var place_id$count:uint = 0;
			var usr_key$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (place_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_enter_place.placeId cannot be set twice.');
					}
					++place_id$count;
					this.placeId = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (usr_key$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_enter_place.usrKey cannot be set twice.');
					}
					++usr_key$count;
					this.usrKey = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
