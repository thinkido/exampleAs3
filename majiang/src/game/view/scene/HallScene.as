package game.view.scene
{
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
	
	import network.YiuNetworkHandlerMgr;
	import network.YiuNetworkListener;
	
	import starling.display.Button;
	
	import ui.UIImageView;
	import ui.UIObject;
	import ui.UIScene;
	
	public class HallScene extends UIScene implements YiuNetworkListener
	{
		
		// 场次key列表
		private var keyStageList:Vector.<String> = new Vector.<String>();
			
		
		// 用户
		private var btnUser:Button;
		
		// 商城
		private var btnShop:Button;
		
		// 排行榜
		private var btnRank:Button;
		
		// 活动
		private var btnActivity:Button;
		
		// 礼品
		private var btnRule:Button;
		
		// 设置
		private var btnMatch:Button;
		
		// 快速进入
		private var btnQuickStart:Button;
		
		// 场次
		private var btnStageList:Vector.<Button>;
		
		// 头像图片
		private var imgHead:UIImageView;
		
		// 玩家名文本框
		private var bfName:UITextBMFont;
		
		// 玩家称号
		private var imgTitle:UIImageView;
		
		// 玩家金币文本框
		private var bfGold:UITextBMFont;
		
		public function HallScene()
		{
			keyStageList.push("lianxi", "chuji", "zhongji", "gaoji");
		}
		
		public function onEnter():void
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
			catch( ex:Error)
			{
				LogManager.getInstance().log("发送协议失败", LogManager.LEVEL_WARNING);
			}
		}
		
		override public function onLeave():void
		{
			YiuNetworkHandlerMgr.unSubscribe(this);
		}
		
		override public function onDispose():void
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
		
		override public function onConfirm( target:UIObject):void
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
				for(var i:int = 0; i < 4; i++)
				{
					if(btnStageList[i] == target)
					{
						reqEnterPlace(keyStageList[i]);
						break;
					}
				}
			}

		}
		
		public function initUI():void
		{
			btnUser = getChildByName("btn_user") as Button;
			btnShop = getChildByName("btn_shop") as Button;
			btnActivity = getChildByName("btn_activity") as Button;
			btnRank = getChildByName("btn_rank") as Button;;
			btnRule = getChildByName("btn_rule") as Button;;
			btnMatch = getChildByName("btn_match") as Button;
			btnQuickStart = getChildByName("btn_quickstart") as Button;
			imgHead = getChildByName("img_head") as UIImageView;
			
			btnStageList = new UIButton[4];
			for(var i:int = 0; i < 4; i++)
			{
				btnStageList[i] = getChildByName("btn_stage_" + (i + 1)) as Button;
			}
			imgTitle = getChildByName("img_title") as UIImageView;
			
			bfName = getChildByName("bf_name") as UITextBMFont;
			bfGold = getChildByName("bf_gold") as UITextBMFont; 
			bfName.setAnchor(ANCHOR_BOTTOM_LEFT);
			bfGold.setAnchor(ANCHOR_BOTTOM_LEFT);
			
			btnUser.setNeighbors(null, btnStageList[0], btnMatch, btnShop);
			btnShop.setNeighbors(null, btnStageList[0], btnUser, btnRank);
			btnRank.setNeighbors(null, btnStageList[0], btnShop, btnActivity);
			btnActivity.setNeighbors(null, btnStageList[0], btnRank, btnRule);
			btnRule.setNeighbors(null, btnStageList[0], btnActivity, btnMatch);
			btnMatch.setNeighbors(null, btnStageList[0], btnRule, btnUser);
			for(var i:int = 0; i < 4; i++)
			{
				var leftIndex:int = i - 1;
				if(leftIndex < 0)
					leftIndex += 4;
				var rightIndex:int = i + 1;
				if(rightIndex >= 4)
					rightIndex -= 4;
				btnStageList[i].setNeighbors(btnUser, btnQuickStart, btnStageList[leftIndex], btnStageList[rightIndex]);
			}
			
			btnQuickStart.setNeighbors(btnStageList[0], null, null, null);
			
			switchFocus(btnStageList[0]);
		}
		
		public function updateUserInfo():void
		{
			bfName.setText(Global.userDataVO.name);
			bfGold.setText(CommonUtil.formatGold(Global.userDataVO.gold));
			imgHead.setTexture(Global.getMyHeadTexture());
			imgTitle.setTexture(Global.getMyTitleTexture());
		}
		
		public function onNetworkEvent( name:String, content:ByteString):Boolean
		{
			try
			{
				if(name == "sc_broadcast_msg")
				{
					var msg:sc_broadcast_msg = sc_broadcast_msg.parseFrom(content.toByteArray());
					NoticeBoard.show(msg.getMsg());
					return false;
				}
				else if(name == "sc_hall_debug")
				{
					var msg:sc_hall_debug = sc_hall_debug.parseFrom(content.toByteArray());
					LogManager.getInstance().log("debug:" + msg.getInfo());
					return false;
				}
				else if(name == "sc_enter_place")
				{
					var msg:sc_enter_place = sc_enter_place.parseFrom(content.toByteArray());
					SceneManager.getInstance().switchScene(SceneType.SCENE_GAME, new EnterGameVO(new IpAddressVO(msg.getHost(), msg.getPort()), false));
					return false;
				}
				else if(name == "sc_get_item")
				{
					 var msg:sc_get_item = sc_get_item.parseFrom(content.toByteArray());
					Global.userDataVO.gold += msg.getGold();
					updateUserInfo();
					var id:String = AccountManager.getInstance().getId();
					var type:String = AccountManager.getInstance().getType();
					Global.socketHall.sendProtobuf("cs_friend_profile", cs_friend_profile.newBuilder().setId(id).setIdtype(type).setWhy("myprofile").build().toByteArray());
					return false;
				}
				else if(name == "sc_update_places")
				{
					try
					{
						var pb:sc_update_places = sc_update_places.parseFrom(content.toByteArray());
						PlaceDataManager.getInstance().init(pb.getPlace_infos());
					}
					catch( e:Error)
					{
						LogManager.getInstance().log("更新场地信息失败", LogManager.LEVEL_ERROR);
					}
					return false;
				}
				else if(name == "sc_enter_place_failed")
				{
					var msg:sc_enter_place_failed = sc_enter_place_failed.parseFrom(content.toByteArray());
					LogManager.getInstance().log("进入游戏失败，错误代码:" + msg.getReason(), LogManager.LEVEL_WARNING);
					return false;
				}
				return true;
			}
			catch( ex:Error)
			{
				ex.printStackTrace();
				return false;
			}
		}
		
		/** 快速游戏 */
		private function reqQuickStart():void
		{
			if(Global.userDataVO.gold < 1000)
			{
				LogManager.getInstance().log("金币不足1000，不能快速开始", LogManager.LEVEL_WARNING);
			}
			else
			{
				Global.socketHall.reconnect();
				var userId:String = AccountManager.getInstance().getId();
				var userType:String = AccountManager.getInstance().getType();
				Global.socketHall.send(new JSONArray().put("enter_hall").put(userId).put(userType).put(1).toString());
			}
		}
		
		/** 请求进入某游戏场 */
		private function reqEnterPlace( placeId:String):void
		{
			var placeDataMgr:PlaceDataManager = PlaceDataManager.getInstance();
			var place:PlaceData = placeDataMgr.get(placeId);
			
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
			var reqGold:Number = place.reqPlayerGold();
			var curGold:Number = Global.userDataVO.gold;
			if(reqGold > curGold)
			{
				LogManager.getInstance().log("入场需求金币不足", LogManager.LEVEL_WARNING);
				return;
			}
			try
			{
				Global.socketHall.sendProtobuf("cs_enter_place", cs_enter_place.newBuilder().setPlace_id(placeId).setUsr_key("").build().toByteArray());
			}
			catch( e:Error)
			{
				e.printStackTrace();
			}
			return;
		}
	}
}