package jing.game.net.handler;

import jing.game.view.Player;
import game.view.scene.gamescene.GameScene;
import protocol.sc_enter_game_notify;
import protocol.scenter_seat_info;
import protocol.stplayer_info;


public class SCEnterGameNotify
{

	public SCEnterGameNotify(sc_enter_game_notify pb)
	{
		scenter_seat_info seat_info = pb.getSeat_info();
		stplayer_info player_info = seat_info.getPlayer_info();

		
		Player player = GameScene.cur.getPlayerBySeat(seat_info.getSeat_index());
		player.updateInfo(seat_info.getSeat_index(), player_info.getName(), player_info.getGold(), player_info.getPortrait(), player_info.getSex());

		
		GameScene.cur.info.setName(player.dir(), player.name());
		GameScene.cur.info.setReady(player.dir(), false);
		
	}

}
