
package game.view.scene.gamescene.windows;

import framework.resources.Res;
import game.constant.WindowType;
import game.control.WindowManager;
import game.view.scene.gamescene.GameScene;
import game.view.scene.gamescene.elements.ChiPreviewUI;

import java.util.Hashtable;
import java.util.Vector;

import jing.consts.PlayerAction;
import jing.game.net.GameRequest;
import protocol.scgame_show_actions;
import ui.UIButton;
import ui.UIObject;
import ui.UIWindow;

/**
 * 游戏动作
 * 
 * @author Jing
 */
public class PlayerActionWindow extends UIWindow
{

	static private PlayerActionWindow _ins = null;

	static public void show(Vector actions)
	{
		close();
		if(GameScene.cur.pDown.isAuto() == false && actions != null && actions.size() >= 2)
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_PLAYER_ACTION, actions);
		}
	}

	static public void close()
	{
		if(_ins != null)
		{
			WindowManager.getInstance().closeWindow(_ins);
		}
	}

	private Vector _btns = null;

	private Hashtable _btn2Act = null;

	public PlayerActionWindow()
	{
		_ins = this;
		_btns = new Vector();
		_btn2Act = new Hashtable();
	}

	private void show()
	{
		Vector actions = (Vector)_args;
		for(int index = 0; index < actions.size(); ++index)
		{
			scgame_show_actions act = (scgame_show_actions)actions.elementAt(index);
			UIButton btn = null;
			if(act.getId() == PlayerAction.AN_GANG || act.getId() == PlayerAction.MING_GANG)
			{
				btn = createBtnGang();
				if(_btns.size() > 3)
				{
					_btns.insertElementAt(btn, 2);
				}
				else
				{
					_btns.addElement(btn);
				}
				_btn2Act.put(btn, act);
			}
			else if(act.getId() == PlayerAction.PENG)
			{
				btn = createBtnPeng();
				if(_btns.size() > 2)
				{
					_btns.insertElementAt(btn, 1);
				}
				else
				{
					_btns.addElement(btn);
				}
				_btn2Act.put(btn, act);
			}
			else if(act.getId() == PlayerAction.HU)
			{
				btn = createBtnHu();
				if(_btns.size() > 4)
				{
					_btns.insertElementAt(btn, 3);
				}
				else
				{
					_btns.addElement(btn);
				}
				_btn2Act.put(btn, act);
			}
			else if(act.getId() == PlayerAction.GUO)
			{
				btn = createBtnGuo();
				_btns.insertElementAt(btn, 0);
				_btn2Act.put(btn, act);
			}
			else if(act.getId() == PlayerAction.CHI_LEFT || act.getId() == PlayerAction.CHI_MIDDLE || act.getId() == PlayerAction.CHI_RIGHT)
			{
				int card = ((Integer)act.getTile_seq().elementAt(0)).intValue();
				btn = createBtnChi(act.getId(), card);
				_btns.addElement(btn);
				_btn2Act.put(btn, act);
			}

			System.out.println(act.toString());
		}

		int btnChiX = 587;
		int btnNormalX = 587;
		for(int i = 0; i < _btns.size(); i++)
		{
			UIButton btn = (UIButton)_btns.elementAt(i);
			this.addChild(btn);
			UIButton pre = null;
			UIButton next = null;
			if(i != 0)
			{
				pre = (UIButton)_btns.elementAt(i - 1);
			}
			if(i != _btns.size() - 1)
			{
				next = (UIButton)_btns.elementAt(i + 1);
			}

			btn.setNeighbors(null, null, next, pre);

			scgame_show_actions act = (scgame_show_actions)_btn2Act.get(btn);
			if(act.getId() == PlayerAction.CHI_LEFT || act.getId() == PlayerAction.CHI_MIDDLE || act.getId() == PlayerAction.CHI_RIGHT)
			{
				int y = 170;
				int gap = 60;
				btn.setPosition(btnChiX - btn.getWidth(), y);
				btnChiX -= (gap + btn.getWidth());

				int card = ((Integer)act.getTile_seq().elementAt(0)).intValue();
				ChiPreviewUI cp = new ChiPreviewUI(card, act.getId());
				cp.setPosition(btn.getX() + 75, btn.getY() + 35);
				this.addChild(cp);
			}
			else
			{
				int y = 300;
				int gap = 20;
				btn.setPosition(btnNormalX - btn.getWidth(), y);
				btnNormalX -= gap + btn.getWidth();
			}
		}

		switchFocus((UIButton)_btns.elementAt(1));
	}

	private UIButton createBtnGuo()
	{
		return new UIButton("action_guo_normal_png", "action_guo_selected_png", "action_guo_normal_png");
	}

	private UIButton createBtnGang()
	{
		return new UIButton("action_gang_normal_png", "action_gang_selected_png", "action_gang_normal_png");
	}

	private UIButton createBtnHu()
	{
		return new UIButton("action_hu_normal_png", "action_hu_selected_png", "action_hu_normal_png");
	}

	private UIButton createBtnPeng()
	{
		return new UIButton("action_peng_normal_png", "action_peng_selected_png", "action_peng_normal_png");
	}

	private UIButton createBtnChi(int actId, int card)
	{
		return new UIButton("action_chi_normal_png", "action_chi_selected_png", "action_chi_normal_png");
	}

	protected void initUI()
	{

	}

	public void onEnter()
	{
		show();
	}

	public void onLeave()
	{
		Res.actively.release("action_guo_normal_png");
	}

	public void onConfirm(UIObject target)
	{
		scgame_show_actions action = (scgame_show_actions)_btn2Act.get(target);
		int id = action.getId();
		System.out.println("玩家选择了操作：" + id);
		int typeOrId = 0;
		if(id == PlayerAction.MING_GANG || id == PlayerAction.AN_GANG)
		{
			typeOrId = ((Integer)action.getTile_seq().elementAt(0)).intValue();
		}
		GameRequest.ins().gameAction(id, typeOrId);
		WindowManager.getInstance().closeWindow(this);
	}
}
