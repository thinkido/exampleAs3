
package jing.game.net.handler;

import game.view.scene.gamescene.GameScene;

import java.util.Vector;

import jing.GDC;
import protocol.hand_seq_info;
import protocol.sc_start_game;

public class SCStartGame
{

	public SCStartGame(sc_start_game pb)
	{
		GDC.trace(pb.toString());

		GameScene gs = GameScene.cur;

		gs.reset();

		gs.pDown.setSeat(pb.getYou_seq_info().getSeat_index());

		Vector vecWan = pb.getYou_seq_info().getHand_seq().getWan();
		Vector vecTong = pb.getYou_seq_info().getHand_seq().getTong();
		Vector vecTiao = pb.getYou_seq_info().getHand_seq().getTiao();
		Vector vecLack = pb.getYou_seq_info().getHand_seq().getLack();
		Vector vecZi = pb.getYou_seq_info().getHand_seq().getZi();
		Vector vecHua = pb.getYou_seq_info().getHand_seq().getHua();

		int[] inHandCards = new int[vecWan.size() + vecTong.size() + vecTiao.size() + vecLack.size() + vecZi.size()];
		int cardIndex = 0;
		for(int index = 0; index < vecWan.size(); ++index)
		{
			int card_value = ((Integer)vecWan.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}
		for(int index = 0; index < vecTong.size(); ++index)
		{
			int card_value = ((Integer)vecTong.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}
		for(int index = 0; index < vecTiao.size(); ++index)
		{
			int card_value = ((Integer)vecTiao.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}
		for(int index = 0; index < vecLack.size(); ++index)
		{
			int card_value = ((Integer)vecLack.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}
		for(int index = 0; index < vecZi.size(); ++index)
		{
			int card_value = ((Integer)vecZi.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}

		for(int index = 0; index < vecHua.size(); ++index)
		{
			gs.info.addHua(gs.pDown.dir(), ((Integer)vecHua.elementAt(index)).intValue());
		}

		gs.pDown.setInHand(inHandCards);

		gs.info.setRemainTiles(pb.getTiles_remain());

		for(int i = 0; i < pb.getOther_infoes().size(); i++)
		{
			hand_seq_info hsi = (hand_seq_info)pb.getOther_infoes().elementAt(i);
			if(gs.pDown.seat() == hsi.getSeat_index())
			{
				continue;
			}

			if(hsi.getHand_seq().getHua().size() > 0)
			{
				String dir = gs.getDirBySeat(hsi.getSeat_index());
				for(int j = 0; j < hsi.getHand_seq().getHua().size(); j++)
				{
					int card = ((Integer)hsi.getHand_seq().getHua().elementAt(j)).intValue();
					gs.info.addHua(dir, card);
				}
			}
		}

		int[] otherCards = new int[13];
		gs.pLeft.setInHand(otherCards);
		gs.pRight.setInHand(otherCards);
		gs.pUp.setInHand(otherCards);
	}

}
