package jing.game.net.handler
{
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
 * ¼ÌÐøÓÎϷ
 * 
 * @author Jing
 */
public class SCContinueGame
{

	public function SCContinueGame(pb:sc_continue_game)
	{
		var gs:GameScene= GameScene.cur;

		GameScene.cur.pDown.setSeat(pb.getSeat_index());

		for(var en:Enumeration= pb.getSeat_infoes().elements(); en.hasMoreElements();)
		{
			var info:sccontinue_seat_info= sccontinue_seat_info(en.nextElement());
			var player:Player= gs.getPlayerBySeat(info.getSeat_index());

			var seat_info:stplayer_info= stplayer_info(info.getPlayer_info());
			player.updateInfo(info.getSeat_index(), seat_info.getName(), seat_info.getGold(), seat_info.getPortrait(), seat_info.getSex());
			player.setLack(info.getLack());

			if(info.getIs_hu())
			{
				gs.info.setHu(player.dir(), true);
			}
			var inHandCards:Array= null;
			if(info.getSeat_index() == gs.pDown.seat())
			{
				var vecWan:Vector= info.getHand_seq().getWan();
				var vecTong:Vector= info.getHand_seq().getTong();
				var vecTiao:Vector= info.getHand_seq().getTiao();
				var vecLack:Vector= info.getHand_seq().getLack();
				var vecZi:Vector= info.getHand_seq().getZi();

				inHandCards = new int[vecWan.size() + vecTong.size() + vecTiao.size() + vecLack.size() + vecZi.size()];
				var cardIndex:int= 0;
				for(var index:int= 0; index < vecWan.size(); ++index)
				{
					var card_value:int= (Integer(vecWan.elementAt(index))).intValue();
					inHandCards[cardIndex++] = card_value;
				}
				for(var index:int= 0; index < vecTong.size(); ++index)
				{
					var card_value:int= (Integer(vecTong.elementAt(index))).intValue();
					inHandCards[cardIndex++] = card_value;
				}
				for(var index:int= 0; index < vecTiao.size(); ++index)
				{
					var card_value:int= (Integer(vecTiao.elementAt(index))).intValue();
					inHandCards[cardIndex++] = card_value;
				}
				for(var index:int= 0; index < vecLack.size(); ++index)
				{
					var card_value:int= (Integer(vecLack.elementAt(index))).intValue();
					inHandCards[cardIndex++] = card_value;
				}
				for(var index:int= 0; index < vecZi.size(); ++index)
				{
					var card_value:int= (Integer(vecZi.elementAt(index))).intValue();
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

			var vecHua:Vector= info.getHand_seq().getHua();
			for(var index:int= 0; index < vecHua.size(); ++index)
			{
				gs.info.addHua(player.dir(), (Integer(vecHua.elementAt(index))).intValue());
			}

			var vecComplex:Vector= info.getComplex_seq();
			var cbs:Array= new CombinVO[vecComplex.size()];
			for(var index:int= 0; index < vecComplex.size(); index++)
			{
				var tile:sccomplex_tile= sccomplex_tile(vecComplex.elementAt(index));
				cbs[index] = new CombinVO(tile.getType(), tile.getId());
			}

			var onTableCards:Array= new int[info.getChued_seq().size()];
			for(var index:int= 0; index < info.getChued_seq().size(); index++)
			{
				var card:int= (Integer(info.getChued_seq().elementAt(index))).intValue();
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
}