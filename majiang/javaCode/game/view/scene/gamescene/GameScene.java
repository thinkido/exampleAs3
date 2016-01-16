
package game.view.scene.gamescene;

import framework.consts.EventType;
import framework.consts.KeyType;
import framework.events.EventDispatcher;
import framework.views.Stage;
import game.constant.SceneType;
import game.control.SceneManager;
import game.control.WindowManager;
import game.model.Global;
import game.model.vo.EnterGameVO;
import game.view.scene.gamescene.elements.GameInfoUI;
import jing.GDC;
import jing.consts.CardPlace;
import jing.consts.GameDir;
import jing.consts.MahjongState;
import jing.consts.PlayerAction;
import jing.game.model.GamePlayModel;
import jing.game.net.GameRequest;
import jing.game.view.JiaoPreviewUI;
import jing.game.view.Mahjong;
import jing.game.view.Player;
import jing.pai.vo.ChuVO;
import jing.pai.vo.JiaoVO;
import ui.UIObject;
import ui.UIScene;

public class GameScene extends UIScene
{

	/**
	 * ��ǰʹ�õĳ���
	 */
	static public GameScene cur = null;

	/**
	 * ��Ϸģ��
	 */
	public GamePlayModel model = null;

	/**
	 * �Ϸ����
	 */
	public Player pUp = null;

	/**
	 * �����
	 */
	public Player pLeft = null;

	/**
	 * �ҷ����
	 */
	public Player pRight = null;

	/**
	 * �·����
	 */
	public Player pDown = null;

	/**
	 * ��Ϸ��Ϣ
	 */
	public GameInfoUI info = null;

	/**
	 * ���������
	 */
	public Mahjong lastChu = null;

	/**
	 * ����Ԥ��
	 */
	private JiaoPreviewUI jiaoPre = null;

	protected void initUI()
	{
		pUp = new Player(GameDir.UP);
		pLeft = new Player(GameDir.LEFT);
		pRight = new Player(GameDir.RIGHT);
		pDown = new Player(GameDir.DOWN);
		info = new GameInfoUI();

		this.addChild(pUp);
		this.addChild(pLeft);
		this.addChild(pRight);
		this.addChild(pDown);
		this.addChild(info);

		jiaoPre = new JiaoPreviewUI();
		jiaoPre.setVisible(false);
		this.addChild(jiaoPre);
	}

	public void jiaoTip(JiaoVO[] jiaos)
	{
		if(null == jiaos)
		{
			jiaoPre.setVisible(false);
		}
		else
		{
			jiaoPre.setVisible(true);
			jiaoPre.update(jiaos);
		}

	}

	/**
	 * ��ý���
	 */
	public void onStageFocus()
	{
		GDC.trace("gamescene ���������¼�");
		Stage.current.keyboard.addEventListener(EventType.EVENT_KEY_PRESSED, this);
	}

	/**
	 * ʧȥ����
	 */
	public void onStageBlur()
	{
		GDC.trace("gamescene �ͷż����¼�");
		Stage.current.keyboard.removeEventListener(EventType.EVENT_KEY_PRESSED, this);
	}

	public void onEnter()
	{
		GameScene.cur = this;
		model = new GamePlayModel((EnterGameVO)_args);
		model.init();
	}

	public void onLeave()
	{
		GameScene.cur = null;
		jiaoPre.dispose();
		info.dispose();
		model.dispose();
		model = null;
	}

	public void reset()
	{
		lastChu = null;
		this.pDown.reset();
		this.pUp.reset();
		this.pLeft.reset();
		this.pRight.reset();

		this.info.reset();

		this.model.reset();
	}

	public void readyGame()
	{
		if(GameScene.cur.model.isKicked())
		{
			switchToHall();
		}
		else
		{
			reset();
			WindowManager.getInstance().closeAllWindow();
			GameRequest.ins().readyGame();
		}
	}

	public void switchToHall()
	{
		Global.socketGame.close();
		// if(GameScene.cur.model.isKicked())
		// {
		WindowManager.getInstance().closeAllWindow();
		SceneManager.getInstance().switchScene(SceneType.SCENE_HALL);
		// }
		// else
		// {
		// GameRequest.ins().enterHall();
		// }
	}

