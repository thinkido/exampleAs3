
package game.view.window.shop;

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
import protocol.cs_exchange_fee;
import protocol.sc_exchange_fee_result;
import ui.UIButton;
import ui.UIObject;
import ui.UITextBMFont;
import ui.UIWindow;

public class TicketShopWindow extends UIWindow implements YiuNetworkListener
{

	private UIButton _btnClose;

	private UIButton[] _btnItemList;

	private UITextBMFont _bfTicket;

	private int[] _ticketCostList = new int[]{200, 400, 800, 1500, 2500, 5000};

	private int[] _goldGetList = new int[]{10000, 20000, 50000, 100000, 200000, 500000};

	private int _reqIndex;

	protected void initUI()
	{
		_bfTicket = (UITextBMFont)getChildByName("bf_ticket");
		_bfTicket.setAnchor(ANCHOR_BOTTOM_LEFT);
		_btnClose = (UIButton)getChildByName("btn_close");
		_btnItemList = new UIButton[6];
		for(int i = 0; i < 6; i++)
		{
			_btnItemList[i] = (UIButton)getChildByName("btn_item_" + (i + 1));
		}
		_btnItemList[0].setNeighbors(_btnClose, _btnItemList[3], _btnItemList[2], _btnItemList[1]);
		_btnItemList[1].setNeighbors(_btnClose, _btnItemList[4], _btnItemList[0], _btnItemList[2]);
		_btnItemList[2].setNeighbors(_btnClose, _btnItemList[5], _btnItemList[1], _btnItemList[0]);
		_btnItemList[3].setNeighbors(_btnItemList[0], null, _btnItemList[5], _btnItemList[4]);
		_btnItemList[4].setNeighbors(_btnItemList[1], null, _btnItemList[3], _btnItemList[5]);
		_btnItemList[5].setNeighbors(_btnItemList[2], null, _btnItemList[4], _btnItemList[3]);
		_btnClose.setNeighbors(null, _btnItemList[0], null, null);

		switchFocus(_btnItemList[0]);
	}

	public void onEnter()
	{
		updateTicket();
		YiuNetworkHandlerMgr.subscribe(this);
	}

	public void onLeave()
	{
		YiuNetworkHandlerMgr.unSubscribe(this);
	}

	public void onConfirm(UIObject target)
	{
		if(_btnClose == target)
			WindowManager.getInstance().closeWindow(this);
		else
		{
			for(int i = 0; i < 6; i++)
			{
				if(_btnItemList[i] == target)
				{
					if(Global.userDataVO.score >= _ticketCostList[i])
					{
						try
						{
							_reqIndex = i;
							Global.socketHall.sendProtobuf("cs_exchange_fee", cs_exchange_fee.newBuilder().setFee_id(_goldGetList[_reqIndex]).build().toByteArray());
						}
						catch(IOException e)
						{
							LogManager.getInstance().log("请求兑换积分失败", LogManager.LEVEL_ERROR);
						}
					}
					else
					{
						CommonUtil.showPopupWindow(false, "点券不足，无法兑换", null);
					}
				}
			}
		}
	}

	private void updateTicket()
	{
		_bfTicket.setText(CommonUtil.formatGold(Global.userDataVO.score));
	}

	public boolean onNetworkEvent(String name, ByteString content)
	{
		if(name.equals("sc_exchange_fee_result"))
		{
			try
			{
				sc_exchange_fee_result pb = sc_exchange_fee_result.parseFrom(content.toByteArray());
				if(pb.getResult() == 1)
					CommonUtil.showPopupWindow(false, "兑换积分出现错误", null);
				else
				{
					Global.userDataVO.score -= _ticketCostList[_reqIndex];
					updateTicket();
					Global.userDataVO.gold += _goldGetList[_reqIndex];
					((HallScene)SceneManager.getInstance().getCurScene()).updateUserInfo();
					CommonUtil.showPopupWindow(false, "兑换积分成功，获得" + _goldGetList[_reqIndex] + "积分", null);
				}
				_reqIndex = -1;
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
			return true;
		}
		return false;
	}
}
