package jing.game.net.handler
{
	import game.view.scene.gamescene.GameScene;
	import game.view.scene.gamescene.windows.PlayerActionWindow;
	
	import jing.consts.CardPlace;
	import jing.consts.EffectType;
	import jing.consts.GameDir;
	import jing.game.view.Player;
	import jing.pai.utils.CardUtil;
	
	import protocol.gameserver.sc_game_turn;
	
	public class SCGameTurn
	{
	
		public function SCGameTurn(pb:sc_game_turn)
		{
			var player:Player= GameScene.cur.getPlayerBySeat(pb.seatIndex);
			if(pb.mo)
			{
				for(var i:int= 0; i < pb.moTiles.length; i++)
				{
					var card:int= int(pb.moTiles[i]);
					if(CardUtil.isHua(card))
					{
						// ¶ÔӦÃ򵽻¨ÅƵĴ¦Àí
						GameScene.cur.info.addHua(GameDir.DOWN, card);
						GameScene.cur.info.showEffect(GameDir.DOWN, EffectType.BU_HUA);
					}
					else
					{
						player.setNewInHand(card);
					}
				}
			}
	
			player.updateChuTip();
			player.setInTurn(true);
	
			// ÏÔʾ²Ù×÷Ãæ°å
			PlayerActionWindow.show(pb.showActions);
	
			if(pb.mo)
			{
				// ÉèÖÃѡÖеÄÅÆ
				player.setSelectCard(player.cardCount(CardPlace.IN_HAND));
			}
			else
			{
				player.setSelectCard(player.cardCount(CardPlace.IN_HAND) - 1);
			}
	
			// ÏÔʾ²Ù×÷Õß
			GameScene.cur.info.setTurnDir(GameDir.DOWN);
	
			// ˢÐµ¹¼Æʱ
			GameScene.cur.info.setCountdown(pb.timeout);
		}
	
	}
}