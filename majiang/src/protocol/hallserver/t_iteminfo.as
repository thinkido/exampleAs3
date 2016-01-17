package protos.hallserver {
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
	public dynamic final class t_iteminfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_iteminfo.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.t_iteminfo.type", "type", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		public function clearType():void {
			hasField$0 &= 0xfffffffd;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x2;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.t_iteminfo.name", "name", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const DESC:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.t_iteminfo.desc", "desc", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:String;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:String):void {
			desc$field = value;
		}

		public function get desc():String {
			return desc$field;
		}

		/**
		 *  @private
		 */
		public static const IMAGE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.t_iteminfo.image", "image", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var image$field:String;

		public function clearImage():void {
			image$field = null;
		}

		public function get hasImage():Boolean {
			return image$field != null;
		}

		public function set image(value:String):void {
			image$field = value;
		}

		public function get image():String {
			return image$field;
		}

		/**
		 *  @private
		 */
		public static const USE_TYPE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.t_iteminfo.use_type", "useType", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var use_type$field:String;

		public function clearUseType():void {
			use_type$field = null;
		}

		public function get hasUseType():Boolean {
			return use_type$field != null;
		}

		public function set useType(value:String):void {
			use_type$field = value;
		}

		public function get useType():String {
			return use_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, type$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, desc$field);
			}
			if (hasImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, image$field);
			}
			if (hasUseType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, use_type$field);
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
			var type$count:uint = 0;
			var name$count:uint = 0;
			var desc$count:uint = 0;
			var image$count:uint = 0;
			var use_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_iteminfo.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_iteminfo.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_iteminfo.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_iteminfo.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (image$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_iteminfo.image cannot be set twice.');
					}
					++image$count;
					this.image = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 6:
					if (use_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_iteminfo.useType cannot be set twice.');
					}
					++use_type$count;
					this.useType = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
