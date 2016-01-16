
package game.view.scene;

import game.constant.SceneType;
import game.constant.WindowType;
import game.control.AccountManager;
import game.control.LogManager;
import game.control.PlaceDataManager;
import game.control.SceneManager;
import game.control.WindowManager;
import game.model.Global;
import game.model.vo.EnterGameVO;
import game.model.vo.IpAddressVO;
import game.model.vo.PlaceData;
import game.util.CommonUtil;
import game.view.inline.NoticeBoard;
import net.jarlehansen.protobuf.javame.ByteString;
import network.YiuNetworkHandlerMgr;
import network.YiuNetworkListener;

import org.json.me.JSONArray;

import protocol.cs_enter_place;
import protocol.cs_friend_profile;
import protocol.cs_update_places;
import protocol.sc_broadcast_msg;
import protocol.sc_enter_place;
import protocol.sc_enter_place_failed;
import protocol.sc_get_item;
import protocol.sc_hall_debug;
import protocol.sc_update_places;
import ui.UIButton;
import ui.UIImageView;
import ui.UIObject;
import ui.UIScene;
import ui.UITextBMFont;

public class HallScene extends UIScene implements YiuNetworkListener
{

	// 场次key列表
	private String[] keyStageList = new String[]{"lianxi", "chuji", "zhongji", "gaoji"};

	// 用户
	private UIButton btnUser;

	// 商城
	private UIButton btnShop;

	// 排行榜
	private UIButton btnRank;

	// 活动
	private UIButton btnActivity;

	// 礼品
	private UIButton btnRule;

	// 设置
	private UIButton btnMatch;

	// 快速进入
	private UIButton btnQuickStart;

	// 场次
	private UIButton[] btnStageList;

	// 头像图片
	private UIImageView imgHead;

	// 玩家名文本框
	private UITextBMFont bfName;

	// 玩家称号
	private UIImageView imgTitle;

	// 玩家金币文本框
	private UITextBMFont bfGold;

	public HallScene()
	{
	}

