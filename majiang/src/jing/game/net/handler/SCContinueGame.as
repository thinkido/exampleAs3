package jing.game.net.handler
{
	import game.view.scene.gamescene.GameScene;
	
	import jing.game.view.Player;
	import jing.game.vo.CombinVO;
	
	import protocol.gameserver.sc_continue_game;
	import protocol.gameserver.sccomplex_tile;
	import protocol.gameserver.sccontinue_seat_info;
	import protocol.gameserver.stplayer_info;
	
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
	
			GameScene.cur.pDown.setSeat(pb.seatIndex);
			
			var len:int = pb.seatInfoes.length;
			for(var i:int = 0; i < len; i++)
			{
				var info:sccontinue_seat_info= pb.seatInfoes[i];
				var player:Player= gs.getPlayerBySeat(info.seatIndex);
	
				var seat_info:stplayer_info= stplayer_info(info.playerInfo);
				player.updateInfo(info.seatIndex, seat_info.name, seat_info.gold.toNumber(), seat_info.portrait, seat_info.sex);
				player.setLack(info.lack);
	
				if(info.isHu)
				{
					gs.info.setHu(player.dir(), true);
				}
				var inHandCards:Array= null;
				var index:int = 0 ;
				if(info.seatIndex == gs.pDown.seat())
				{
					var vecWan:Array= info.handSeq.wan;
					var vecTong:Array= info.handSeq.tong;
					var vecTiao:Array= info.handSeq.tiao;
					var vecLack:Array= info.handSeq.lack;
					var vecZi:Array= info.handSeq.zi;
	
					inHandCards = [] ;
					var cardIndex:int= 0;
					var card_value:int ;
					for(index = 0; index < vecWan.length; ++index)
					{
						card_value = int(vecWan[index]);
						inHandCards[cardIndex++] = card_value;
					}
					for(index = 0; index < vecTong.length; ++index)
					{
						card_value = int(vecTong[index]);
						inHandCards[cardIndex++] = card_value;
					}
					for(index = 0; index < vecTiao.length; ++index)
					{
						card_value = int(vecTiao[index]);
						inHandCards[cardIndex++] = card_value;
					}
					for(index = 0; index < vecLack.length; ++index)
					{
						card_value = int(vecLack[index]);
						inHandCards[cardIndex++] = card_value;
					}
					for(index = 0; index < vecZi.length; ++index)
					{
						card_value = int(vecZi[index]);
						inHandCards[cardIndex++] = card_value;
					}
				}
				else
				{
					inHandCards = [] ;
	
					if(info.moCount != 0)
					{
						player.setNewInHand(-1);
					}
				}
	
				var vecHua:Array= info.handSeq.hua;
				for(index = 0; index < vecHua.length; ++index)
				{
					gs.info.addHua(player.dir(), int(vecHua[index]));
				}
	
				var vecComplex:Array= info.complexSeq;
				var cbs:Array= new CombinVO[vecComplex.length];
				for(index = 0; index < vecComplex.length; index++)
				{
					var tile:sccomplex_tile= sccomplex_tile(vecComplex[index]);
					cbs[index] = new CombinVO(tile.type, tile.id);
				}
	
				var onTableCards:Array= [] ;
				for(index = 0; index < info.chuedSeq.length; index++)
				{
					var card:int= int(info.chuedSeq[index]);
					onTableCards[index] = card;
				}
	
				player.setInHand(inHandCards);
				player.setInHandTable(cbs);
				player.setOnTable(onTableCards);
	
				player.needRefresh();
	
				GameScene.cur.info.setName(player.dir(), player.name );
			}
	
			GameScene.cur.model.updateRoomInfo(pb.roomid, pb.roomBase, pb.roomLevel);
			GameScene.cur.info.setRoomBase(GameScene.cur.model.roomBase());
			GameScene.cur.info.setRemainTiles(pb.tilesRemain);
		}
	}
}