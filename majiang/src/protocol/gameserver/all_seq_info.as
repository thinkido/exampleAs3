package protocol.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protocol.gameserver.st_hand_seq;
	import protocol.gameserver.sccomplex_tile;
	import protocol.gameserver.st_hu_desc;
	import protocol.gameserver.st_money_transfer;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class all_seq_info extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.all_seq_info.seat_index", "seatIndex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const WAN_GANG_MT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.wan_gang_mt", "wanGangMt", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_money_transfer; });

		[ArrayElementType("protocol.gameserver.st_money_transfer")]
		public var wanGangMt:Array = [];

		/**
		 *  @private
		 */
		public static const ZHI_GANG_MT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.zhi_gang_mt", "zhiGangMt", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_money_transfer; });

		[ArrayElementType("protocol.gameserver.st_money_transfer")]
		public var zhiGangMt:Array = [];

		/**
		 *  @private
		 */
		public static const AN_GANG_MT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.an_gang_mt", "anGangMt", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_money_transfer; });

		[ArrayElementType("protocol.gameserver.st_money_transfer")]
		public var anGangMt:Array = [];

		/**
		 *  @private
		 */
		public static const HU_MT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.hu_mt", "huMt", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_money_transfer; });

		[ArrayElementType("protocol.gameserver.st_money_transfer")]
		public var huMt:Array = [];

		/**
		 *  @private
		 */
		public static const HUA_ZHU_MT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.hua_zhu_mt", "huaZhuMt", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_money_transfer; });

		[ArrayElementType("protocol.gameserver.st_money_transfer")]
		public var huaZhuMt:Array = [];

		/**
		 *  @private
		 */
		public static const DA_JIAO_MT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.da_jiao_mt", "daJiaoMt", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_money_transfer; });

		[ArrayElementType("protocol.gameserver.st_money_transfer")]
		public var daJiaoMt:Array = [];

		/**
		 *  @private
		 */
		public static const DA_JIAO_DESC:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.da_jiao_desc", "daJiaoDesc", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_hu_desc; });

		private var da_jiao_desc$field:protocol.gameserver.st_hu_desc;

		public function clearDaJiaoDesc():void {
			da_jiao_desc$field = null;
		}

		public function get hasDaJiaoDesc():Boolean {
			return da_jiao_desc$field != null;
		}

		public function set daJiaoDesc(value:protocol.gameserver.st_hu_desc):void {
			da_jiao_desc$field = value;
		}

		public function get daJiaoDesc():protocol.gameserver.st_hu_desc {
			return da_jiao_desc$field;
		}

		/**
		 *  @private
		 */
		public static const HU_DESC:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.hu_desc", "huDesc", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_hu_desc; });

		[ArrayElementType("protocol.gameserver.st_hu_desc")]
		public var huDesc:Array = [];

		/**
		 *  @private
		 */
		public static const HAND_SEQ:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.hand_seq", "handSeq", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.st_hand_seq; });

		private var hand_seq$field:protocol.gameserver.st_hand_seq;

		public function clearHandSeq():void {
			hand_seq$field = null;
		}

		public function get hasHandSeq():Boolean {
			return hand_seq$field != null;
		}

		public function set handSeq(value:protocol.gameserver.st_hand_seq):void {
			hand_seq$field = value;
		}

		public function get handSeq():protocol.gameserver.st_hand_seq {
			return hand_seq$field;
		}

		/**
		 *  @private
		 */
		public static const HU_SEQ:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("protocol.gameserver.all_seq_info.hu_seq", "huSeq", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var huSeq:Array = [];

		/**
		 *  @private
		 */
		public static const COMPLEX_SEQ:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protocol.gameserver.all_seq_info.complex_seq", "complexSeq", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protocol.gameserver.sccomplex_tile; });

		[ArrayElementType("protocol.gameserver.sccomplex_tile")]
		public var complexSeq:Array = [];

		/**
		 *  @private
		 */
		public static const VIP_CHANGE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protocol.gameserver.all_seq_info.vip_change", "vipChange", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_change$field:int;

		public function clearVipChange():void {
			hasField$0 &= 0xfffffffd;
			vip_change$field = new int();
		}

		public function get hasVipChange():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set vipChange(value:int):void {
			hasField$0 |= 0x2;
			vip_change$field = value;
		}

		public function get vipChange():int {
			return vip_change$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_GOLD:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protocol.gameserver.all_seq_info.total_gold", "totalGold", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_gold$field:Int64;

		public function clearTotalGold():void {
			total_gold$field = null;
		}

		public function get hasTotalGold():Boolean {
			return total_gold$field != null;
		}

		public function set totalGold(value:Int64):void {
			total_gold$field = value;
		}

		public function get totalGold():Int64 {
			return total_gold$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_CHANGE:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protocol.gameserver.all_seq_info.money_change", "moneyChange", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money_change$field:Int64;

		public function clearMoneyChange():void {
			money_change$field = null;
		}

		public function get hasMoneyChange():Boolean {
			return money_change$field != null;
		}

		public function set moneyChange(value:Int64):void {
			money_change$field = value;
		}

		public function get moneyChange():Int64 {
			return money_change$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSeatIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seat_index$field);
			}
			for (var wanGangMt$index:uint = 0; wanGangMt$index < this.wanGangMt.length; ++wanGangMt$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.wanGangMt[wanGangMt$index]);
			}
			for (var zhiGangMt$index:uint = 0; zhiGangMt$index < this.zhiGangMt.length; ++zhiGangMt$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.zhiGangMt[zhiGangMt$index]);
			}
			for (var anGangMt$index:uint = 0; anGangMt$index < this.anGangMt.length; ++anGangMt$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.anGangMt[anGangMt$index]);
			}
			for (var huMt$index:uint = 0; huMt$index < this.huMt.length; ++huMt$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.huMt[huMt$index]);
			}
			for (var huaZhuMt$index:uint = 0; huaZhuMt$index < this.huaZhuMt.length; ++huaZhuMt$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.huaZhuMt[huaZhuMt$index]);
			}
			for (var daJiaoMt$index:uint = 0; daJiaoMt$index < this.daJiaoMt.length; ++daJiaoMt$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.daJiaoMt[daJiaoMt$index]);
			}
			if (hasDaJiaoDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, da_jiao_desc$field);
			}
			for (var huDesc$index:uint = 0; huDesc$index < this.huDesc.length; ++huDesc$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.huDesc[huDesc$index]);
			}
			if (hasHandSeq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, hand_seq$field);
			}
			for (var huSeq$index:uint = 0; huSeq$index < this.huSeq.length; ++huSeq$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.huSeq[huSeq$index]);
			}
			for (var complexSeq$index:uint = 0; complexSeq$index < this.complexSeq.length; ++complexSeq$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.complexSeq[complexSeq$index]);
			}
			if (hasVipChange) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vip_change$field);
			}
			if (hasTotalGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, total_gold$field);
			}
			if (hasMoneyChange) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, money_change$field);
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
			var da_jiao_desc$count:uint = 0;
			var hand_seq$count:uint = 0;
			var vip_change$count:uint = 0;
			var total_gold$count:uint = 0;
			var money_change$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: all_seq_info.seatIndex cannot be set twice.');
					}
					++seat_index$count;
					this.seatIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					this.wanGangMt.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_money_transfer()));
					break;
				case 3:
					this.zhiGangMt.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_money_transfer()));
					break;
				case 4:
					this.anGangMt.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_money_transfer()));
					break;
				case 5:
					this.huMt.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_money_transfer()));
					break;
				case 6:
					this.huaZhuMt.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_money_transfer()));
					break;
				case 7:
					this.daJiaoMt.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_money_transfer()));
					break;
				case 8:
					if (da_jiao_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: all_seq_info.daJiaoDesc cannot be set twice.');
					}
					++da_jiao_desc$count;
					this.daJiaoDesc = new protocol.gameserver.st_hu_desc();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.daJiaoDesc);
					break;
				case 9:
					this.huDesc.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.st_hu_desc()));
					break;
				case 10:
					if (hand_seq$count != 0) {
						throw new flash.errors.IOError('Bad data format: all_seq_info.handSeq cannot be set twice.');
					}
					++hand_seq$count;
					this.handSeq = new protocol.gameserver.st_hand_seq();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.handSeq);
					break;
				case 11:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.huSeq);
						break;
					}
					this.huSeq.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 12:
					this.complexSeq.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protocol.gameserver.sccomplex_tile()));
					break;
				case 13:
					if (vip_change$count != 0) {
						throw new flash.errors.IOError('Bad data format: all_seq_info.vipChange cannot be set twice.');
					}
					++vip_change$count;
					this.vipChange = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 14:
					if (total_gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: all_seq_info.totalGold cannot be set twice.');
					}
					++total_gold$count;
					this.totalGold = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 15:
					if (money_change$count != 0) {
						throw new flash.errors.IOError('Bad data format: all_seq_info.moneyChange cannot be set twice.');
					}
					++money_change$count;
					this.moneyChange = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
