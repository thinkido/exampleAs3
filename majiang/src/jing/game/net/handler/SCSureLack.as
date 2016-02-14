package jing.game.net.handler
{
	import jing.game.net.GameRequest;
	
	import protocol.gameserver.sc_sure_lack;
	
	public class SCSureLack
	{
	
		public function SCSureLack(pb:sc_sure_lack)
		{
			GameRequest.ins().sureLack(1);
		}
	
	}
}