package jing.game.net.handler
{
import game.view.scene.gamescene.GameScene;
import jing.consts.EffectType;
import jing.consts.GameDir;
import jing.game.view.Player;
import jing.pai.utils.CardUtil;
import protocol.sc_game_turn_notify;

public class SCGameTurnNotify
{

	public function SCGameTurnNotify(pb:sc_game_turn_notify)
	{
		var player:Player= GameScene.cur.getPlayerBySeat(pb.getSeat_index());

		if(pb.getMo())
		{
			for(var i:int= 0; i < pb.getMo_tiles().size(); i++)
			{
				var card:int= (Integer(pb.getMo_tiles().elementAt(i))).intValue();
				if(CardUtil.isHua(card))
				{
					// 对应摸到花牌的处理
					GameScene.cur.info.addHua(player.dir(), card);
					GameScene.cur.info.showEffect(player.dir(), EffectType.BU_HUA);
				}
				else
				{
					player.setNewInHand(card);
				}
			}
		}

		GameScene.cur.pDown.setInTurn(false);
		
		// GameScene.cur.pDown.setSelectCard(-1);

		// 显示操作者
		GameScene.cur.info.setTurnDir(player.dir());

		// 刷新倒计时
		GameScene.cur.info.setCountdown(pb.getTimeout());
	}

}
}