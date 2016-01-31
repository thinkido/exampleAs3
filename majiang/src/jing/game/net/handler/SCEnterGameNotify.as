package jing.game.net.handler
{
import game.view.scene.gamescene.GameScene;

import jing.game.view.Player;

import protocol.gameserver.sc_enter_game_notify;
import protocol.gameserver.scenter_seat_info;
import protocol.gameserver.stplayer_info;


public class SCEnterGameNotify
{

	public function SCEnterGameNotify(pb:sc_enter_game_notify)
	{
		var seat_info:scenter_seat_info= pb.seatInfo;
		var player_info:stplayer_info= seat_info.playerInfo;

		
		var player:Player= GameScene.cur.getPlayerBySeat(seat_info.seatIndex);
		player.updateInfo(seat_info.seatIndex, player_info.name, player_info.gold.toNumber(), player_info.portrait, player_info.sex);

		
		GameScene.cur.info.setName(player.dir(), player.name());
		GameScene.cur.info.setReady(player.dir(), false);
		
	}

}
}