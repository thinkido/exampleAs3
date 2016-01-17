package game.model.vo
{
	public class GiftVO 
	{
		public var day:int;
	
		public var gold:int;
	
		public var fetched:Boolean;
	
		public function GiftVO( _day:int, _gold:int, _fetched:Boolean) {
			day = _day;
			gold = _gold;
			fetched = _fetched;
		}
	}
}
