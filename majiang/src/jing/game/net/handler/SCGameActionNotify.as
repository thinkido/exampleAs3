package jing.game.net.handler
{
	import game.view.scene.gamescene.GameScene;
	import game.view.scene.gamescene.windows.PlayerActionWindow;
	
	import jing.consts.CardPlace;
	import jing.consts.EffectType;
	import jing.consts.PlayerAction;
	import jing.game.view.Mahjong;
	import jing.game.view.Player;
	import jing.game.vo.CombinVO;
	
	import protocol.gameserver.sc_game_action_notify;
	import protocol.gameserver.sccomplex_tile;
	import protocol.gameserver.st_hand_seq;
	
	public class SCGameActionNotify
	{
	
		public function SCGameActionNotify(pb:sc_game_action_notify)
		{
			// GDC.trace(pb.toString());
			PlayerActionWindow.close();
			GameScene.cur.info.setRemainTiles(pb.tilesRemain);
	
			var action:int= pb.id;
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
	
			var player:Player= GameScene.cur.getPlayerBySeat(pb.actSeatIndex);
			var count:int= player.cardCount(CardPlace.ON_TABLE);
			var mj:Mahjong= player.getCard(CardPlace.ON_TABLE, count - 1);
			GameScene.cur.setLastChu(mj);
	
			// GDC.trace(player.numChildren() + "×ӶÔÏó");
		}
	
		private function peng(pb:sc_game_action_notify):void{
			var player:Player= GameScene.cur.getPlayerBySeat(pb.actedSeatIndex);
			player.removeLastOnTable();
			syncPlayerCards(pb);
	
			GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.actSeatIndex).dir(), EffectType.PENG);
		}
	
		private function mingGang(pb:sc_game_action_notify):void{
			var player:Player= GameScene.cur.getPlayerBySeat(pb.actedSeatIndex);
			player.removeLastOnTable();
			syncPlayerCards(pb);
	
			GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.actSeatIndex).dir(), EffectType.GANG);
		}
	
		private function anGang(pb:sc_game_action_notify):void{
			syncPlayerCards(pb);
	
			var player:Player= GameScene.cur.getPlayerBySeat(pb.actSeatIndex);
			GameScene.cur.info.showEffect(player.dir(), EffectType.GANG);
		}
	
		private function hu(pb:sc_game_action_notify):void{
			var isZimo:Boolean= pb.actSeatIndex == pb.actedSeatIndex ? true : false;
			var player:Player= GameScene.cur.getPlayerBySeat(pb.actedSeatIndex);
			if(false == isZimo)
			{
				player.removeLastOnTable();
			}
			syncPlayerCards(pb);
	
			GameScene.cur.info.setHu(GameScene.cur.getDirBySeat(pb.actSeatIndex), true);
	
			GameScene.cur.info.showEffect(GameScene.cur.getDirBySeat(pb.actSeatIndex), EffectType.HU);
		}
	
		private function guo(pb:sc_game_action_notify):void{
			syncPlayerCards(pb);
		}
	
		private function chiLeft(pb:sc_game_action_notify):void{
			var player:Player= GameScene.cur.getPlayerBySeat(pb.actedSeatIndex);
			player.removeLastOnTable();
			syncPlayerCards(pb);
	
			GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.actSeatIndex).dir(), EffectType.CHI);
		}
	
		private function chiMiddle(pb:sc_game_action_notify):void{
			var player:Player= GameScene.cur.getPlayerBySeat(pb.actedSeatIndex);
			player.removeLastOnTable();
			syncPlayerCards(pb);
	
			GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.actSeatIndex).dir(), EffectType.CHI);
		}
	
		private function chiRight(pb:sc_game_action_notify):void{
			var player:Player= GameScene.cur.getPlayerBySeat(pb.actedSeatIndex);
			player.removeLastOnTable();
			syncPlayerCards(pb);
	
			GameScene.cur.info.showEffect(GameScene.cur.getPlayerBySeat(pb.actSeatIndex).dir(), EffectType.CHI);
		}
	
		private function syncPlayerCards(pb:sc_game_action_notify):void{
			var player:Player= GameScene.cur.getPlayerBySeat(pb.actSeatIndex);
	
			var shs:st_hand_seq= pb.actHandSeq;
			var inHandCardsCount:int= shs.tiao.length + shs.tong.length + shs.wan.length + shs.zi.length;
			var inHandCards:Array= new Array(inHandCardsCount);
	
			var vecComplex:Array= pb.actComplexSeq;
			var cbs:Array= new CombinVO[vecComplex.length];
			for(var index:int= 0; index < vecComplex.length; ++index)
			{
				var tile:sccomplex_tile= vecComplex[index] as sccomplex_tile;
				cbs[index] = new CombinVO(tile.type, tile.id);
			}
	
			var hasMo:Boolean= (pb.actMoCount > 0);
			var hasHu:Boolean= (pb.actHuSeq.length > 0);
	
			var newInHand:int= -1;
			if(hasMo)
			{
				newInHand = int(pb.actHandSeq.mo[0]);
			}
			else if(hasHu)
			{
				newInHand = int(pb.actHuSeq[0]);
	
			}
	
			var onTableCards:Array= [];
	
			for(index = 0; index < pb.actChuedSeq.length; index++)
			{
				var card:int= int(pb.actChuedSeq[index]);
				onTableCards.push(card);
			}
	
			player.setInHand(inHandCards);
			player.setNewInHand(newInHand);
			player.setInHandTable(cbs);
			player.setOnTable(onTableCards);
		}
	}
}