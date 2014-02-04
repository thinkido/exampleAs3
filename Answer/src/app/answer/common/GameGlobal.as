package game.common
{
	import game.utils.bind.Data;

	public class GameGlobal extends Data
	{
		public function GameGlobal()
		{
		}
		
		private static var instance:GameGlobal;
		
		public static function getInstance():GameGlobal
		{
			if (!instance)
				instance = new GameGlobal();
			return instance;
		}
		/**上次攻击时间*/
		public var lastAttackTime:int = 0;
		
	}
}