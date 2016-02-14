package jing.game.net.handler
{
	import game.model.Global;
	
	import protocol.gameserver.sc_gold_reset;
	
	public class SCGoldReset
	{
	
		public function SCGoldReset(pb:sc_gold_reset)
		{
			Global.userDataVO.gold = pb.total;
		}
	
	}
}