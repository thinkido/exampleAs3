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
	public dynamic final class cs_chat extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.gameserver.cs_chat.seat_index", "seatIndex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var seat_index$field:int;

		private var hasField$0:uint = 0;

		public function clearSeatIndex():void {
			hasField$0 &= 0xfffffffe;
			seat_index$field = new int();
		}

		public function get hasSeatIndex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set seatIndex(value:int):void {
			hasField$0 |= 0x1;
			seat_index$field = value;
		}

		public function get seatIndex():int {
			return seat_index$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.gameserver.cs_chat.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const ID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.gameserver.cs_chat.id", "id", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IDTYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.gameserver.cs_chat.idtype", "idtype", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const MSG:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.gameserver.cs_chat.msg", "msg", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var msg$field:String;

		public function clearMsg():void {
			msg$field = null;
		}

		public function get hasMsg():Boolean {
			return msg$field != null;
		}

		public function set msg(value:String):void {
			msg$field = value;
		}

		public function get msg():String {
			return msg$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat_index$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, id$field);
			}
			if (hasIdtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, idtype$field);
			}
			if (hasMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, msg$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var seat_index$count:uint = 0;
			var name$count:uint = 0;
			var id$count:uint = 0;
			var idtype$count:uint = 0;
			var msg$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_chat.seatIndex cannot be set twice.');
					}
					++seat_index$count;
					this.seatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_chat.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_chat.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (idtype$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_chat.idtype cannot be set twice.');
					}
					++idtype$count;
					this.idtype = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (msg$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_chat.msg cannot be set twice.');
					}
					++msg$count;
					this.msg = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
