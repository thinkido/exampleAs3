package protocol.gameserver {
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
	public dynamic final class st_hu_desc extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE1:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.st_hu_desc.type1", "type1", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type1$field:int;

		private var hasField$0:uint = 0;

		public function clearType1():void {
			hasField$0 &= 0xfffffffe;
			type1$field = new int();
		}

		public function get hasType1():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type1(value:int):void {
			hasField$0 |= 0x1;
			type1$field = value;
		}

		public function get type1():int {
			return type1$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE2:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.st_hu_desc.type2", "type2", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type2$field:int;

		public function clearType2():void {
			hasField$0 &= 0xfffffffd;
			type2$field = new int();
		}

		public function get hasType2():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set type2(value:int):void {
			hasField$0 |= 0x2;
			type2$field = value;
		}

		public function get type2():int {
			return type2$field;
		}

		/**
		 *  @private
		 */
		public static const GEN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.st_hu_desc.gen", "gen", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gen$field:int;

		public function clearGen():void {
			hasField$0 &= 0xfffffffb;
			gen$field = new int();
		}

		public function get hasGen():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set gen(value:int):void {
			hasField$0 |= 0x4;
			gen$field = value;
		}

		public function get gen():int {
			return gen$field;
		}

		/**
		 *  @private
		 */
		public static const SELF_MO:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protocol.gameserver.st_hu_desc.self_mo", "selfMo", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var self_mo$field:Boolean;

		public function clearSelfMo():void {
			hasField$0 &= 0xfffffff7;
			self_mo$field = new Boolean();
		}

		public function get hasSelfMo():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set selfMo(value:Boolean):void {
			hasField$0 |= 0x8;
			self_mo$field = value;
		}

		public function get selfMo():Boolean {
			return self_mo$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.st_hu_desc.type", "type", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		public function clearType():void {
			hasField$0 &= 0xffffffef;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x10;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const FAN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.st_hu_desc.fan", "fan", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fan$field:int;

		public function clearFan():void {
			hasField$0 &= 0xffffffdf;
			fan$field = new int();
		}

		public function get hasFan():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set fan(value:int):void {
			hasField$0 |= 0x20;
			fan$field = value;
		}

		public function get fan():int {
			return fan$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, type1$field);
			}
			if (hasType2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, type2$field);
			}
			if (hasGen) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, gen$field);
			}
			if (hasSelfMo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, self_mo$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, type$field);
			}
			if (hasFan) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fan$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type1$count:uint = 0;
			var type2$count:uint = 0;
			var gen$count:uint = 0;
			var self_mo$count:uint = 0;
			var type$count:uint = 0;
			var fan$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type1$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_hu_desc.type1 cannot be set twice.');
					}
					++type1$count;
					this.type1 = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (type2$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_hu_desc.type2 cannot be set twice.');
					}
					++type2$count;
					this.type2 = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (gen$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_hu_desc.gen cannot be set twice.');
					}
					++gen$count;
					this.gen = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (self_mo$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_hu_desc.selfMo cannot be set twice.');
					}
					++self_mo$count;
					this.selfMo = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 5:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_hu_desc.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (fan$count != 0) {
						throw new flash.errors.IOError('Bad data format: st_hu_desc.fan cannot be set twice.');
					}
					++fan$count;
					this.fan = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
