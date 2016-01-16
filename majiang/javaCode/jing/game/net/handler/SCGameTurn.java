
package jing.game.net.handler;

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

	public SCGameTurn(sc_game_turn pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getSeat_index());
		if(pb.getMo())
		{
			for(int i = 0; i < pb.getMo_tiles().size(); i++)
			{
				int card = ((Integer)pb.getMo_tiles().elementAt(i)).intValue();
				if(CardUtil.isHua(card))
				{
					// ��Ӧ�������ƵĴ���
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

		// ��ʾ�������
		PlayerActionWindow.show(pb.getShow_actions());

		if(pb.getMo())
		{
			// ����ѡ�е���
			player.setSelectCard(player.cardCount(CardPlace.IN_HAND));
		}
		else
		{
			player.setSelectCard(player.cardCount(CardPlace.IN_HAND) - 1);
		}

		// ��ʾ������
		GameScene.cur.info.setTurnDir(GameDir.DOWN);

		// ˢ�µ���ʱ
		GameScene.cur.info.setCountdown(pb.getTimeout());
	}

}
