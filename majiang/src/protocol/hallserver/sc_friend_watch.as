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
	public dynamic final class sc_friend_watch extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.sc_friend_watch.result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var result$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearResult():void {
			hasField$0 &= 0xfffffffe;
			result$field = new Boolean();
		}

		public function get hasResult():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set result(value:Boolean):void {
			hasField$0 |= 0x1;
			result$field = value;
		}

		public function get result():Boolean {
			return result$field;
		}

		/**
		 *  @private
		 */
		public static const REASON:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.sc_friend_watch.reason", "reason", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var reason$field:int;

		public function clearReason():void {
			hasField$0 &= 0xfffffffd;
			reason$field = new int();
		}

		public function get hasReason():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set reason(value:int):void {
			hasField$0 |= 0x2;
			reason$field = value;
		}

		public function get reason():int {
			return reason$field;
		}

		/**
		 *  @private
		 */
		public static const WATCH:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.sc_friend_watch.watch", "watch", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var watch$field:Boolean;

		public function clearWatch():void {
			hasField$0 &= 0xfffffffb;
			watch$field = new Boolean();
		}

		public function get hasWatch():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set watch(value:Boolean):void {
			hasField$0 |= 0x4;
			watch$field = value;
		}

		public function get watch():Boolean {
			return watch$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_friend_watch.id", "id", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_friend_watch.idtype", "idtype", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			if (hasResult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, result$field);
			}
			if (hasReason) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, reason$field);
			}
			if (hasWatch) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, watch$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
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
			var result$count:uint = 0;
			var reason$count:uint = 0;
			var watch$count:uint = 0;
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_watch.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (reason$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_watch.reason cannot be set twice.');
					}
					++reason$count;
					this.reason = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (watch$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_watch.watch cannot be set twice.');
					}
					++watch$count;
					this.watch = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_watch.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_watch.idtype cannot be set twice.');
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
