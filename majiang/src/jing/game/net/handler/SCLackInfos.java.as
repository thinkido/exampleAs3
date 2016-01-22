package jing.game.net.handler
{
import jing.game.view.Player;
import game.view.scene.gamescene.GameScene;
import protocol.sc_lack_infos;
import protocol.st_lack_info;


public class SCLackInfos
{

	public function SCLackInfos(pb:sc_lack_infos)
	{
		for(var index:int= 0; index < pb.getInfos().size(); ++index)
		{
			var info:st_lack_info= st_lack_info(pb.getInfos().elementAt(index));
			var player:Player= GameScene.cur.getPlayerBySeat(info.getSeat_index());			
			player.setLack(info.getLack());			
		}
	}

}
}