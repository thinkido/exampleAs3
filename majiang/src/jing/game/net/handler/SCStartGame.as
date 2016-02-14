package jing.game.net.handler
{
	import game.view.scene.gamescene.GameScene;
	
	import protocol.gameserver.hand_seq_info;
	import protocol.gameserver.sc_start_game;
	
	public class SCStartGame
	{
	
		public function SCStartGame(pb:sc_start_game)
		{
			trace(pb.toString());
	
			var gs:GameScene= GameScene.cur;
	
			gs.reset();
	
			gs.pDown.setSeat(pb.youSeqInfo.seatIndex);
	
			var vecWan:Array= pb.youSeqInfo.handSeq.wan;
			var vecTong:Array= pb.youSeqInfo.handSeq.tong;
			var vecTiao:Array= pb.youSeqInfo.handSeq.tiao;
			var vecLack:Array= pb.youSeqInfo.handSeq.lack;
			var vecZi:Array= pb.youSeqInfo.handSeq.zi;
			var vecHua:Array= pb.youSeqInfo.handSeq.hua;
	
			var inHandCards:Array= [] ;
			var cardIndex:int= 0;
			for(var index:int= 0; index < vecWan.length; ++index)
			{
				var card_value:int= int(vecWan[index]);
				inHandCards[cardIndex++] = card_value;
			}
			for(var index:int= 0; index < vecTong.length; ++index)
			{
				var card_value:int= int(vecTong[index]);
				inHandCards[cardIndex++] = card_value;
			}
			for(var index:int= 0; index < vecTiao.length; ++index)
			{
				var card_value:int= int(vecTiao[index]);
				inHandCards[cardIndex++] = card_value;
			}
			for(var index:int= 0; index < vecLack.length; ++index)
			{
				var card_value:int= int(vecLack[index]);
				inHandCards[cardIndex++] = card_value;
			}
			for(var index:int= 0; index < vecZi.length; ++index)
			{
				var card_value:int= int(vecZi[index]);
				inHandCards[cardIndex++] = card_value;
			}
	
			for(var index:int= 0; index < vecHua.length; ++index)
			{
				gs.info.addHua(gs.pDown.dir(), int(vecHua[index]));
			}
	
			gs.pDown.setInHand(inHandCards);
	
			gs.info.setRemainTiles(pb.tilesRemain);
	
			for(var i:int= 0; i < pb.otherInfoes.length; i++)
			{
				var hsi:hand_seq_info= (pb.otherInfoes[i]) as hand_seq_info;
				if(gs.pDown.seat() == hsi.seatIndex)
				{
					continue;
				}
	
				if(hsi.handSeq.hua.length > 0)
				{
					var dir:String= gs.getDirBySeat(hsi.seatIndex);
					for(var j:int= 0; j < hsi.handSeq.hua.length; j++)
					{
						var card:int= int(hsi.handSeq.hua[j]);
						gs.info.addHua(dir, card);
					}
				}
			}
	
			var otherCards:Array= new Array[13];
			gs.pLeft.setInHand(otherCards);
			gs.pRight.setInHand(otherCards);
			gs.pUp.setInHand(otherCards);
		}
	
	}
}