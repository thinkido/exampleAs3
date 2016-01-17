package protos.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.hallserver.t_shopitem;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_shoplist extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SHOP_DISCOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_shoplist.shop_discount", "shopDiscount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shop_discount$field:int;

		private var hasField$0:uint = 0;

		public function clearShopDiscount():void {
			hasField$0 &= 0xfffffffe;
			shop_discount$field = new int();
		}

		public function get hasShopDiscount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set shopDiscount(value:int):void {
			hasField$0 |= 0x1;
			shop_discount$field = value;
		}

		public function get shopDiscount():int {
			return shop_discount$field;
		}

		/**
		 *  @private
		 */
		public static const SHOP_MAINTAIN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protos.hallserver.sc_shoplist.shop_maintain", "shopMaintain", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shop_maintain$field:Boolean;

		public function clearShopMaintain():void {
			hasField$0 &= 0xfffffffd;
			shop_maintain$field = new Boolean();
		}

		public function get hasShopMaintain():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set shopMaintain(value:Boolean):void {
			hasField$0 |= 0x2;
			shop_maintain$field = value;
		}

		public function get shopMaintain():Boolean {
			return shop_maintain$field;
		}

		/**
		 *  @private
		 */
		public static const LISTS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.hallserver.sc_shoplist.lists", "lists", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.hallserver.t_shopitem; });

		[ArrayElementType("protos.hallserver.t_shopitem")]
		public var lists:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasShopDiscount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, shop_discount$field);
			}
			if (hasShopMaintain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, shop_maintain$field);
			}
			for (var lists$index:uint = 0; lists$index < this.lists.length; ++lists$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.lists[lists$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var shop_discount$count:uint = 0;
			var shop_maintain$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (shop_discount$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_shoplist.shopDiscount cannot be set twice.');
					}
					++shop_discount$count;
					this.shopDiscount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (shop_maintain$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_shoplist.shopMaintain cannot be set twice.');
					}
					++shop_maintain$count;
					this.shopMaintain = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 3:
					this.lists.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protos.hallserver.t_shopitem()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
