package jing.game.net.handler;

import jing.game.view.Player;
import game.view.scene.gamescene.GameScene;
import protocol.sc_lack_infos;
import protocol.st_lack_info;


public class SCLackInfos
{

	public SCLackInfos(sc_lack_infos pb)
	{
		for(int index = 0; index < pb.getInfos().size(); ++index)
		{
			st_lack_info info = (st_lack_info)pb.getInfos().elementAt(index);
			Player player = GameScene.cur.getPlayerBySeat(info.getSeat_index());			
			player.setLack(info.getLack());			
		}
	}

}
