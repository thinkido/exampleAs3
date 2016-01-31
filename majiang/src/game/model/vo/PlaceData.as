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
		public var id:String;
		public var name:String;
		public var baseZhu:int;
		public var playerNum:int;
		public var reqPlayerGold:int;
		public var canEnter:Boolean;
		public var chuTileTime:int;
		
		
		public function PlaceData(info:place_info = null ):void {
			if( info != null ){
				this.init(info);
			}
		}
		
		public function init(info:place_info):void {
			this.id = info.id ;
			this.name = info.name;
			this.baseZhu = info.baseZhu;
			this.playerNum = info.playerNum;
			this.reqPlayerGold = info.reqPlayerGold ;
			this.canEnter = info.canEnter ;
			this.chuTileTime = info.chuTileTime ;
		}
		
	}
}
