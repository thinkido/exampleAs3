package protos.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.hallserver.t_duration;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class t_myitem extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_myitem.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SHOPID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_myitem.shopid", "shopid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shopid$field:int;

		public function clearShopid():void {
			hasField$0 &= 0xfffffffd;
			shopid$field = new int();
		}

		public function get hasShopid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set shopid(value:int):void {
			hasField$0 |= 0x2;
			shopid$field = value;
		}

		public function get shopid():int {
			return shopid$field;
		}

		/**
		 *  @private
		 */
		public static const COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_myitem.count", "count", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const STATUS:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_myitem.status", "status", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var status$field:int;

		public function clearStatus():void {
			hasField$0 &= 0xfffffff7;
			status$field = new int();
		}

		public function get hasStatus():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set status(value:int):void {
			hasField$0 |= 0x8;
			status$field = value;
		}

		public function get status():int {
			return status$field;
		}

		/**
		 *  @private
		 */
		public static const DURATION:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protos.hallserver.t_myitem.duration", "duration", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.hallserver.t_duration; });

		private var duration$field:protos.hallserver.t_duration;

		public function clearDuration():void {
			duration$field = null;
		}

		public function get hasDuration():Boolean {
			return duration$field != null;
		}

		public function set duration(value:protos.hallserver.t_duration):void {
			duration$field = value;
		}

		public function get duration():protos.hallserver.t_duration {
			return duration$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasShopid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, shopid$field);
			}
			if (hasCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, count$field);
			}
			if (hasStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, status$field);
			}
			if (hasDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, duration$field);
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
			var shopid$count:uint = 0;
			var count$count:uint = 0;
			var status$count:uint = 0;
			var duration$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_myitem.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (shopid$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_myitem.shopid cannot be set twice.');
					}
					++shopid$count;
					this.shopid = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (count$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_myitem.count cannot be set twice.');
					}
					++count$count;
					this.count = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (status$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_myitem.status cannot be set twice.');
					}
					++status$count;
					this.status = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_myitem.duration cannot be set twice.');
					}
					++duration$count;
					this.duration = new protos.hallserver.t_duration();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.duration);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
