
package game.view.window.user;

import framework.consts.EventType;
import framework.consts.KeyType;
import framework.events.EventDispatcher;
import game.constant.SceneType;
import game.control.AccountManager;
import game.control.LogManager;
import game.control.SceneManager;
import game.control.WindowManager;
import game.model.Global;
import game.util.CommonUtil;
import game.view.scene.HallScene;

import java.io.IOException;

import net.jarlehansen.protobuf.javame.ByteString;
import network.YiuNetworkHandlerMgr;
import network.YiuNetworkListener;
import protocol.cs_friend_profile;
import protocol.cs_update_profile;
import protocol.sc_friend_profile;
import protocol.t_friend_data;
import ui.UIButton;
import ui.UICheckBox;
import ui.UIImageView;
import ui.UILayer;
import ui.UIObject;
import ui.UITextBMFont;
import ui.UIWindow;

public class UserWindow extends UIWindow implements YiuNetworkListener
{

	private UIButton _btnClose;

	private UIImageView _imgHead;

	private UIButton _btnHead;

	private UITextBMFont _bfName;

	private UIImageView _imgTitle;

	private UITextBMFont _bfLevel;

	private UICheckBox _ckMale;

	private UICheckBox _ckFemale;

	private UITextBMFont _bfTicket;

	private UITextBMFont _bfGold;

	private UITextBMFont _bfTotalGame;

	private UITextBMFont _bfContinuousWin;

	private UITextBMFont _bfWinRate;

	private UserHeadMediator _mediator;

	private int _originPortrait;

	private int _originSex;

	protected void initUI()
	{
		_mediator = new UserHeadMediator((UILayer)getChildByName("layer_user_head"));
		_btnClose = (UIButton)getChildByName("btn_close");
		_imgHead = (UIImageView)getChildByName("img_head");
		_btnHead = (UIButton)getChildByName("btn_head");
		_bfName = (UITextBMFont)getChildByName("bf_name");
		_bfName.setAnchor(ANCHOR_BOTTOM_LEFT);
		_imgTitle = (UIImageView)getChildByName("img_title");
		_bfLevel = (UITextBMFont)getChildByName("bf_level");
		_bfLevel.setAnchor(ANCHOR_BOTTOM_LEFT);
		_ckMale = (UICheckBox)getChildByName("ck_male");
		_ckFemale = (UICheckBox)getChildByName("ck_female");
		_bfTicket = (UITextBMFont)getChildByName("bf_ticket");
		_bfTicket.setAnchor(ANCHOR_BOTTOM_LEFT);
		_bfGold = (UITextBMFont)getChildByName("bf_gold");
		_bfGold.setAnchor(ANCHOR_BOTTOM_LEFT);
		_bfTotalGame = (UITextBMFont)getChildByName("bf_total_game");
		_bfTotalGame.setAnchor(ANCHOR_BOTTOM_LEFT);
		_bfContinuousWin = (UITextBMFont)getChildByName("bf_continuous_win");
		_bfContinuousWin.setAnchor(ANCHOR_BOTTOM_LEFT);
		_bfWinRate = (UITextBMFont)getChildByName("bf_win_rate");
		_bfWinRate.setAnchor(ANCHOR_BOTTOM_LEFT);

		_btnClose.setNeighbors(null, _btnHead, null, null);
		_btnHead.setNeighbors(_btnClose, _ckMale, null, null);
		_ckMale.setNeighbors(_btnHead, null, _ckFemale, _ckFemale);
		_ckFemale.setNeighbors(_btnHead, null, _ckMale, _ckMale);

		switchFocus(_btnClose);
	}

