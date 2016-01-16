
package jing.game.net.handler;

import java.util.Enumeration;
import java.util.Vector;

import jing.game.view.Player;
import jing.game.vo.CombinVO;
import game.view.scene.gamescene.GameScene;
import protocol.sc_continue_game;
import protocol.sccomplex_tile;
import protocol.sccontinue_seat_info;
import protocol.stplayer_info;

/**
 * ¼ÌÐøÓÎÏ·
 * 
 * @author Jing
 */
public class SCContinueGame
{

	public SCContinueGame(sc_continue_game pb)
	{
		GameScene gs = GameScene.cur;

		GameScene.cur.pDown.setSeat(pb.getSeat_index());

		for(Enumeration en = pb.getSeat_infoes().elements(); en.hasMoreElements();)
		{
			sccontinue_seat_info info = (sccontinue_seat_info)en.nextElement();
			Player player = gs.getPlayerBySeat(info.getSeat_index());

			stplayer_info seat_info = (stplayer_info)info.getPlayer_info();
			player.updateInfo(info.getSeat_index(), seat_info.getName(), seat_info.getGold(), seat_info.getPortrait(), seat_info.getSex());
			player.setLack(info.getLack());

			if(info.getIs_hu())
			{
				gs.info.setHu(player.dir(), true);
			}
			int[] inHandCards = null;
			if(info.getSeat_index() == gs.pDown.seat())
			{
				Vector vecWan = info.getHand_seq().getWan();
				Vector vecTong = info.getHand_seq().getTong();
				Vector vecTiao = info.getHand_seq().getTiao();
				Vector vecLack = info.getHand_seq().getLack();
				Vector vecZi = info.getHand_seq().getZi();

				inHandCards = new int[vecWan.size() + vecTong.size() + vecTiao.size() + vecLack.size() + vecZi.size()];
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
			}
			else
			{
				inHandCards = new int[info.getHand_seq_count()];

				if(info.getMo_count() != 0)
				{
					player.setNewInHand(-1);
				}
			}

			Vector vecHua = info.getHand_seq().getHua();
			for(int index = 0; index < vecHua.size(); ++index)
			{
				gs.info.addHua(player.dir(), ((Integer)vecHua.elementAt(index)).intValue());
			}

			Vector vecComplex = info.getComplex_seq();
			CombinVO[] cbs = new CombinVO[vecComplex.size()];
			for(int index = 0; index < vecComplex.size(); index++)
			{
				sccomplex_tile tile = (sccomplex_tile)vecComplex.elementAt(index);
				cbs[index] = new CombinVO(tile.getType(), tile.getId());
			}

			int[] onTableCards = new int[info.getChued_seq().size()];
			for(int index = 0; index < info.getChued_seq().size(); index++)
			{
				int card = ((Integer)info.getChued_seq().elementAt(index)).intValue();
				onTableCards[index] = card;
			}

			player.setInHand(inHandCards);
			player.setInHandTable(cbs);
			player.setOnTable(onTableCards);

			player.needRefresh();

			GameScene.cur.info.setName(player.dir(), player.name());
		}

		GameScene.cur.model.updateRoomInfo(pb.getRoomid(), pb.getRoom_base(), pb.getRoom_level());
		GameScene.cur.info.setRoomBase(GameScene.cur.model.roomBase());
		GameScene.cur.info.setRemainTiles(pb.getTiles_remain());
	}
}
