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
	public dynamic final class cs_invite_company extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_invite_company.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const SEAT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.cs_invite_company.seat", "seat", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var seat$field:int;

		private var hasField$0:uint = 0;

		public function clearSeat():void {
			hasField$0 &= 0xfffffffe;
			seat$field = new int();
		}

		public function get hasSeat():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set seat(value:int):void {
			hasField$0 |= 0x1;
			seat$field = value;
		}

		public function get seat():int {
			return seat$field;
		}

		/**
		 *  @private
		 */
		public static const HOST:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_invite_company.host", "host", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var host$field:String;

		public function clearHost():void {
			host$field = null;
		}

		public function get hasHost():Boolean {
			return host$field != null;
		}

		public function set host(value:String):void {
			host$field = value;
		}

		public function get host():String {
			return host$field;
		}

		/**
		 *  @private
		 */
		public static const PORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.cs_invite_company.port", "port", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var port$field:int;

		public function clearPort():void {
			hasField$0 &= 0xfffffffd;
			port$field = new int();
		}

		public function get hasPort():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set port(value:int):void {
			hasField$0 |= 0x2;
			port$field = value;
		}

		public function get port():int {
			return port$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.cs_invite_company.roomid", "roomid", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var roomid$field:int;

		public function clearRoomid():void {
			hasField$0 &= 0xfffffffb;
			roomid$field = new int();
		}

		public function get hasRoomid():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set roomid(value:int):void {
			hasField$0 |= 0x4;
			roomid$field = value;
		}

		public function get roomid():int {
			return roomid$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_invite_company.id", "id", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.cs_invite_company.idtype", "idtype", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasSeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat$field);
			}
			if (hasHost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, host$field);
			}
			if (hasPort) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, port$field);
			}
			if (hasRoomid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, roomid$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
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
			var name$count:uint = 0;
			var seat$count:uint = 0;
			var host$count:uint = 0;
			var port$count:uint = 0;
			var roomid$count:uint = 0;
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_invite_company.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_invite_company.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (host$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_invite_company.host cannot be set twice.');
					}
					++host$count;
					this.host = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (port$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_invite_company.port cannot be set twice.');
					}
					++port$count;
					this.port = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (roomid$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_invite_company.roomid cannot be set twice.');
					}
					++roomid$count;
					this.roomid = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_invite_company.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 7:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_invite_company.idtype cannot be set twice.');
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
