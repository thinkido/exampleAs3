package game.control
	{
	import protocol.sc_enter_hall;
	import protocol.t_friend_data;
	
	public class UserDataManager {
	
		private static var _instance:UserDataManager;
	
		private var _name:String = "Jordan";
	
		private var _gold:Number = 0;
	
		private var _exp:Number = 0;
	
		private var _level:int = 0;
	
		private var _sex:int = 0;
	
		private var _vip:int = 0;
	
		private var _first:Boolean = false;
	
		private var _portrait:int = 0;
	
		private var _score:int = 0;
	
		private var _idtype:String = "tv";
	
		// private int _taskAwardNum;
		// private int _achieveAwardNum;
	
		public function UserDataManager():void
		{
	
		}
	
		public static function getInstance():UserDataManager
		{
			if (null == _instance) {
				_instance = new UserDataManager();
			}
			return _instance;
		}
	
		public function initData(msg:sc_enter_hall):void 
		{
			_name = msg.getName();
			// if(_name)
	
			_gold = msg.getGold();
			_exp = msg.getExp();
			_level = msg.getLevel();
			_sex = msg.getSex();
			_vip = msg.getVip();
			_first = msg.getFirst_buy_gold();
			_portrait = msg.getPortrait();
			_score = msg.getCollect_score();
			// _taskAwardNum = msg.getQuest_can_fetch();
			// _achieveAwardNum = msg.getAch_can_fetch();
		}
	
		public function updateByFriendProfile(friend:t_friend_data):void
		{
			_name = friend.getName();
			_gold = friend.getGold();
			_exp = friend.getExp();
			_level = friend.getLevel();
			_sex = friend.getSex();
			_vip = friend.getVip();
			_portrait = friend.getPortrait();
	
			// TODO: no score
			// _score = friend.getScore();
		}
	
		public function getName():String
		{
			return _name;
		}
	
		public function getGold():Number {
			return _gold;
		}
	
		public function setGold(value:Number):void {
			_gold = value;
		}
	
		public function changeGold( value:Number):Number {
			_gold += value;
			return _gold;
		}
	
		public function getExp():Number {
			return _exp;
		}
	
		public function changeExp( value:Number):Number {
			_exp += value;
			return _exp;
		}
	
		public function getLevel():int {
			return _level;
		}
	
		public function changeExp_1( value:int):int {
			_level += value;
			return _level;
		}
	
		public function getSex():int {
			return _sex;
		}
	
		public function setSex(value:int):void {
			_sex = value;
		}
	
		public function getVip():int {
			return _vip;
		}
	
		public function changeVip( value:int):int {
			_vip += value;
			return _vip;
		}
	
		public function getScore():int {
			return _score;
		}
	
		public function changeScore(value:int):int {
			_score += value;
			return _score;
		}
	
		public function getFirst():Boolean {
			return _first;
		}
	
		public function changeFirst():Boolean {
			return _first = !_first;
		}
	
		public function getIdType():String {
			return _idtype;
		}
	
		public function getPortrait():int {
			return _portrait;
		}
	
		public function setPortrait( portrait:int):void {
			_portrait = portrait;
		}
	}
}
