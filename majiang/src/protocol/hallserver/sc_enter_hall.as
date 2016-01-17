package protos.hallserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.hallserver.place_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_enter_hall extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PLACE_INFOS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("protos.hallserver.sc_enter_hall.place_infos", "placeInfos", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.hallserver.place_info; });

		[ArrayElementType("protos.hallserver.place_info")]
		public var placeInfos:Array = [];

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.hallserver.sc_enter_hall.name", "name", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const GOLD:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protos.hallserver.sc_enter_hall.gold", "gold", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gold$field:Int64;

		public function clearGold():void {
			gold$field = null;
		}

		public function get hasGold():Boolean {
			return gold$field != null;
		}

		public function set gold(value:Int64):void {
			gold$field = value;
		}

		public function get gold():Int64 {
			return gold$field;
		}

		/**
		 *  @private
		 */
		public static const EXP:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("protos.hallserver.sc_enter_hall.exp", "exp", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp$field:Int64;

		public function clearExp():void {
			exp$field = null;
		}

		public function get hasExp():Boolean {
			return exp$field != null;
		}

		public function set exp(value:Int64):void {
			exp$field = value;
		}

		public function get exp():Int64 {
			return exp$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_enter_hall.level", "level", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const SEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_enter_hall.sex", "sex", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sex$field:int;

		public function clearSex():void {
			hasField$0 &= 0xfffffffd;
			sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x2;
			sex$field = value;
		}

		public function get sex():int {
			return sex$field;
		}

		/**
		 *  @private
		 */
		public static const VIP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_enter_hall.vip", "vip", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip$field:int;

		public function clearVip():void {
			hasField$0 &= 0xfffffffb;
			vip$field = new int();
		}

		public function get hasVip():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set vip(value:int):void {
			hasField$0 |= 0x4;
			vip$field = value;
		}

		public function get vip():int {
			return vip$field;
		}

		/**
		 *  @private
		 */
		public static const QUEST_CAN_FETCH:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_enter_hall.quest_can_fetch", "questCanFetch", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var quest_can_fetch$field:int;

		public function clearQuestCanFetch():void {
			hasField$0 &= 0xfffffff7;
			quest_can_fetch$field = new int();
		}

		public function get hasQuestCanFetch():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set questCanFetch(value:int):void {
			hasField$0 |= 0x8;
			quest_can_fetch$field = value;
		}

		public function get questCanFetch():int {
			return quest_can_fetch$field;
		}

		/**
		 *  @private
		 */
		public static const ACH_CAN_FETCH:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_enter_hall.ach_can_fetch", "achCanFetch", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ach_can_fetch$field:int;

		public function clearAchCanFetch():void {
			hasField$0 &= 0xffffffef;
			ach_can_fetch$field = new int();
		}

		public function get hasAchCanFetch():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set achCanFetch(value:int):void {
			hasField$0 |= 0x10;
			ach_can_fetch$field = value;
		}

		public function get achCanFetch():int {
			return ach_can_fetch$field;
		}

		/**
		 *  @private
		 */
		public static const FIRST_BUY_GOLD:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("protos.hallserver.sc_enter_hall.first_buy_gold", "firstBuyGold", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var first_buy_gold$field:Boolean;

		public function clearFirstBuyGold():void {
			hasField$0 &= 0xffffffdf;
			first_buy_gold$field = new Boolean();
		}

		public function get hasFirstBuyGold():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set firstBuyGold(value:Boolean):void {
			hasField$0 |= 0x20;
			first_buy_gold$field = value;
		}

		public function get firstBuyGold():Boolean {
			return first_buy_gold$field;
		}

		/**
		 *  @private
		 */
		public static const PORTRAIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_enter_hall.portrait", "portrait", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var portrait$field:int;

		public function clearPortrait():void {
			hasField$0 &= 0xffffffbf;
			portrait$field = new int();
		}

		public function get hasPortrait():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set portrait(value:int):void {
			hasField$0 |= 0x40;
			portrait$field = value;
		}

		public function get portrait():int {
			return portrait$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECT_SCORE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("protos.hallserver.sc_enter_hall.collect_score", "collectScore", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collect_score$field:int;

		public function clearCollectScore():void {
			hasField$0 &= 0xffffff7f;
			collect_score$field = new int();
		}

		public function get hasCollectScore():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set collectScore(value:int):void {
			hasField$0 |= 0x80;
			collect_score$field = value;
		}

		public function get collectScore():int {
			return collect_score$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var placeInfos$index:uint = 0; placeInfos$index < this.placeInfos.length; ++placeInfos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.placeInfos[placeInfos$index]);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, gold$field);
			}
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, exp$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, sex$field);
			}
			if (hasVip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vip$field);
			}
			if (hasQuestCanFetch) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, quest_can_fetch$field);
			}
			if (hasAchCanFetch) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, ach_can_fetch$field);
			}
			if (hasFirstBuyGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, first_buy_gold$field);
			}
			if (hasPortrait) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, portrait$field);
			}
			if (hasCollectScore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, collect_score$field);
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
			var gold$count:uint = 0;
			var exp$count:uint = 0;
			var level$count:uint = 0;
			var sex$count:uint = 0;
			var vip$count:uint = 0;
			var quest_can_fetch$count:uint = 0;
			var ach_can_fetch$count:uint = 0;
			var first_buy_gold$count:uint = 0;
			var portrait$count:uint = 0;
			var collect_score$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.placeInfos.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new protos.hallserver.place_info()));
					break;
				case 3:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.gold cannot be set twice.');
					}
					++gold$count;
					this.gold = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 6:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (vip$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.vip cannot be set twice.');
					}
					++vip$count;
					this.vip = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (quest_can_fetch$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.questCanFetch cannot be set twice.');
					}
					++quest_can_fetch$count;
					this.questCanFetch = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (ach_can_fetch$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.achCanFetch cannot be set twice.');
					}
					++ach_can_fetch$count;
					this.achCanFetch = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (first_buy_gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.firstBuyGold cannot be set twice.');
					}
					++first_buy_gold$count;
					this.firstBuyGold = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 12:
					if (portrait$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.portrait cannot be set twice.');
					}
					++portrait$count;
					this.portrait = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 13:
					if (collect_score$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_hall.collectScore cannot be set twice.');
					}
					++collect_score$count;
					this.collectScore = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
