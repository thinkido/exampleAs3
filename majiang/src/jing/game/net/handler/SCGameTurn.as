package jing.game.net.handler
{
import game.view.scene.gamescene.GameScene;
import game.view.scene.gamescene.windows.PlayerActionWindow;
import jing.consts.CardPlace;
import jing.consts.EffectType;
import jing.consts.GameDir;
import jing.game.view.Player;
import jing.pai.utils.CardUtil;
import protocol.sc_game_turn;

public class SCGameTurn
{

	public function SCGameTurn(pb:sc_game_turn)
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
					GameScene.cur.info.addHua(GameDir.DOWN, card);
					GameScene.cur.info.showEffect(GameDir.DOWN, EffectType.BU_HUA);
				}
				else
				{
					player.setNewInHand(card);
				}
			}
		}

		player.updateChuTip();
		player.setInTurn(true);

		// 显示操作面板
		PlayerActionWindow.show(pb.getShow_actions());

		if(pb.getMo())
		{
			// 设置选中的牌
			player.setSelectCard(player.cardCount(CardPlace.IN_HAND));
		}
		else
		{
			player.setSelectCard(player.cardCount(CardPlace.IN_HAND) - 1);
		}

		// 显示操作者
		GameScene.cur.info.setTurnDir(GameDir.DOWN);

		// 刷新倒计时
		GameScene.cur.info.setCountdown(pb.getTimeout());
	}

}
}