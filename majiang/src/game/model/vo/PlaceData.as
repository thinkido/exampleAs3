package game.model.vo
{
	import protos.hallserver.place_info;
	
	
	public class PlaceData {
		/**
		 * // 场次信息
		message place_info {
			optional string id 					= 1;
			optional string name				= 2; 
			optional int32 base_zhu				= 3;
			
			optional int32 player_num			= 6;
			optional int32 req_player_gold		= 8;
		
			optional bool can_enter			= 9;
		
			optional int32 chu_tile_time		= 10;
		}
		 */
		// 这么操蛋的一段代码 为什么不用工具呢..?
		// 因为 早晨来了脑子还有点儿乱...
		private var _id:String;
		private var _name:String;
		private var _baseZhu:int;
		private var _playerNum:int;
		private var _reqPlayerGold:int;
		private var _canEnter:Boolean;
		private var _chuTileTime:int;
		
		public function PlaceData() {
			
		}
		
		public function PlaceData_2(info:place_info):void {
			this.init(info);
		}
		
		public function init(info:place_info) {
			this.id_2(info.getId());
			this.name_2(info.getName());
			this.baseZhu_2(info.getBase_zhu());
			this.playerNum_2(info.getPlayer_num());
			this.reqPlayerGold_2(info.getReq_player_gold());
			this.canEnter_2(info.getCan_enter());
			this.chuTileTime_2(info.getChu_tile_time());
		}
		
		public function id():String {
			return _id;
		}
		
		public function id_2(v:String):String {
			return _id = v;
		}
		
		public function name():String {
			return _name;
		}
		
		public function name_2( v:String):String {
			return _name = v;
		}
		
		public function baseZhu():int {
			return _baseZhu;
		}
		
		public function baseZhu_2(v:int):int {
			return _baseZhu = v;
		}
		
		public function playerNum():int {
			return _playerNum;
		}
		
		public function playerNum_2(v:int):int {
			return _playerNum = v;
		}
		
		public function reqPlayerGold():int {
			return _reqPlayerGold;
		}
		
		public function reqPlayerGold_2(v:int):int {
			return _reqPlayerGold = v;
		}
		
		public function canEnter():Boolean {
			return _canEnter;
		}
		
		public function canEnter_2(v:Boolean):Boolean {
			return _canEnter = v;
		}
		
		public function chuTileTime():int {
			return _chuTileTime;
		}
		
		public function chuTileTime_2(v:int):int {
			return _chuTileTime = v;
		}
	}
}
