
package jing.game.net.handler;

import java.util.Enumeration;

import jing.game.net.GameRequest;
import jing.game.view.Player;
import game.view.scene.gamescene.GameScene;
import protocol.sc_enter_game;
import protocol.scenter_seat_info;
import protocol.stplayer_info;

public class SCEnterGame
{

	public SCEnterGame(sc_enter_game pb)
	{
		GameScene.cur.pDown.setSeat(pb.getSeat_index());

		for(Enumeration enumInfo = pb.getSeat_infoes().elements(); enumInfo.hasMoreElements();)
		{
			scenter_seat_info seat_info = (scenter_seat_info)enumInfo.nextElement();
			stplayer_info player_info = seat_info.getPlayer_info();

			Player player = GameScene.cur.getPlayerBySeat(seat_info.getSeat_index());
			player.updateInfo(seat_info.getSeat_index(), player_info.getName(), player_info.getGold(), player_info.getPortrait(), player_info.getSex());

			GameScene.cur.info.setName(player.dir(), player.name());
			GameScene.cur.info.setReady(player.dir(), player.isReady());
		}

		GameScene.cur.model.updateRoomInfo(pb.getRoomid(), pb.getRoom_base(), pb.getRoom_level());

		GameScene.cur.info.setRoomBase(GameScene.cur.model.roomBase());
		GameScene.cur.info.setRemainTiles(0);

		GameRequest.ins().readyGame();
	}
}
