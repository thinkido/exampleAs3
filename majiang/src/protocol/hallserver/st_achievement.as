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
	public dynamic final class st_achievement extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.st_achievement.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const COMPLETE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.st_achievement.complete", "complete", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var complete$field:Boolean;

		public function clearComplete():void {
			hasField$0 &= 0xfffffffd;
			complete$field = new Boolean();
		}

		public function get hasComplete():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set complete(value:Boolean):void {
			hasField$0 |= 0x2;
			complete$field = value;
		}

		public function get complete():Boolean {
			return complete$field;
		}

		/**
		 *  @private
		 */
		public static const COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.st_achievement.count", "count", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var count$field:int;

		public function clearCount():void {
			hasField$0 &= 0xfffffffb;
			count$field = new int();
		}

		public function get hasCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set count(value:int):void {
			hasField$0 |= 0x4;
			count$field = value;
		}

		public function get count():int {
			return count$field;
		}

		/**
		 *  @private
		 */
		public static const FETCHED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.st_achievement.fetched", "fetched", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fetched$field:Boolean;

		public function clearFetched():void {
			hasField$0 &= 0xfffffff7;
			fetched$field = new Boolean();
		}

		public function get hasFetched():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set fetched(value:Boolean):void {
			hasField$0 |= 0x8;
			fetched$field = value;
		}

		public function get fetched():Boolean {
			return fetched$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasComplete) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, complete$field);
			}
			if (hasCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, count$field);
			}
			if (hasFetched) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, fetched$field);
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
			var complete$count:uint = 0;
			var count$count:uint = 0;
			var fetched$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_achievement.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (complete$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_achievement.complete cannot be set twice.');
					}
					++complete$count;
					this.complete = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 3:
					if (count$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_achievement.count cannot be set twice.');
					}
					++count$count;
					this.count = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (fetched$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_achievement.fetched cannot be set twice.');
					}
					++fetched$count;
					this.fetched = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
