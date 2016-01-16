package game.model.vo;

import protocol.place_info;

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
	private String _id;
	private String _name;
	private int _baseZhu;
	private int _playerNum;
	private int _reqPlayerGold;
	private boolean _canEnter;
	private int _chuTileTime;
	
	PlaceData() {
		
	}
	
	public PlaceData(place_info info) {
		this.init(info);
	}
	
	public void init(place_info info) {
		this.id(info.getId());
		this.name(info.getName());
		this.baseZhu(info.getBase_zhu());
		this.playerNum(info.getPlayer_num());
		this.reqPlayerGold(info.getReq_player_gold());
		this.canEnter(info.getCan_enter());
		this.chuTileTime(info.getChu_tile_time());
	}
	
	public String id() {
		return _id;
	}
	
	public String id(String v) {
		return _id = v;
	}
	
	public String name() {
		return _name;
	}
	
	public String name(String v) {
		return _name = v;
	}
	
	public int baseZhu() {
		return _baseZhu;
	}
	
	public int baseZhu(int v) {
		return _baseZhu = v;
	}
	
	public int playerNum() {
		return _playerNum;
	}
	
	public int playerNum(int v) {
		return _playerNum = v;
	}
	
	public int reqPlayerGold() {
		return _reqPlayerGold;
	}
	
	public int reqPlayerGold(int v) {
		return _reqPlayerGold = v;
	}
	
	public boolean canEnter() {
		return _canEnter;
	}
	
	public boolean canEnter(boolean v) {
		return _canEnter = v;
	}
	
	public int chuTileTime() {
		return _chuTileTime;
	}
	
	public int chuTileTime(int v) {
		return _chuTileTime = v;
	}
}
