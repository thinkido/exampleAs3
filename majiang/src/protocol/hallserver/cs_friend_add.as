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
	public dynamic final class cs_friend_add extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.cs_friend_add.oid", "oid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var oid$field:int;

		private var hasField$0:uint = 0;

		public function clearOid():void {
			hasField$0 &= 0xfffffffe;
			oid$field = new int();
		}

		public function get hasOid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set oid(value:int):void {
			hasField$0 |= 0x1;
			oid$field = value;
		}

		public function get oid():int {
			return oid$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_friend_add.id", "id", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var id$field:String;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:String):void {
			id$field = value;
		}

		public function get id():String {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_friend_add.idtype", "idtype", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var idtype$field:String;

		public function clearIdtype():void {
			idtype$field = null;
		}

		public function get hasIdtype():Boolean {
			return idtype$field != null;
		}

		public function set idtype(value:String):void {
			idtype$field = value;
		}

		public function get idtype():String {
			return idtype$field;
		}

		/**
		 *  @private
		 */
		public static const BYOID:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.cs_friend_add.byoid", "byoid", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var byoid$field:Boolean;

		public function clearByoid():void {
			hasField$0 &= 0xfffffffd;
			byoid$field = new Boolean();
		}

		public function get hasByoid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set byoid(value:Boolean):void {
			hasField$0 |= 0x2;
			byoid$field = value;
		}

		public function get byoid():Boolean {
			return byoid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, oid$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, idtype$field);
			}
			if (hasByoid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, byoid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var oid$count:uint = 0;
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			var byoid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (oid$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_friend_add.oid cannot be set twice.');
					}
					++oid$count;
					this.oid = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_friend_add.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_friend_add.idtype cannot be set twice.');
					}
					++idtype$count;
					this.idtype = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (byoid$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_friend_add.byoid cannot be set twice.');
					}
					++byoid$count;
					this.byoid = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
