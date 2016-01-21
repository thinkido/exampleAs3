package jing.game.net.handler
{
import game.view.scene.gamescene.GameScene;

import java.util.Vector;

import jing.GDC;
import protocol.hand_seq_info;
import protocol.sc_start_game;

public class SCStartGame
{

	public function SCStartGame(pb:sc_start_game)
	{
		GDC.trace(pb.toString());

		var gs:GameScene= GameScene.cur;

		gs.reset();

		gs.pDown.setSeat(pb.getYou_seq_info().getSeat_index());

		var vecWan:Vector= pb.getYou_seq_info().getHand_seq().getWan();
		var vecTong:Vector= pb.getYou_seq_info().getHand_seq().getTong();
		var vecTiao:Vector= pb.getYou_seq_info().getHand_seq().getTiao();
		var vecLack:Vector= pb.getYou_seq_info().getHand_seq().getLack();
		var vecZi:Vector= pb.getYou_seq_info().getHand_seq().getZi();
		var vecHua:Vector= pb.getYou_seq_info().getHand_seq().getHua();

		var inHandCards:Array= new int[vecWan.size() + vecTong.size() + vecTiao.size() + vecLack.size() + vecZi.size()];
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

		for(var index:int= 0; index < vecHua.size(); ++index)
		{
			gs.info.addHua(gs.pDown.dir(), (Integer(vecHua.elementAt(index))).intValue());
		}

		gs.pDown.setInHand(inHandCards);

		gs.info.setRemainTiles(pb.getTiles_remain());

		for(var i:int= 0; i < pb.getOther_infoes().size(); i++)
		{
			var hsi:hand_seq_info= hand_seq_info(pb.getOther_infoes().elementAt(i));
			if(gs.pDown.seat() == hsi.getSeat_index())
			{
				continue;
			}

			if(hsi.getHand_seq().getHua().size() > 0)
			{
				var dir:String= gs.getDirBySeat(hsi.getSeat_index());
				for(var j:int= 0; j < hsi.getHand_seq().getHua().size(); j++)
				{
					var card:int= (Integer(hsi.getHand_seq().getHua().elementAt(j))).intValue();
					gs.info.addHua(dir, card);
				}
			}
		}

		var otherCards:Array= new int[13];
		gs.pLeft.setInHand(otherCards);
		gs.pRight.setInHand(otherCards);
		gs.pUp.setInHand(otherCards);
	}

}
}