
package game.view.window;

import game.control.WindowManager;
import game.model.Global;
import game.util.CommonUtil;

import java.io.IOException;
import java.util.Vector;

import net.jarlehansen.protobuf.javame.ByteString;
import network.YiuNetworkHandlerMgr;
import network.YiuNetworkListener;
import protocol.cs_get_award_collect_box;
import protocol.cs_get_collect_box;
import protocol.sc_get_award_collect_box;
import protocol.sc_get_collect_box;
import ui.UIButton;
import ui.UIObject;
import ui.UIWindow;

public class CollectWindow extends UIWindow implements YiuNetworkListener
{

	private UIButton[] _wanItemList;

	private UIButton[] _tiaoItemList;

	private UIButton[] _tongItemList;

	private UIButton[] _hAwardItemList;

	private UIButton[] _vAwardItemList;

	private UIButton _finalAwardItem;

	private UIButton _btnClose;

	private UIButton _btnOK;

	private UIButton _btnContinue;

	private UIButton _btnGetAward;

	private boolean _bInGame;

	protected void initUI()
	{
		_wanItemList = new UIButton[9];
		_tiaoItemList = new UIButton[9];
		_tongItemList = new UIButton[9];
		_hAwardItemList = new UIButton[9];
		for(int i = 0; i < 9; i++)
		{
			_wanItemList[i] = (UIButton)getChildByName("img_wan_" + (i + 1));
			_tiaoItemList[i] = (UIButton)getChildByName("img_tiao_" + (i + 1));
			_tongItemList[i] = (UIButton)getChildByName("img_tong_" + (i + 1));
			_hAwardItemList[i] = (UIButton)getChildByName("img_award_h_" + (i + 1));
		}
		_vAwardItemList = new UIButton[3];
		for(int i = 0; i < 3; i++)
		{
			_vAwardItemList[i] = (UIButton)getChildByName("img_award_v_" + (i + 1));
		}
		_finalAwardItem = (UIButton)getChildByName("img_award_final");
		_btnClose = (UIButton)getChildByName("btn_close");
		_btnOK = (UIButton)getChildByName("btn_ok");
		_btnContinue = (UIButton)getChildByName("btn_continue");
		_btnGetAward = (UIButton)getChildByName("btn_getaward");
		_btnContinue.setVisible(false);
		_btnGetAward.setVisible(false);
	}

	public void onEnter()
	{
		YiuNetworkHandlerMgr.subscribe(this);
		reqData();
		if(_args != null && ((Boolean)_args).booleanValue())
		{
			_args = null;
			_bInGame = true;
		}
	}

	public void onLeave()
	{
		YiuNetworkHandlerMgr.unSubscribe(this);
	}

	public void onConfirm(UIObject target)
	{
		if(target == _btnClose || target == _btnContinue || target == _btnOK)
			WindowManager.getInstance().closeWindow(this);
		else if(target == _btnGetAward)
		{
			try
			{
				Global.socketHall.sendProtobuf("cs_get_award_collect_box", cs_get_award_collect_box.newBuilder().setId(0).build().toByteArray());
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		}
	}

	public boolean onNetworkEvent(String name, ByteString content)
	{
		try
		{

			if(name.equals("sc_get_collect_box"))
			{
				sc_get_collect_box pb = sc_get_collect_box.parseFrom(content.toByteArray());
				updateTitleState(pb.getC_wan(), _wanItemList);
				updateTitleState(pb.getC_tiao(), _tiaoItemList);
				updateTitleState(pb.getC_tong(), _tongItemList);
				boolean awardFlag = updateAwardState(pb.getAward_hori(), _hAwardItemList);
				awardFlag = awardFlag || updateAwardState(pb.getAward_vert(), _vAwardItemList);
				int finalStatus = pb.getAward_status();
				awardFlag = awardFlag || finalStatus == 1;
				setSingleAwardState(_finalAwardItem, finalStatus);
				initBtn(awardFlag);
			}
			else if(name.equals("sc_get_award_collect_box"))
			{
				sc_get_award_collect_box pb = sc_get_award_collect_box.parseFrom(content.toByteArray());
				if(pb.getResult() >= 0)
				{
					Global.userDataVO.score += pb.getResult();
					CommonUtil.showPopupWindow(false, pb.getTips(), null);
				}
				else
				{
					CommonUtil.showPopupWindow(false, "¡Ï»°Ω±¿¯ ß∞‹", null);
				}
				reqData();
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}

	private void reqData()
	{
		try
		{
			Global.socketHall.sendProtobuf("cs_get_collect_box", cs_get_collect_box.newBuilder().setId(0).build().toByteArray());
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

	private void initBtn(boolean bCanGetAward)
	{
		if(bCanGetAward)
		{
			_btnOK.setVisible(false);
			_btnContinue.setVisible(false);
			_btnGetAward.setVisible(true);
			_btnClose.setNeighbors(null, _btnGetAward, null, null);
			_btnGetAward.setNeighbors(_btnClose, null, null, null);
			switchFocus(_btnGetAward);
		}
		else
		{
			if(_bInGame)
			{
				_btnOK.setVisible(false);
				_btnContinue.setVisible(true);
				_btnGetAward.setVisible(false);
				_btnClose.setNeighbors(null, _btnContinue, null, null);
				_btnContinue.setNeighbors(_btnClose, null, null, null);
				switchFocus(_btnContinue);
			}
			else
			{
				_btnOK.setVisible(true);
				_btnContinue.setVisible(false);
				_btnGetAward.setVisible(false);
				_btnClose.setNeighbors(null, _btnOK, null, null);
				_btnOK.setNeighbors(_btnClose, null, null, null);
				switchFocus(_btnOK);
			}
		}
	}

	private void updateTitleState(Vector vStatus, UIButton[] tileList)
	{
		int len = vStatus.size();
		for(int index = 0; index < len; index++)
		{
			int status = ((Integer)vStatus.elementAt(index)).intValue();
			if(status == 0)
				tileList[index].setState(STATE_NORMAL);
			else
				tileList[index].setState(STATE_FOCUS);
		}
	}

	private boolean updateAwardState(Vector vStatus, UIButton[] awardList)
	{
		boolean flag = false;
		int len = vStatus.size();
		for(int index = 0; index < len; index++)
		{
			int status = ((Integer)vStatus.elementAt(index)).intValue();
			if(!flag && status == 1)
				flag = true;
			setSingleAwardState(awardList[index], status);
		}
		return flag;
	}

	private void setSingleAwardState(UIButton item, int status)
	{
		if(status == 0)
			item.setState(STATE_NORMAL);
		else if(status == 1)
			item.setState(STATE_FOCUS);
		else
			item.setState(STATE_DISABLE);
	}
}
