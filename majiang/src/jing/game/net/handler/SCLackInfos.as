package jing.game.net.handler
{
import game.view.scene.gamescene.GameScene;

import jing.game.view.Player;

import protocol.gameserver.sc_lack_infos;
import protocol.gameserver.st_lack_info;


public class SCLackInfos
{

	public function SCLackInfos(pb:sc_lack_infos)
	{
		for(var index:int= 0; index < pb.infos.length; ++index)
		{
			var info:st_lack_info= pb.infos[index] as st_lack_info;
			var player:Player= GameScene.cur.getPlayerBySeat(info.seatIndex);			
			player.setLack(info.lack);			
		}
	}

}
}