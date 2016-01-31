package jing.game.net.handler
{
	import game.view.scene.gamescene.GameScene;
	
	import jing.game.view.Player;
	
	import protocol.gameserver.sc_leave_game_notify;
	
	public class SCLeaveGameNotify
	{
	
		public function SCLeaveGameNotify(pb:sc_leave_game_notify)
		{
			var player:Player= GameScene.cur.getPlayerBySeat(pb.seatIndex);
			GameScene.cur.info.setHu(player.dir(), false);
			GameScene.cur.info.setReady(player.dir(), false);
			GameScene.cur.info.setName(player.dir(), "µȴý¼ÓÈë");
		}
	
	}
}