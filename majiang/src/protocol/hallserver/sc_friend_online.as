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
	public dynamic final class sc_friend_online extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ONLINE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.sc_friend_online.online", "online", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var online$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearOnline():void {
			hasField$0 &= 0xfffffffe;
			online$field = new Boolean();
		}

		public function get hasOnline():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set online(value:Boolean):void {
			hasField$0 |= 0x1;
			online$field = value;
		}

		public function get online():Boolean {
			return online$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_friend_online.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const DUAL_FRIEND:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.hallserver.sc_friend_online.dual_friend", "dualFriend", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dual_friend$field:Boolean;

		public function clearDualFriend():void {
			hasField$0 &= 0xfffffffd;
			dual_friend$field = new Boolean();
		}

		public function get hasDualFriend():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set dualFriend(value:Boolean):void {
			hasField$0 |= 0x2;
			dual_friend$field = value;
		}

		public function get dualFriend():Boolean {
			return dual_friend$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_friend_online.id", "id", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.sc_friend_online.idtype", "idtype", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			if (hasOnline) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, online$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasDualFriend) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, dual_friend$field);
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
			var online$count:uint = 0;
			var name$count:uint = 0;
			var dual_friend$count:uint = 0;
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (online$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_online.online cannot be set twice.');
					}
					++online$count;
					this.online = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_online.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (dual_friend$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_online.dualFriend cannot be set twice.');
					}
					++dual_friend$count;
					this.dualFriend = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_online.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_friend_online.idtype cannot be set twice.');
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
