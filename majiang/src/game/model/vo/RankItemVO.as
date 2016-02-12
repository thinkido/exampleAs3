package game.model.vo
{
	import protocol.hallserver.t_rank_data;
	
	
	public class RankItemVO
	{
	
		public var rank:int;
	
		public var portrait:int;
	
		public var name:String;
	
		public var value:String;
	
		public function RankItemVO(msg:t_rank_data)
		{
			rank = msg.rank;
			portrait = msg.portrait;
			value = msg.valueInt_1.toString();
			setName(msg.name());
		}
	
		public function RankItemVO_2(_rank:int, _portrait:int, _name:String, _value:String):void
		{
			rank = _rank;
			portrait = _portrait;
			value = _value;
			setName(_name);
		}
	
		private function setName(_name:String):void
		{
			if(_name.length > 8)
				name = _name.substring(_name.length - 8);
			else
				name = _name;
		}
	}
}