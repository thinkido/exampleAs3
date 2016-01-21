package jing.game.net.handler
{
import game.view.scene.gamescene.GameScene;
import protocol.sc_ready_game_notify;

public class SCReadyGameNotify
{

	public function SCReadyGameNotify(pb:sc_ready_game_notify)
	{
		var dir:String= GameScene.cur.getDirBySeat(pb.getSeat_index());
		GameScene.cur.info.setReady(dir, true);
		GameScene.cur.info.setHu(dir, false);
	}

}
}