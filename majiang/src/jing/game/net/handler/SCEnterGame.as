package jing.game.net.handler
{
	import game.view.scene.gamescene.GameScene;
	
	import jing.game.net.GameRequest;
	import jing.game.view.Player;
	
	import protocol.gameserver.sc_enter_game;
	import protocol.gameserver.scenter_seat_info;
	import protocol.gameserver.stplayer_info;
	
	public class SCEnterGame
	{
	
		public function SCEnterGame(pb:sc_enter_game)
		{
			GameScene.cur.pDown.setSeat(pb.seatIndex);
	
			for(var i:int = 0; i < pb.seatInfoes.length; i++)
			{
				var seat_info:scenter_seat_info= pb.seatInfoes[i] as scenter_seat_info;
				var player_info:stplayer_info= seat_info.playerInfo;
	
				var player:Player= GameScene.cur.getPlayerBySeat(seat_info.seatIndex);
				player.updateInfo(seat_info.seatIndex, player_info.name, player_info.gold.toNumber(), player_info.portrait, player_info.sex);
	
				GameScene.cur.info.setName(player.dir(), player.name );
				GameScene.cur.info.setReady(player.dir(), player.isReady());
			}
	
			GameScene.cur.model.updateRoomInfo(pb.roomid, pb.roomBase, pb.roomLevel);
	
			GameScene.cur.info.setRoomBase(GameScene.cur.model.roomBase());
			GameScene.cur.info.setRemainTiles(0);
	
			GameRequest.ins().readyGame();
		}
	}
}