	public void onConfirm(UIObject target)
	{

	}

	public Player getPlayerByDir(String dir)
	{
		if(GameDir.UP == dir)
		{
			return pUp;
		}

		if(GameDir.LEFT == dir)
		{
			return pLeft;
		}

		if(GameDir.RIGHT == dir)
		{
			return pRight;
		}

		if(GameDir.DOWN == dir)
		{
			return pDown;
		}

		return null;
	}

	public Player getPlayerBySeat(int seat)
	{
		String dir = getDirBySeat(seat);
		return getPlayerByDir(dir);
	}

	public String getDirBySeat(int seat)
	{
		int code = (seat + 4 - pDown.seat()) % 4;

		if(code == 1)
		{
			return GameDir.RIGHT;
		}

		if(code == 2)
		{
			return GameDir.UP;
		}

		if(code == 3)
		{
			return GameDir.LEFT;
		}

		return GameDir.DOWN;
	}

	public void onReciveEvent(byte type, EventDispatcher dispatcher, Object data)
	{
		if(type == EventType.EVENT_KEY_PRESSED)
		{
			Integer keyCode = (Integer)data;

			if(keyCode.byteValue() == KeyType.BACK)
			{
				// TODO ������Ƴ���ť
				return;
			}

			if(pDown.isAuto())
			{
				GameRequest.ins().gameManual();
				pDown.setAuto(false);
				info.showAuto(pDown.dir(), false);
			}

			switch(keyCode.byteValue())
			{
				case KeyType.UP:
				case KeyType.LEFT:
					pDown.changeSelectCard(GameDir.LEFT);
					break;
				case KeyType.DOWN:
				case KeyType.RIGHT:
					pDown.changeSelectCard(GameDir.RIGHT);
					break;
				case KeyType.CONFIRM:
					if(pDown.inTurn())
					{
						Mahjong mj = pDown.getSelectedCard();
						if(null != mj)
						{
							GameRequest.ins().gameAction(PlayerAction.CHU, mj.card());
							pDown.setSelectCard(-1);
							GameScene.cur.glowSameCardOnTable(-1);
						}
					}
					break;
			// default:
			// GameRequest.ins().enterHall();
			// break;
			}
		}
	}

	/**
	 * ��ʾ������صĽе���Ϣ
	 */
	public void showChuInfo(ChuVO chuVO)
	{
		if(null == chuVO)
		{
			// TODO �رս�����Ϣ��ʾ
		}
		else
		{
			// TODO �򿪽�����Ϣ��ʾ
		}
	}

	/**
	 * ����������ʾ�����к�ָ������ͬ��ֵ���Ʒ���
	 * 
	 * @param card
	 */
	public void glowSameCardOnTable(int card)
	{
		pDown.resetCardsState(CardPlace.ON_TABLE);
		pUp.resetCardsState(CardPlace.ON_TABLE);
		pLeft.resetCardsState(CardPlace.ON_TABLE);
		pRight.resetCardsState(CardPlace.ON_TABLE);

		if(card != -1)
		{
			pDown.changeCardsState(CardPlace.ON_TABLE, card, MahjongState.NORMAL, MahjongState.GLOW);
			pUp.changeCardsState(CardPlace.ON_TABLE, card, MahjongState.NORMAL, MahjongState.GLOW);
			pLeft.changeCardsState(CardPlace.ON_TABLE, card, MahjongState.NORMAL, MahjongState.GLOW);
			pRight.changeCardsState(CardPlace.ON_TABLE, card, MahjongState.NORMAL, MahjongState.GLOW);
		}

		setLastChu(lastChu);
	}

	/**
	 * ���������
	 * 
	 * @param mj
	 */
	public void setLastChu(Mahjong mj)
	{
		if(null == mj)
		{
			return;
		}

		if(lastChu != null)
		{
			lastChu.setState(MahjongState.NORMAL);
		}
		mj.setState(MahjongState.LAST_CHU);
		lastChu = mj;
	}
}
