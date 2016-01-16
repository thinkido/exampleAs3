
package jing.game.net.handler;

import game.view.scene.gamescene.GameScene;
import game.view.scene.gamescene.windows.PlayerActionWindow;

import java.util.Vector;

import jing.consts.CardPlace;
import jing.consts.EffectType;
import jing.consts.PlayerAction;
import jing.game.view.Mahjong;
import jing.game.view.Player;
import jing.game.vo.CombinVO;
import protocol.sc_game_action;
import protocol.sccomplex_tile;

public class SCGameAction
{

	public SCGameAction(sc_game_action pb)
	{
		// GDC.trace(pb.toString());
		PlayerActionWindow.close();
		GameScene.cur.info.setRemainTiles(pb.getTiles_remain());
		GameScene.cur.pDown.clearJiaoTip();
		GameScene.cur.jiaoTip(null);

		int action = pb.getId();
		if(PlayerAction.LACK == action)
		{
			lack(pb);
		}
		else if(PlayerAction.CHU == action)
		{
			chu(pb);
		}
		else if(PlayerAction.PENG == action)
		{
			peng(pb);
		}
		else if(PlayerAction.MING_GANG == action)
		{
			mingGang(pb);
		}
		else if(PlayerAction.AN_GANG == action)
		{
			anGang(pb);
		}
		else if(PlayerAction.HU == action)
		{
			hu(pb);
		}
		else if(PlayerAction.GUO == action)
		{
			guo(pb);
		}
		else if(PlayerAction.CHI_LEFT == action)
		{
			chiLeft(pb);
		}
		else if(PlayerAction.CHI_MIDDLE == action)
		{
			chiMiddle(pb);
		}
		else if(PlayerAction.CHI_RIGHT == action)
		{
			chiRight(pb);
		}
	}

	private void lack(sc_game_action pb)
	{

	}

	private void chu(sc_game_action pb)
	{
		syncPlayerCards(pb);

		Player player = GameScene.cur.getPlayerBySeat(pb.getAct_seat_index());
		int count = player.cardCount(CardPlace.ON_TABLE);
		Mahjong mj = player.getCard(CardPlace.ON_TABLE, count - 1);
		GameScene.cur.setLastChu(mj);

	}

	private void peng(sc_game_action pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.PENG);
	}

	private void mingGang(sc_game_action pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.GANG);
	}

	private void anGang(sc_game_action pb)
	{
		syncPlayerCards(pb);

		Player player = GameScene.cur.getPlayerBySeat(pb.getAct_seat_index());
		GameScene.cur.info.showEffect(player.dir(), EffectType.GANG);
	}

	private void hu(sc_game_action pb)
	{
		boolean isZimo = pb.getAct_seat_index() == pb.getActed_seat_index() ? true : false;
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		if(false == isZimo)
		{
			player.removeLastOnTable();
		}
		syncPlayerCards(pb);

		GameScene.cur.info.setHu(GameScene.cur.getDirBySeat(pb.getAct_seat_index()), true);

		GameScene.cur.info.showEffect(GameScene.cur.getDirBySeat(pb.getAct_seat_index()), EffectType.HU);
	}

	private void guo(sc_game_action pb)
	{

	}

	private void chiLeft(sc_game_action pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.CHI);
	}

	private void chiMiddle(sc_game_action pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.CHI);
	}

	private void chiRight(sc_game_action pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.CHI);
	}

	private void syncPlayerCards(sc_game_action pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getAct_seat_index());

		Vector vecComplex = pb.getAct_complex_seq();
		CombinVO[] cbs = new CombinVO[vecComplex.size()];
		for(int index = 0; index < vecComplex.size(); ++index)
		{
			sccomplex_tile tile = (sccomplex_tile)vecComplex.elementAt(index);
			cbs[index] = new CombinVO(tile.getType(), tile.getId());
		}

		Vector vecWan = pb.getAct_hand_seq().getWan();
		Vector vecTong = pb.getAct_hand_seq().getTong();
		Vector vecTiao = pb.getAct_hand_seq().getTiao();
		Vector vecLack = pb.getAct_hand_seq().getLack();
		Vector vecZi = pb.getAct_hand_seq().getZi();
		// Vector vecHua = pb.getAct_hand_seq().getHua();

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

		boolean hasMo = (pb.getAct_hand_seq().getMo().size() > 0);
		boolean hasHu = (pb.getAct_hu_seq().size() > 0);

		int newInHand = -1;
		if(hasMo)
		{
			newInHand = ((Integer)pb.getAct_hand_seq().getMo().elementAt(0)).intValue();
		}
		else if(hasHu)
		{
			newInHand = ((Integer)pb.getAct_hu_seq().elementAt(0)).intValue();
		}

		int[] onTableCards = new int[pb.getAct_chued_seq().size()];

		for(int index = 0; index < pb.getAct_chued_seq().size(); index++)
		{
			int card = ((Integer)pb.getAct_chued_seq().elementAt(index)).intValue();
			onTableCards[index] = card;
		}

		player.setInHand(inHandCards);
		player.setNewInHand(newInHand);
		player.setInHandTable(cbs);
		player.setOnTable(onTableCards);
	}
}
