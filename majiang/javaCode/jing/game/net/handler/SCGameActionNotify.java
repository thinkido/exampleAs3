
package jing.game.net.handler;

import game.view.scene.gamescene.GameScene;
import game.view.scene.gamescene.windows.PlayerActionWindow;

import java.util.Vector;

import jing.GDC;
import jing.consts.CardPlace;
import jing.consts.EffectType;
import jing.consts.PlayerAction;
import jing.game.view.Mahjong;
import jing.game.view.Player;
import jing.game.vo.CombinVO;
import protocol.sc_game_action_notify;
import protocol.sccomplex_tile;
import protocol.st_hand_seq;

public class SCGameActionNotify
{

	public SCGameActionNotify(sc_game_action_notify pb)
	{
		// GDC.trace(pb.toString());
		PlayerActionWindow.close();
		GameScene.cur.info.setRemainTiles(pb.getTiles_remain());

		int action = pb.getId();
		if(PlayerAction.CHU == action)
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

	private void chu(sc_game_action_notify pb)
	{
		syncPlayerCards(pb);

		Player player = GameScene.cur.getPlayerBySeat(pb.getAct_seat_index());
		int count = player.cardCount(CardPlace.ON_TABLE);
		Mahjong mj = player.getCard(CardPlace.ON_TABLE, count - 1);
		GameScene.cur.setLastChu(mj);

		// GDC.trace(player.numChildren() + "×Ó¶ÔÏó");
	}

	private void peng(sc_game_action_notify pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.PENG);
	}

	private void mingGang(sc_game_action_notify pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.GANG);
	}

	private void anGang(sc_game_action_notify pb)
	{
		syncPlayerCards(pb);

		Player player = GameScene.cur.getPlayerBySeat(pb.getAct_seat_index());
		GameScene.cur.info.showEffect(player.dir(), EffectType.GANG);
	}

	private void hu(sc_game_action_notify pb)
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

	private void guo(sc_game_action_notify pb)
	{
		syncPlayerCards(pb);
	}

	private void chiLeft(sc_game_action_notify pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.CHI);
	}

	private void chiMiddle(sc_game_action_notify pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.CHI);
	}

	private void chiRight(sc_game_action_notify pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.CHI);
	}

	private void syncPlayerCards(sc_game_action_notify pb)
	{
		Player player = GameScene.cur.getPlayerBySeat(pb.getAct_seat_index());

		st_hand_seq shs = pb.getAct_hand_seq();
		int inHandCardsCount = shs.getTiao().size() + shs.getTong().size() + shs.getWan().size() + shs.getZi().size();
		int[] inHandCards = new int[inHandCardsCount];

		Vector vecComplex = pb.getAct_complex_seq();
		CombinVO[] cbs = new CombinVO[vecComplex.size()];
		for(int index = 0; index < vecComplex.size(); ++index)
		{
			sccomplex_tile tile = (sccomplex_tile)vecComplex.elementAt(index);
			cbs[index] = new CombinVO(tile.getType(), tile.getId());
		}

		boolean hasMo = (pb.getAct_mo_count() > 0);
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
