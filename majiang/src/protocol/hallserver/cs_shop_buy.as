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
	public dynamic final class cs_shop_buy extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SHOPID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.cs_shop_buy.shopid", "shopid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shopid$field:int;

		private var hasField$0:uint = 0;

		public function clearShopid():void {
			hasField$0 &= 0xfffffffe;
			shopid$field = new int();
		}

		public function get hasShopid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set shopid(value:int):void {
			hasField$0 |= 0x1;
			shopid$field = value;
		}

		public function get shopid():int {
			return shopid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasShopid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, shopid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var shopid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (shopid$count != 0) {
						throw new flash.errors.IOError('Bad data format: cs_shop_buy.shopid cannot be set twice.');
					}
					++shopid$count;
					this.shopid = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
