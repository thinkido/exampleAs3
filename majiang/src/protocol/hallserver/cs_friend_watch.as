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
	public dynamic final class cs_friend_watch extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WATCH:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.cs_friend_watch.watch", "watch", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var watch$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearWatch():void {
			hasField$0 &= 0xfffffffe;
			watch$field = new Boolean();
		}

		public function get hasWatch():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set watch(value:Boolean):void {
			hasField$0 |= 0x1;
			watch$field = value;
		}

		public function get watch():Boolean {
			return watch$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_friend_watch.id", "id", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_friend_watch.idtype", "idtype", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWatch) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, watch$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, idtype$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var watch$count:uint = 0;
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (watch$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_friend_watch.watch cannot be set twice.');
					}
					++watch$count;
					this.watch = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_friend_watch.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_friend_watch.idtype cannot be set twice.');
					}
					++idtype$count;
					this.idtype = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
