package jing.game.net.handler
{
import framework.time.ITickListener;
import framework.time.TickItem;
import framework.views.Stage;

import game.constant.WindowType;
import game.control.WindowManager;
import game.view.scene.gamescene.GameScene;

import jing.consts.CombinType;
import jing.game.view.Player;
import jing.game.vo.GameEndTypeVO;
import jing.game.vo.GameEndVO;
import jing.pai.model.CardVector;

import protos.gameserver.all_seq_info;
import protos.gameserver.sc_end_game;
import protos.gameserver.sccomplex_tile;
import protos.gameserver.st_hu_desc;
import protos.gameserver.st_money_transfer;

public class SCEndGame
{

	private var _ge:GameEndVO= null;

	public function SCEndGame(pb:sc_end_game)
	{
		// GDC.trace(pb.toString());
		var gs:GameScene= GameScene.cur;
		_ge = new GameEndVO();
		_ge.basescore = gs.model.roomBase();
		if(pb.liuju)
		{
			_ge.state = 0;
		}

		gs.info.setCountdown(0);
		gs.info.showAuto(gs.pDown.dir(), false);

		for(var index:int= 0; index < pb.seqInfos.length; ++index)
		{
			var asi:all_seq_info= (pb.seqInfos[index]) as all_seq_info;
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

		Stage.current.ticker.setTimeout(2000, new ITickListener(_ge)
			{
				public function onTick(tickItem:TickItem):void{
					WindowManager.getInstance().openWindow(WindowType.WINDOW_GAME_END, _ge);
				}
			}
			, null);

	}

	private function updateGameEndVO(asi:all_seq_info):void{
		var gs:GameScene= GameScene.cur;
		if(asi.seatIndex == gs.pDown.seat())
		{
			// Global.userDataVO.gold = asi.getTotal_gold();
			if(asi.moneyChange.toNumber() > 0)
			{
				_ge.state = 1;
			}
			else if(asi.moneyChange.toNumber() < 0)
			{
				_ge.state = 2;
			}
			else
			{
				_ge.state = 0;
			}
			// _ge.cards = getCards(asi);
			_ge.totalScoreChange = int(asi.moneyChange.toNumber());
			if(_ge.state == 1|| _ge.state == 0)
			{
				_ge.cards = getCards(asi);
				addHuTypes(asi, _ge.huTypeVec);
			}

		}
		else
		{
			for(var i:int= 0; i < asi.huMt.length; i++)
			{
				var smt:st_money_transfer= asi.huMt[i] as st_money_transfer;
				if(smt.atm == gs.pDown.seat())
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
		for(var i:int= 0; i < asi.huDesc.length; i++)
		{
			var shd:st_hu_desc= asi.huDesc[i] as st_hu_desc;
			var getVO:GameEndTypeVO= new GameEndTypeVO();
			getVO.type = shd.type;
			getVO.fan = shd.fan;
			getVO.id = gs.getPlayerBySeat(asi.seatIndex).name();
			vec.push(getVO);
		}
	}

	private function getCards(asi:all_seq_info):Array
	{
		var cards:CardVector= new CardVector();
		for(var i:int= 0; i < asi.complexSeq.length; i++)
		{
			var st:sccomplex_tile= asi.complexSeq[i] as sccomplex_tile;
			if(st.type == CombinType.AN_GANG || st.type == CombinType.GANG)
			{
				var card:int= st.id;
				cards.add_2([card, card, card, card]);
			}
			else if(st.type == CombinType.PENG)
			{
				var card:int= st.id;
				cards.add_2([card, card, card]);
			}
			else if(st.type == CombinType.CHI_LEFT || st.type == CombinType.CHI_MIDDLE || st.type == CombinType.CHI_RIGHT)
			{
				var card:int= st.id;
				cards.add_2([card, card + 1, card + 2]);
			}
		}

		var vecWan:Array= asi.handSeq.wan;
		var vecTong:Array= asi.handSeq.tong;
		var vecTiao:Array= asi.handSeq.tiao;
		var vecZi:Array= asi.handSeq.zi;

		for(var index:int= 0; index < vecWan.length; ++index)
		{
			var card:int= int(vecWan[index]);
			cards.add(card);
		}
		for(var index:int= 0; index < vecTong.length; ++index)
		{
			var card:int= int(vecTong[index]);
			cards.add(card);
		}
		for(var index:int= 0; index < vecTiao.length; ++index)
		{
			var card:int= int(vecTiao[index]);
			cards.add(card);
		}
		for(var index:int= 0; index < vecZi.length; ++index)
		{
			var card:int= int(vecZi[index]);
			cards.add(card);
		}

		if(asi.huSeq.length > 0)
		{
			var huCard:int= int(asi.huSeq[0]);
			cards.add(huCard);
		}

		return cards.getCards();
	}

	private function syncEndCards(pb:all_seq_info):void{
		var gs:GameScene= GameScene.cur;
		var player:Player= gs.getPlayerBySeat(pb.seatIndex);

		var vecWan:Array= pb.handSeq.wan;
		var vecTong:Array= pb.handSeq.tong;
		var vecTiao:Array= pb.handSeq.tiao;
		var vecLack:Array= pb.handSeq.lack;
		var vecZi:Array= pb.handSeq.zi;

		var inHandCards:Array= new int[vecWan.length + vecTong.length + vecTiao.length + vecLack.length + vecZi.length];
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

		player.setInHand(inHandCards);
		player.setShowHand(true);
	}
}
}