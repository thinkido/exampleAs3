package protos.gameserver {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import protos.gameserver.scenter_seat_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class sc_enter_game_notify extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT_INFO:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("protos.gameserver.sc_enter_game_notify.seat_info", "seatInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return protos.gameserver.scenter_seat_info; });

		private var seat_info$field:protos.gameserver.scenter_seat_info;

		public function clearSeatInfo():void {
			seat_info$field = null;
		}

		public function get hasSeatInfo():Boolean {
			return seat_info$field != null;
		}

		public function set seatInfo(value:protos.gameserver.scenter_seat_info):void {
			seat_info$field = value;
		}

		public function get seatInfo():protos.gameserver.scenter_seat_info {
			return seat_info$field;
		}

		/**
		 *  @private
		 */
		public static const REV_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("protos.gameserver.sc_enter_game_notify.rev_name", "revName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var rev_name$field:String;

		public function clearRevName():void {
			rev_name$field = null;
		}

		public function get hasRevName():Boolean {
			return rev_name$field != null;
		}

		public function set revName(value:String):void {
			rev_name$field = value;
		}

		public function get revName():String {
			return rev_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSeatInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, seat_info$field);
			}
			if (hasRevName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, rev_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var seat_info$count:uint = 0;
			var rev_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (seat_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_game_notify.seatInfo cannot be set twice.');
					}
					++seat_info$count;
					this.seatInfo = new protos.gameserver.scenter_seat_info();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.seatInfo);
					break;
				case 3:
					if (rev_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: sc_enter_game_notify.revName cannot be set twice.');
					}
					++rev_name$count;
					this.revName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
