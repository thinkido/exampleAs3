package game.model.vo
{
	import protos.hallserver.sc_enter_hall;
	import protos.hallserver.t_friend_data;
	
	public class UserDataVO
	{
	
		public var name:String = "Jordan";
	
		public var gold:Number = 0;
	
		public var exp:Number = 0;
	
		public var level:int = 0;
	
		public var sex:int = 0;
	
		public var portrait:int = 0;
	
		public var score:int = 0;
	
		public var winNum:int;
	
		public var loseNum:int;
	
		public var pingNum:int;
	
		public function UserDataVO(msg:sc_enter_hall):void
		{
			name = msg.name;
			gold = msg.gold;
			exp = msg.exp;
			level = msg.level;
			sex = msg.sex;
			portrait = msg.portrait;
			score = msg.collectScore;
		}
	
		public function update(friend:t_friend_data):void
		{
			name = friend.name;
			gold = friend.gold;
			exp = friend.exp;
			level = friend.level;
			sex = friend.sex;
			portrait = friend.portrait;
			winNum = friend.winCount;
			loseNum = friend.loseCount;
			pingNum = friend.pingCount;
		}
		
		public function getTotalNum():int
		{
			return winNum + loseNum + pingNum;
		}
	
		public function getWinRate():String
		{
			var totalNum:int = getTotalNum();
			if(totalNum > 0)
			{
				var bl:Number = winNum / ((totalNum == 0 ? 1 : totalNum));
				return ((int)(Math.floor(bl * 10000))) / 100 + "%";
			}
			else
				return "0%";
		}
	}
}