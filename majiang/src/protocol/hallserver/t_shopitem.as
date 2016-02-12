package protocol.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.hallserver.t_checkout;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class t_shopitem extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_shopitem.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SHOPID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_shopitem.shopid", "shopid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const PRODUCTID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protocol.hallserver.t_shopitem.productid", "productid", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var productid$field:String;

		public function clearProductid():void {
			productid$field = null;
		}

		public function get hasProductid():Boolean {
			return productid$field != null;
		}

		public function set productid(value:String):void {
			productid$field = value;
		}

		public function get productid():String {
			return productid$field;
		}

		/**
		 *  @private
		 */
		public static const CHECKOUT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protocol.hallserver.t_shopitem.checkout", "checkout", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.hallserver.t_checkout; });

		private var checkout$field:protocol.hallserver.t_checkout;

		public function clearCheckout():void {
			checkout$field = null;
		}

		public function get hasCheckout():Boolean {
			return checkout$field != null;
		}

		public function set checkout(value:protocol.hallserver.t_checkout):void {
			checkout$field = value;
		}

		public function get checkout():protocol.hallserver.t_checkout {
			return checkout$field;
		}

		/**
		 *  @private
		 */
		public static const DISCOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_shopitem.discount", "discount", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var discount$field:int;

		public function clearDiscount():void {
			hasField$0 &= 0xfffffffb;
			discount$field = new int();
		}

		public function get hasDiscount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set discount(value:int):void {
			hasField$0 |= 0x4;
			discount$field = value;
		}

		public function get discount():int {
			return discount$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_DISCOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.hallserver.t_shopitem.vip_discount", "vipDiscount", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_discount$field:int;

		public function clearVipDiscount():void {
			hasField$0 &= 0xfffffff7;
			vip_discount$field = new int();
		}

		public function get hasVipDiscount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set vipDiscount(value:int):void {
			hasField$0 |= 0x8;
			vip_discount$field = value;
		}

		public function get vipDiscount():int {
			return vip_discount$field;
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
			if (hasProductid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, productid$field);
			}
			if (hasCheckout) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, checkout$field);
			}
			if (hasDiscount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, discount$field);
			}
			if (hasVipDiscount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vip_discount$field);
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
			var productid$count:uint = 0;
			var checkout$count:uint = 0;
			var discount$count:uint = 0;
			var vip_discount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_shopitem.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (shopid$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_shopitem.shopid cannot be set twice.');
					}
					++shopid$count;
					this.shopid = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (productid$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_shopitem.productid cannot be set twice.');
					}
					++productid$count;
					this.productid = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (checkout$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_shopitem.checkout cannot be set twice.');
					}
					++checkout$count;
					this.checkout = new protocol.hallserver.t_checkout();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.checkout);
					break;
				case 7:
					if (discount$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_shopitem.discount cannot be set twice.');
					}
					++discount$count;
					this.discount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (vip_discount$count != 0) {
						throw new flash.errors.IOError('Bad data format: t_shopitem.vipDiscount cannot be set twice.');
					}
					++vip_discount$count;
					this.vipDiscount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