	public void onEnter()
	{
		YiuNetworkHandlerMgr.subscribe(this);
		updateUserInfo();
		if(Global.giftVO != null && !Global.giftVO.fetched)
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_GIFT);
		}
		try
		{
			Global.socketHall.sendProtobuf("cs_update_places", cs_update_places.newBuilder().setNoop(0).build().toByteArray());
		}
		catch(Exception ex)
		{
			LogManager.getInstance().log("发送协议失败", LogManager.LEVEL_WARNING);
		}
	}

	public void onLeave()
	{
		YiuNetworkHandlerMgr.unSubscribe(this);
	}

	public void onDispose()
	{
		keyStageList = null;
		btnShop = null;
		btnRank = null;
		btnActivity = null;
		btnRule = null;
		btnMatch = null;
		btnQuickStart = null;
		btnStageList = null;
		imgHead = null;
		bfName = null;
		imgTitle = null;
		bfGold = null;
		super.onDispose();
	}

	public void onConfirm(UIObject target)
	{
		if(target == btnUser)
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_USER);
		}
		else if(target == btnShop)
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_SHOP);
		}
		else if(target == btnRank)
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_RANK);
		}
		else if(target == btnActivity)
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_ACTIVITY);
		}
		else if(target == btnRule)
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_RULE);
		}
		else if(target == btnMatch)
		{
			CommonUtil.showPopupWindow(false, "即将到来，敬请期待", null);
		}
		else if(target == btnQuickStart)
		{
			reqQuickStart();
		}
		else
		{
			for(int i = 0; i < 4; i++)
			{
				if(btnStageList[i] == target)
				{
					reqEnterPlace(keyStageList[i]);
					break;
				}
			}
		}
	}

	public void initUI()
	{
		btnUser = (UIButton)getChildByName("btn_user");
		btnShop = (UIButton)getChildByName("btn_shop");
		btnActivity = (UIButton)getChildByName("btn_activity");
		btnRank = (UIButton)getChildByName("btn_rank");
		btnRule = (UIButton)getChildByName("btn_rule");
		btnMatch = (UIButton)getChildByName("btn_match");
		btnQuickStart = (UIButton)getChildByName("btn_quickstart");
		imgHead = (UIImageView)getChildByName("img_head");

		btnStageList = new UIButton[4];
		for(int i = 0; i < 4; i++)
		{
			btnStageList[i] = (UIButton)getChildByName("btn_stage_" + (i + 1));
		}
		imgTitle = (UIImageView)getChildByName("img_title");

		bfName = (UITextBMFont)getChildByName("bf_name");
		bfGold = (UITextBMFont)getChildByName("bf_gold");
		bfName.setAnchor(ANCHOR_BOTTOM_LEFT);
		bfGold.setAnchor(ANCHOR_BOTTOM_LEFT);

		btnUser.setNeighbors(null, btnStageList[0], btnMatch, btnShop);
		btnShop.setNeighbors(null, btnStageList[0], btnUser, btnRank);
		btnRank.setNeighbors(null, btnStageList[0], btnShop, btnActivity);
		btnActivity.setNeighbors(null, btnStageList[0], btnRank, btnRule);
		btnRule.setNeighbors(null, btnStageList[0], btnActivity, btnMatch);
		btnMatch.setNeighbors(null, btnStageList[0], btnRule, btnUser);
		for(int i = 0; i < 4; i++)
		{
			int leftIndex = i - 1;
			if(leftIndex < 0)
				leftIndex += 4;
			int rightIndex = i + 1;
			if(rightIndex >= 4)
				rightIndex -= 4;
			btnStageList[i].setNeighbors(btnUser, btnQuickStart, btnStageList[leftIndex], btnStageList[rightIndex]);
		}

		btnQuickStart.setNeighbors(btnStageList[0], null, null, null);

		switchFocus(btnStageList[0]);
	}

	public void updateUserInfo()
	{
		bfName.setText(Global.userDataVO.name);
		bfGold.setText(CommonUtil.formatGold(Global.userDataVO.gold));
		imgHead.setTexture(Global.getMyHeadTexture());
		imgTitle.setTexture(Global.getMyTitleTexture());
	}

	public boolean onNetworkEvent(String name, ByteString content)
	{
		try
		{
			if(name.equals("sc_broadcast_msg"))
			{
				sc_broadcast_msg msg = sc_broadcast_msg.parseFrom(content.toByteArray());
				NoticeBoard.show(msg.getMsg());
				return false;
			}
			else if(name.equals("sc_hall_debug"))
			{
				sc_hall_debug msg = sc_hall_debug.parseFrom(content.toByteArray());
				LogManager.getInstance().log("debug:" + msg.getInfo());
				return false;
			}
			else if(name.equals("sc_enter_place"))
			{
				sc_enter_place msg = sc_enter_place.parseFrom(content.toByteArray());
				SceneManager.getInstance().switchScene(SceneType.SCENE_GAME, new EnterGameVO(new IpAddressVO(msg.getHost(), msg.getPort()), false));
				return false;
			}
			else if(name.equals("sc_get_item"))
			{
				sc_get_item msg = sc_get_item.parseFrom(content.toByteArray());
				Global.userDataVO.gold += msg.getGold();
				updateUserInfo();
				String id = AccountManager.getInstance().getId();
				String type = AccountManager.getInstance().getType();
				Global.socketHall.sendProtobuf("cs_friend_profile", cs_friend_profile.newBuilder().setId(id).setIdtype(type).setWhy("myprofile").build().toByteArray());
				return false;
			}
			else if(name.equals("sc_update_places"))
			{
				try
				{
					sc_update_places pb = sc_update_places.parseFrom(content.toByteArray());
					PlaceDataManager.getInstance().init(pb.getPlace_infos());
				}
				catch(Exception e)
				{
					LogManager.getInstance().log("更新场地信息失败", LogManager.LEVEL_ERROR);
				}
				return false;
			}
			else if(name.equals("sc_enter_place_failed"))
			{
				sc_enter_place_failed msg = sc_enter_place_failed.parseFrom(content.toByteArray());
				LogManager.getInstance().log("进入游戏失败，错误代码:" + msg.getReason(), LogManager.LEVEL_WARNING);
				return false;
			}
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}

	/** 快速游戏 */
	private void reqQuickStart()
	{
		if(Global.userDataVO.gold < 1000)
		{
			LogManager.getInstance().log("金币不足1000，不能快速开始", LogManager.LEVEL_WARNING);
		}
		else
		{
			Global.socketHall.reconnect();
			String userId = AccountManager.getInstance().getId();
			String userType = AccountManager.getInstance().getType();
			Global.socketHall.send(new JSONArray().put("enter_hall").put(userId).put(userType).put(1).toString());
		}
	}

	/** 请求进入某游戏场 */
	private void reqEnterPlace(String placeId)
	{
		PlaceDataManager placeDataMgr = PlaceDataManager.getInstance();
		PlaceData place = placeDataMgr.get(placeId);

		if(place == null)
		{
			LogManager.getInstance().log("对应场次尚未开放", LogManager.LEVEL_WARNING);
			return;
		}
		// if (place.canEnter() == false) {
		// // 服务器不让进
		// WindowManager.openWindow(WindowManager.WINDOW_POP_UP, new
		// PopupDataVo(PopupDataVo.TYPE_ENSURE,
		// null, new String[]{"对应场次尚未开放."}));
		// return;
		// }
		long reqGold = place.reqPlayerGold();
		long curGold = Global.userDataVO.gold;
		if(reqGold > curGold)
		{
			LogManager.getInstance().log("入场需求金币不足", LogManager.LEVEL_WARNING);
			return;
		}
		try
		{
			Global.socketHall.sendProtobuf("cs_enter_place", cs_enter_place.newBuilder().setPlace_id(placeId).setUsr_key("").build().toByteArray());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return;
	}
}
