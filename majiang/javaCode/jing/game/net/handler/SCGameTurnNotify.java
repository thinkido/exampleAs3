
package jing.game.net.handler;

import game.view.scene.gamescene.GameScene;
import jing.consts.EffectType;
import jing.consts.GameDir;
import jing.game.view.Player;
import jing.pai.utils.CardUtil;
import protocol.sc_game_turn_notify;

public class SCGameTurnNotify
{

	public SCGameTurnNotify(sc_game_turn_notify pb)
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

		// ��ʾ������
		GameScene.cur.info.setTurnDir(player.dir());

		// ˢ�µ���ʱ
		GameScene.cur.info.setCountdown(pb.getTimeout());
	}

}