	public void onEnter()
	{
		_mediator.setVisible(false);
		_originPortrait = Global.userDataVO.portrait;
		_originSex = Global.userDataVO.sex;
		updatePortrait();

		_bfName.setText(Global.userDataVO.name);
		_bfLevel.setText("" + Global.userDataVO.level);
		_imgTitle.setTexture(Global.getMyTitleTexture());
		if(Global.userDataVO.sex == 0)
		{
			_ckFemale.setState(STATE_CHECKED_NORMAL);
			_ckMale.setState(STATE_NORMAL);
		}
		else
		{
			_ckMale.setState(STATE_CHECKED_NORMAL);
			_ckFemale.setState(STATE_NORMAL);
		}
		_bfTicket.setText("" + Global.userDataVO.score);
		_bfGold.setText(CommonUtil.formatGold(Global.userDataVO.gold));

		YiuNetworkHandlerMgr.subscribe(this);
		String id = AccountManager.getInstance().getId();
		String idtype = AccountManager.getInstance().getType();
		try
		{
			Global.socketHall.sendProtobuf("cs_friend_profile", cs_friend_profile.newBuilder().setId(id).setIdtype(idtype).build().toByteArray());
		}
		catch(IOException e)
		{
			LogManager.getInstance().log("发送协议失败", LogManager.LEVEL_ERROR);
		}
	}

	private void updatePortrait()
	{
		_imgHead.setTexture(Global.getMyHeadTexture());
	}

	public void onLeave()
	{
		YiuNetworkHandlerMgr.unSubscribe(this);
	}

	public void onConfirm(UIObject target)
	{
		if(_btnClose == target)
		{
			WindowManager.getInstance().closeWindow(this);
			if(_originSex != Global.userDataVO.sex || _originPortrait != Global.userDataVO.portrait)
			{
				try
				{
					Global.socketHall.sendProtobuf("cs_update_profile", cs_update_profile.newBuilder().setSex(Global.userDataVO.sex).setPortrait(Global.userDataVO.portrait).build().toByteArray());
					if(SceneManager.getInstance().getCurSceneType() == SceneType.SCENE_HALL)
						((HallScene)SceneManager.getInstance().getCurScene()).updateUserInfo();
					CommonUtil.showPopupWindow(false, "保存玩家信息成功", null);
				}
				catch(IOException e)
				{
					LogManager.getInstance().log("保存玩家信息失败", LogManager.LEVEL_ERROR);
				}

			}
		}
		else if(_btnHead == target)
		{
			showHeadPanel();
		}
		else if(_ckMale == target)
		{
			_ckMale.setState(STATE_CHECKED_FOCUS);
			_ckFemale.setState(STATE_NORMAL);
			Global.userDataVO.sex = 1;
			updatePortrait();
		}
		else if(_ckFemale == target)
		{
			_ckFemale.setState(STATE_CHECKED_FOCUS);
			_ckMale.setState(STATE_NORMAL);
			Global.userDataVO.sex = 0;
			updatePortrait();
		}
	}

	public boolean onNetworkEvent(String name, ByteString content)
	{
		try
		{
			if(name.equals("sc_friend_profile"))
			{
				sc_friend_profile msg = sc_friend_profile.parseFrom(content.toByteArray());
				t_friend_data data = msg.getProfile();
				Global.userDataVO.update(data);
				_bfTotalGame.setText("" + Global.userDataVO.getTotalNum());
				// _bfContinuousWin
				_bfWinRate.setText(Global.userDataVO.getWinRate());
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}

	public void onReciveEvent(byte type, EventDispatcher dispatcher, Object data)
	{
		if(type == EventType.EVENT_KEY_PRESSED && _mediator.getVisible())
		{
			byte keyCode = ((Integer)data).byteValue();
			if(keyCode >= KeyType.NUM_0 && keyCode <= KeyType.NUM_9)
				choosePortrait(keyCode - KeyType.NUM_0);
		}
		else
			super.onReciveEvent(type, dispatcher, data);
	}

	private void showHeadPanel()
	{
		_mediator.setSex(Global.userDataVO.sex);
		_mediator.setVisible(true);
	}

	private void hideHeadPanel()
	{
		_mediator.setVisible(false);
	}

	private void choosePortrait(int index)
	{
		if(index > 0)
		{
			Global.userDataVO.portrait = index;
			updatePortrait();
		}
		hideHeadPanel();
	}
}
