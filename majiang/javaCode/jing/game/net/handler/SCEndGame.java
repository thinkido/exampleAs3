
package jing.game.net.handler;

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

	private GameEndVO _ge = null;

	public SCEndGame(sc_end_game pb)
	{
		// GDC.trace(pb.toString());
		GameScene gs = GameScene.cur;
		_ge = new GameEndVO();
		_ge.basescore = gs.model.roomBase();
		if(pb.getLiuju())
		{
			_ge.state = 0;
		}

		gs.info.setCountdown(0);
		gs.info.showAuto(gs.pDown.dir(), false);

		for(int index = 0; index < pb.getSeq_infos().size(); ++index)
		{
			all_seq_info asi = (all_seq_info)(pb.getSeq_infos().elementAt(index));
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

			public void onTick(TickItem tickItem)
			{
				WindowManager.getInstance().openWindow(WindowType.WINDOW_GAME_END, _ge);
			}
		}, null);

	}

	private void updateGameEndVO(all_seq_info asi)
	{
		GameScene gs = GameScene.cur;
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
			_ge.totalScoreChange = (int)asi.getMoney_change();
			if(_ge.state == 1 || _ge.state == 0)
			{
				_ge.cards = getCards(asi);
				addHuTypes(asi, _ge.huTypeVec);
			}

		}
		else
		{
			for(int i = 0; i < asi.getHu_mt().size(); i++)
			{
				st_money_transfer smt = (st_money_transfer)asi.getHu_mt().elementAt(i);
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

	private void addHuTypes(all_seq_info asi, Vector vec)
	{
		GameScene gs = GameScene.cur;
		for(int i = 0; i < asi.getHu_desc().size(); i++)
		{
			st_hu_desc shd = (st_hu_desc)asi.getHu_desc().elementAt(i);
			GameEndTypeVO getVO = new GameEndTypeVO();
			getVO.type = shd.getType();
			getVO.fan = shd.getFan();
			getVO.id = gs.getPlayerBySeat(asi.getSeat_index()).name();
			vec.addElement(getVO);
		}
	}

	private int[] getCards(all_seq_info asi)
	{
		CardVector cards = new CardVector();
		for(int i = 0; i < asi.getComplex_seq().size(); i++)
		{
			sccomplex_tile st = (sccomplex_tile)asi.getComplex_seq().elementAt(i);
			if(st.getType() == CombinType.AN_GANG || st.getType() == CombinType.GANG)
			{
				int card = st.getId();
				cards.add(new int[]{card, card, card, card});
			}
			else if(st.getType() == CombinType.PENG)
			{
				int card = st.getId();
				cards.add(new int[]{card, card, card});
			}
			else if(st.getType() == CombinType.CHI_LEFT || st.getType() == CombinType.CHI_MIDDLE || st.getType() == CombinType.CHI_RIGHT)
			{
				int card = st.getId();
				cards.add(new int[]{card, card + 1, card + 2});
			}
		}

		Vector vecWan = asi.getHand_seq().getWan();
		Vector vecTong = asi.getHand_seq().getTong();
		Vector vecTiao = asi.getHand_seq().getTiao();
		Vector vecZi = asi.getHand_seq().getZi();

		for(int index = 0; index < vecWan.size(); ++index)
		{
			int card = ((Integer)vecWan.elementAt(index)).intValue();
			cards.add(card);
		}
		for(int index = 0; index < vecTong.size(); ++index)
		{
			int card = ((Integer)vecTong.elementAt(index)).intValue();
			cards.add(card);
		}
		for(int index = 0; index < vecTiao.size(); ++index)
		{
			int card = ((Integer)vecTiao.elementAt(index)).intValue();
			cards.add(card);
		}
		for(int index = 0; index < vecZi.size(); ++index)
		{
			int card = ((Integer)vecZi.elementAt(index)).intValue();
			cards.add(card);
		}

		if(asi.getHu_seq().size() > 0)
		{
			int huCard = ((Integer)asi.getHu_seq().elementAt(0)).intValue();
			cards.add(huCard);
		}

		return cards.getCards();
	}

	private void syncEndCards(all_seq_info pb)
	{
		GameScene gs = GameScene.cur;
		Player player = gs.getPlayerBySeat(pb.getSeat_index());

		Vector vecWan = pb.getHand_seq().getWan();
		Vector vecTong = pb.getHand_seq().getTong();
		Vector vecTiao = pb.getHand_seq().getTiao();
		Vector vecLack = pb.getHand_seq().getLack();
		Vector vecZi = pb.getHand_seq().getZi();

		int[] inHandCards = new int[vecWan.size() + vecTong.size() + vecTiao.size() + vecLack.size() + vecZi.size()];
		int cardIndex = 0;
		for(int index = 0; index < vecWan.size(); ++index)
		{
			int card_value = ((Integer)vecWan.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}
		for(int index = 0; index < vecTong.size(); ++index)
		{
			int card_value = ((Integer)vecTong.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}
		for(int index = 0; index < vecTiao.size(); ++index)
		{
			int card_value = ((Integer)vecTiao.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}
		for(int index = 0; index < vecLack.size(); ++index)
		{
			int card_value = ((Integer)vecLack.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}
		for(int index = 0; index < vecZi.size(); ++index)
		{
			int card_value = ((Integer)vecZi.elementAt(index)).intValue();
			inHandCards[cardIndex++] = card_value;
		}

		player.setInHand(inHandCards);
		player.setShowHand(true);
	}

}
