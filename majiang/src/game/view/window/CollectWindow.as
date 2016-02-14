package game.view.window
{
import com.thinkido.framework.common.observer.Notification;

import flash.utils.ByteArray;
import flash.utils.Endian;

import game.control.AccountManager;
import game.control.NetManager;
import game.control.WindowManager;
import game.model.Global;
import game.util.CommonUtil;

import network.YiuNetworkListener;

import protocol.hallserver.cs_get_award_collect_box;
import protocol.hallserver.cs_get_collect_box;
import protocol.hallserver.sc_get_award_collect_box;
import protocol.hallserver.sc_get_collect_box;

import ui.UIButton;
import ui.UIObject;
import ui.UIWindow;

public class CollectWindow extends UIWindow implements YiuNetworkListener
{

	private var _wanItemList:Vector.<UIButton>;

	private var _tiaoItemList:Vector.<UIButton>;

	private var _tongItemList:Vector.<UIButton>;

	private var _hAwardItemList:Vector.<UIButton>;

	private var _vAwardItemList:Vector.<UIButton>;

	private var _finalAwardItem:UIButton;

	private var _btnClose:UIButton;

	private var _btnContinue:UIButton;

	private var _btnGetAward:UIButton;

	override public function initUI():void
	{
		_wanItemList = new Vector.<UIButton>;
		_tiaoItemList = new Vector.<UIButton>;
		_tongItemList = new Vector.<UIButton>;
		_hAwardItemList = new Vector.<UIButton>;
		for(var i:int = 0; i < 9; i++)
		{
			_wanItemList[i] = getChildByName("img_wan_" + (i + 1)) as UIButton;
			_tiaoItemList[i] = getChildByName("img_tiao_" + (i + 1)) as UIButton;
			_tongItemList[i] = getChildByName("img_tong_" + (i + 1)) as UIButton;
			_hAwardItemList[i] = getChildByName("img_award_h_" + (i + 1)) as UIButton;
		}
		_vAwardItemList = new Vector.<UIButton>;
		for(i = 0; i < 3; i++)
		{
			_vAwardItemList[i] = getChildByName("img_award_v_" + (i + 1)) as UIButton;
		}
		_finalAwardItem = getChildByName("img_award_final") as UIButton;
		_btnClose = getChildByName("btn_close") as UIButton;
		_btnContinue = getChildByName("btn_continue") as UIButton;
		_btnGetAward = getChildByName("btn_getaward") as UIButton;
		_btnContinue.visible = false;
		_btnGetAward.visible = false;
	}

	override public function onEnter():void
	{
//		YiuNetworkHandlerMgr.subscribe(this);
		AccountManager.getInstance().registerMsgs(proList ,onNetworkEvent,"CollectWindow");
		reqData();
	}

	override public function onLeave():void
	{
//		YiuNetworkHandlerMgr.unSubscribe(this);
		disposePro();
	}

	override public function onConfirm( target:UIObject):void
	{
		if(target == _btnClose || target == _btnContinue)
			WindowManager.getInstance().closeWindow(this);
		else if(target == _btnGetAward)
		{
			try
			{
				var msg:cs_get_award_collect_box = new cs_get_award_collect_box();
				msg.id = 0 ;
				var msgBy:ByteArray = new ByteArray();
				msgBy.endian = Endian.LITTLE_ENDIAN ;
				msg.writeTo( msgBy );
				NetManager.sendProtobuf(Global.socketHall,"cs_get_award_collect_box", msgBy);
			}
			catch( e:Error)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
		}
	}
	
	public function disposePro():void{
		AccountManager.getInstance().removeMsgs(proList ,"CollectWindow");		
	}
	private var proList:Array = ["sc_get_collect_box",
		"sc_get_award_collect_box"];
	public function onNetworkEvent(e:Notification):void
	{
		var name:String = e.name ;
		var content:ByteArray = e.body as ByteArray ;
		try
		{

			if(name == "sc_get_collect_box")
			{
				var pb:sc_get_collect_box = new sc_get_collect_box() ;
					pb.mergeFrom(content) ;
				updateTitleState(pb.cWan, _wanItemList);
				updateTitleState(pb.cTiao, _tiaoItemList);
				updateTitleState(pb.cTong, _tongItemList);
				var awardFlag:Boolean = updateAwardState(pb.awardHori, _hAwardItemList);
				awardFlag = awardFlag || updateAwardState(pb.awardVert, _vAwardItemList);
				var finalStatus:int = pb.awardStatus;
				awardFlag = awardFlag || finalStatus == 1;
				setSingleAwardState(_finalAwardItem, finalStatus);
				initBtn(awardFlag);
			}
			else if(name == "sc_get_award_collect_box")
			{
				var pb1:sc_get_award_collect_box = new sc_get_award_collect_box() ;
					pb1.mergeFrom(content) ;
				if(pb1.result >= 0)
				{
					Global.userDataVO.score += pb.result ;
					CommonUtil.showPopupWindow(false, pb1.tips, null);
				}
				else
				{
					CommonUtil.showPopupWindow(false, "领取奖励失败", null);
				}
				reqData();
			}
		}
		catch( ex:Error)
		{
			ex.printStackTrace();
		}
//		return false;
	}

	private function reqData():void
	{
		try
		{
			var msg:cs_get_collect_box = new cs_get_collect_box();
			msg.id = 0 ;
			var msgBy:ByteArray = new ByteArray();
			msgBy.endian = Endian.LITTLE_ENDIAN ;
			msg.writeTo( msgBy );
			NetManager.sendProtobuf(Global.socketHall,"cs_get_collect_box", msgBy );
		}
		catch( ex:Error)
		{
			ex.printStackTrace();
		}
	}

	private function initBtn( bCanGetAward:Boolean):void
	{
		if(bCanGetAward)
		{
			_btnContinue.visible = false;
			_btnGetAward.visible = true;
			_btnClose.setNeighbors(null, _btnGetAward, null, null);
			_btnGetAward.setNeighbors(_btnClose, null, null, null);
			switchFocus(_btnGetAward);
		}
		else
		{
			_btnContinue.visible = true;
			_btnGetAward.visible = false;
			_btnClose.setNeighbors(null, _btnContinue, null, null);
			_btnContinue.setNeighbors(_btnClose, null, null, null);
			switchFocus(_btnContinue);
		}
	}

	private function updateTitleState( vStatus:Array, tileList:Vector.<UIButton>):void
	{
		var len:int = vStatus.length;
		for(var index:int = 0; index < len; index++)
		{
			var status:int = int(vStatus[index]);
			if(status == 0)
				tileList[index].setState(STATE_NORMAL);
			else
				tileList[index].setState(STATE_FOCUS);
		}
	}

	private function updateAwardState( vStatus:Array,  awardList:Vector.<UIButton>):Boolean
	{
		var flag:Boolean = false;
		var len:int = vStatus.size();
		for(var index:int = 0; index < len; index++)
		{
			var status:int = int(vStatus[index]);
			if(!flag && status == 1)
				flag = true;
			setSingleAwardState(awardList[index], status);
		}
		return flag;
	}

	private function setSingleAwardState( item:UIButton, status:int):void
	{
		if(status == 0)
			item.setState(STATE_NORMAL);
		else if(status == 1)
			item.setState(STATE_FOCUS);
		else
			item.setState(STATE_DISABLE);
	}
}
}
