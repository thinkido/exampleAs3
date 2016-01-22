package jing.game.net.handler
{
import framework.time.ITickListener;
import framework.time.TickItem;
import framework.views.Stage;
import game.constant.WindowType;
import game.control.WindowManager;
import game.view.scene.gamescene.GameScene;

import java.util.Vector;

import jing.GDC;
import jing.consts.CombinType;
import jing.game.view.Player;
import jing.game.vo.GameEndTypeVO;
import jing.game.vo.GameEndVO;
import jing.pai.model.CardVector;
import protocol.all_seq_info;
import protocol.sc_end_game;
import protocol.sccomplex_tile;
import protocol.st_hu_desc;
import protocol.st_money_transfer;

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

		Stage.current.ticker.setTimeout(2000, new ITickListener()
		{

			public function onTick(tickItem:TickItem):void{
				WindowManager.getInstance().openWindow(WindowType.WINDOW_GAME_END, _ge);
			}
		}, null);

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
					// 这个人赢了自己的钱
					addHuTypes(asi, _ge.huTypeVec);
					break;
				}
			}
		}
	}

	private function addHuTypes(asi:all_seq_info, vec:Vector):void{
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

	private int[] getCards(var asi:all_seq_info)
	{
		var cards:CardVector= new CardVector();
		for(var i:int= 0; i < asi.getComplex_seq().size(); i++)
		{
			var st:sccomplex_tile= sccomplex_tile(asi.getComplex_seq().elementAt(i));
			if(st.getType() == CombinType.AN_GANG || st.getType() == CombinType.GANG)
			{
				var card:int= st.getId();
				cards.add(new int[]{card, card, card, card});
			}
			else if(st.getType() == CombinType.PENG)
			{
				var card:int= st.getId();
				cards.add(new int[]{card, card, card});
			}
			else if(st.getType() == CombinType.CHI_LEFT || st.getType() == CombinType.CHI_MIDDLE || st.getType() == CombinType.CHI_RIGHT)
			{
				var card:int= st.getId();
				cards.add(new int[]{card, card + 1, card + 2});
			}
		}

		var vecWan:Vector= asi.getHand_seq().getWan();
		var vecTong:Vector= asi.getHand_seq().getTong();
		var vecTiao:Vector= asi.getHand_seq().getTiao();
		var vecZi:Vector= asi.getHand_seq().getZi();

		for(var index:int= 0; index < vecWan.size(); ++index)
		{
			var card:int= (Integer(vecWan.elementAt(index))).intValue();
			cards.add(card);
		}
		for(var index:int= 0; index < vecTong.size(); ++index)
		{
			var card:int= (Integer(vecTong.elementAt(index))).intValue();
			cards.add(card);
		}
		for(var index:int= 0; index < vecTiao.size(); ++index)
		{
			var card:int= (Integer(vecTiao.elementAt(index))).intValue();
			cards.add(card);
		}
		for(var index:int= 0; index < vecZi.size(); ++index)
		{
			var card:int= (Integer(vecZi.elementAt(index))).intValue();
			cards.add(card);
		}

		if(asi.getHu_seq().size() > 0)
		{
			var huCard:int= (Integer(asi.getHu_seq().elementAt(0))).intValue();
			cards.add(huCard);
		}

		return cards.getCards();
	}

	private function syncEndCards(pb:all_seq_info):void{
		var gs:GameScene= GameScene.cur;
		var player:Player= gs.getPlayerBySeat(pb.getSeat_index());

		var vecWan:Vector= pb.getHand_seq().getWan();
		var vecTong:Vector= pb.getHand_seq().getTong();
		var vecTiao:Vector= pb.getHand_seq().getTiao();
		var vecLack:Vector= pb.getHand_seq().getLack();
		var vecZi:Vector= pb.getHand_seq().getZi();

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

		player.setInHand(inHandCards);
		player.setShowHand(true);
	}

}
}