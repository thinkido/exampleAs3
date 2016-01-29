package jing.game.net.handler
{
	import framework.views.Stage;
	
	import game.view.scene.gamescene.GameScene;
	
	import jing.consts.CombinType;
	import jing.game.view.Player;
	import jing.game.vo.GameEndTypeVO;
	import jing.game.vo.GameEndVO;
	import jing.pai.model.CardVector;
	
	public class SCEndGame
	{
		
		private var _ge:GameEndVO= null;
		
		public function SCEndGame(pb:sc_end_game)
		{
			// GDC.trace(pb.toString());
			var gs:GameScene= GameScene.cur;
			_ge = new GameEndVO();
			_ge.basescore = gs.model.roomBase();
			if(pb.getLiuju())
			{
				_ge.state = 0;
			}
			
			gs.info.setCountdown(0);
			gs.info.showAuto(gs.pDown.dir(), false);
			
			for(var index:int= 0; index < pb.getSeq_infos().size(); ++index)
			{
				var asi:all_seq_info= all_seq_info((pb.getSeq_infos().elementAt(index)));
				syncEndCards(asi);
				if(false == pb.getLiuju())
				{
					updateGameEndVO(asi);
				}
			}
			
			gs.pDown.setInTurn(false);
			gs.pDown.setShowHand(true);
			gs.pRight.setShowHand(true);
			gs.pUp.setShowHand(true);
			gs.pLeft.setShowHand(true);
			gs.model.startLeaveRoomTimer();
			
			/*Stage.current.ticker.setTimeout(2000, new ITickListener()
				{
					
					public function onTick(tickItem:TickItem):void{
						WindowManager.getInstance().openWindow(WindowType.WINDOW_GAME_END, _ge);
					}
				}, null);*/
			
			Stage.current.ticker.setTimeout(2000, new TickListener(_ge), null );
			
		}
		
		private function updateGameEndVO(asi:all_seq_info):void{
			var gs:GameScene= GameScene.cur;
			if(asi.getSeat_index() == gs.pDown.seat())
			{
				// Global.userDataVO.gold = asi.getTotal_gold();
				if(asi.getMoney_change() > 0)
				{
					_ge.state = 1;
				}
				else if(asi.getMoney_change() < 0)
				{
					_ge.state = 2;
				}
				else
				{
					_ge.state = 0;
				}
				// _ge.cards = getCards(asi);
				_ge.totalScoreChange = int(asi.getMoney_change());
				if(_ge.state == 1|| _ge.state == 0)
				{
					_ge.cards = getCards(asi);
					addHuTypes(asi, _ge.huTypeVec);
				}
				
			}
			else
			{
				for(var i:int= 0; i < asi.getHu_mt().size(); i++)
				{
					var smt:st_money_transfer= st_money_transfer(asi.getHu_mt().elementAt(i));
					if(smt.getAtm() == gs.pDown.seat())
					{
						_ge.cards = getCards(asi);
						// Õâ¸öÈËӮÁË×ԼºµÄǮ
						addHuTypes(asi, _ge.huTypeVec);
						break;
					}
				}
			}
		}
		
		private function addHuTypes(asi:all_seq_info, vec:Array):void{
			var gs:GameScene= GameScene.cur;
			for(var i:int= 0; i < asi.getHu_desc().size(); i++)
			{
				var shd:st_hu_desc= st_hu_desc(asi.getHu_desc().elementAt(i));
				var getVO:GameEndTypeVO= new GameEndTypeVO();
				getVO.type = shd.getType();
				getVO.fan = shd.getFan();
				getVO.id = gs.getPlayerBySeat(asi.getSeat_index()).name();
				vec.addElement(getVO);
			}
		}
		
		private function getCards(asi:all_seq_info):Array
		{
			var cards:CardVector= new CardVector();
			var card:int 
			for(var i:int= 0; i < asi.getComplex_seq().size(); i++)
			{
				var st:sccomplex_tile= sccomplex_tile(asi.getComplex_seq().elementAt(i));
				if(st.getType() == CombinType.AN_GANG || st.getType() == CombinType.GANG)
				{
					card = st.getId();
					cards.add_2([card, card, card, card]);
				}
				else if(st.getType() == CombinType.PENG)
				{
					card = st.getId();
					cards.add_2([card, card, card]);
				}
				else if(st.getType() == CombinType.CHI_LEFT || st.getType() == CombinType.CHI_MIDDLE || st.getType() == CombinType.CHI_RIGHT)
				{
					card = st.getId();
					cards.add_2([card, card + 1, card + 2]);
				}
				
				
			}


			
			var vecWan:Array = asi.getHand_seq().getWan();
			var vecTong:Array = asi.getHand_seq().getTong();
			var vecTiao:Array = asi.getHand_seq().getTiao();
			var vecZi:Array = asi.getHand_seq().getZi();
			
			for(var index:int = 0; index < vecWan.size(); ++index)
			{
				card = vecWan[index];
				cards.add(card);
			}
			for(index = 0; index < vecTong.size(); ++index)
			{
//				var card:int= (Integer(vecTong.elementAt(index))).intValue();
				card = vecTong[index];
				cards.add(card);
			}
			for(index = 0; index < vecTiao.size(); ++index)
			{
				card = vecTiao[index];
				cards.add(card);
			}
			for(index = 0; index < vecZi.size(); ++index)
			{
				card = vecZi[index];
				cards.add(card);
			}
			
			if(asi.getHu_seq().length > 0)
			{
				var huCard:int= asi.getHu_seq()[0];
				cards.add(huCard);
			}
			
			return cards.getCards();
		}
		
		private function syncEndCards(pb:all_seq_info):void{
			var gs:GameScene= GameScene.cur;
			var player:Player= gs.getPlayerBySeat(pb.getSeat_index());
			
			var vecWan:Array = pb.getHand_seq().getWan();
			var vecTong:Array = pb.getHand_seq().getTong();
			var vecTiao:Array = pb.getHand_seq().getTiao();
			var vecLack:Array = pb.getHand_seq().getLack();
			var vecZi:Array = pb.getHand_seq().getZi();
			
			var inHandCards:Array= new int[vecWan.size() + vecTong.size() + vecTiao.size() + vecLack.size() + vecZi.size()];
			var cardIndex:int= 0;
			var card_value:int = 0;
			for(var index:int= 0; index < vecWan.size(); ++index)
			{
				card_value = vecWan[index];
				inHandCards[cardIndex++] = card_value;
			}
			for(index = 0; index < vecTong.size(); ++index)
			{
				card_value = vecTong[index];
				inHandCards[cardIndex++] = card_value;
			}
			for(index = 0; index < vecTiao.size(); ++index)
			{
				card_value = vecTiao[index];
				inHandCards[cardIndex++] = card_value;
			}
			for(index = 0; index < vecLack.size(); ++index)
			{
				card_value = vecLack[index];
				inHandCards[cardIndex++] = card_value;
			}
			for(index = 0; index < vecZi.size(); ++index)
			{
				card_value = vecZi[index];
				inHandCards[cardIndex++] = card_value;
			}
			
			player.setInHand(inHandCards);
			player.setShowHand(true);
		}
		
	}
}
import framework.time.ITickListener;
import framework.time.TickItem;

import game.constant.WindowType;
import game.control.WindowManager;

import jing.game.vo.GameEndVO;

class TickListener implements ITickListener 
{
	private var _ge:GameEndVO;
	
	public function TickListener(vo:GameEndVO)
	{
		this._ge = vo;
	}
	
	public function onTick(tickItem:TickItem):void
	{
		WindowManager.getInstance().openWindow(WindowType.WINDOW_GAME_END, _ge);
	}
}