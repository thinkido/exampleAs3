package jing.game.net.handler
{
import game.control.PlaceDataManager;
import game.model.Global;
import game.model.vo.UserDataVO;
import game.view.scene.gamescene.GameScene;

import protocol.hallserver.sc_enter_hall;

public class SCEnterHall
{

	public function SCEnterHall(pb:sc_enter_hall)
	{
		Global.userDataVO = new UserDataVO(pb);
		PlaceDataManager.getInstance().init(pb.placeInfos);
		GameScene.cur.switchToHall();
	}
}
}