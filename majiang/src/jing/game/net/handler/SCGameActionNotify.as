package jing.game.net.handler
{
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

	public function SCGameActionNotify(pb:sc_game_action_notify)
	{
		// GDC.trace(pb.toString());
		PlayerActionWindow.close();
		GameScene.cur.info.setRemainTiles(pb.getTiles_remain());

		var action:int= pb.getId();
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

	private function chu(pb:sc_game_action_notify):void{
		syncPlayerCards(pb);

		var player:Player= GameScene.cur.getPlayerBySeat(pb.getAct_seat_index());
		var count:int= player.cardCount(CardPlace.ON_TABLE);
		var mj:Mahjong= player.getCard(CardPlace.ON_TABLE, count - 1);
		GameScene.cur.setLastChu(mj);

		// GDC.trace(player.numChildren() + "子对象");
	}

	private function peng(pb:sc_game_action_notify):void{
		var player:Player= GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.PENG);
	}

	private function mingGang(pb:sc_game_action_notify):void{
		var player:Player= GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.GANG);
	}

	private function anGang(pb:sc_game_action_notify):void{
		syncPlayerCards(pb);

		var player:Player= GameScene.cur.getPlayerBySeat(pb.getAct_seat_index());
		GameScene.cur.info.showEffect(player.dir(), EffectType.GANG);
	}

	private function hu(pb:sc_game_action_notify):void{
		var isZimo:Boolean= pb.getAct_seat_index() == pb.getActed_seat_index() ? true : false;
		var player:Player= GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		if(false == isZimo)
		{
			player.removeLastOnTable();
		}
		syncPlayerCards(pb);

		GameScene.cur.info.setHu(GameScene.cur.getDirBySeat(pb.getAct_seat_index()), true);

		GameScene.cur.info.showEffect(GameScene.cur.getDirBySeat(pb.getAct_seat_index()), EffectType.HU);
	}

	private function guo(pb:sc_game_action_notify):void{
		syncPlayerCards(pb);
	}

	private function chiLeft(pb:sc_game_action_notify):void{
		var player:Player= GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.CHI);
	}

	private function chiMiddle(pb:sc_game_action_notify):void{
		var player:Player= GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.CHI);
	}

	private function chiRight(pb:sc_game_action_notify):void{
		var player:Player= GameScene.cur.getPlayerBySeat(pb.getActed_seat_index());
		player.removeLastOnTable();
		syncPlayerCards(pb);

		GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.getAct_seat_index()).dir(), EffectType.CHI);
	}

	private function syncPlayerCards(pb:sc_game_action_notify):void{
		var player:Player= GameScene.cur.getPlayerBySeat(pb.getAct_seat_index());

		var shs:st_hand_seq= pb.getAct_hand_seq();
		var inHandCardsCount:int= shs.getTiao().size() + shs.getTong().size() + shs.getWan().size() + shs.getZi().size();
		var inHandCards:Array= new int[inHandCardsCount];

		var vecComplex:Vector= pb.getAct_complex_seq();
		var cbs:Array= new CombinVO[vecComplex.size()];
		for(var index:int= 0; index < vecComplex.size(); ++index)
		{
			var tile:sccomplex_tile= sccomplex_tile(vecComplex.elementAt(index));
			cbs[index] = new CombinVO(tile.getType(), tile.getId());
		}

		var hasMo:Boolean= (pb.getAct_mo_count() > 0);
		var hasHu:Boolean= (pb.getAct_hu_seq().size() > 0);

		var newInHand:int= -1;
		if(hasMo)
		{
			newInHand = (Integer(pb.getAct_hand_seq().getMo().elementAt(0))).intValue();
		}
		else if(hasHu)
		{
			newInHand = (Integer(pb.getAct_hu_seq().elementAt(0))).intValue();

		}

		var onTableCards:Array= new int[pb.getAct_chued_seq().size()];

		for(var index:int= 0; index < pb.getAct_chued_seq().size(); index++)
		{
			var card:int= (Integer(pb.getAct_chued_seq().elementAt(index))).intValue();
			onTableCards[index] = card;
		}

		player.setInHand(inHandCards);
		player.setNewInHand(newInHand);
		player.setInHandTable(cbs);
		player.setOnTable(onTableCards);
	}
}
}