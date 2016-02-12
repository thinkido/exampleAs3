package game.view.scene
{
	import com.thinkido.framework.common.observer.Notification;
	
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import game.constant.SceneType;
	import game.constant.WindowType;
	import game.control.AccountManager;
	import game.control.NetManager;
	import game.control.PlaceDataManager;
	import game.control.SceneManager;
	import game.control.WindowManager;
	import game.model.Global;
	import game.model.vo.EnterGameVO;
	import game.model.vo.IpAddressVO;
	import game.model.vo.PlaceData;
	import game.util.CommonUtil;
	import game.view.inline.NoticeBoard;
	
	import network.YiuNetworkListener;
	
	import protocol.hallserver.cs_enter_place;
	import protocol.hallserver.cs_friend_profile;
	import protocol.hallserver.cs_update_places;
	import protocol.hallserver.sc_broadcast_msg;
	import protocol.hallserver.sc_enter_place;
	import protocol.hallserver.sc_enter_place_failed;
	import protocol.hallserver.sc_get_item;
	import protocol.hallserver.sc_hall_debug;
	import protocol.hallserver.sc_update_places;
	
	import starling.display.Button;
	
	import ui.UIButton;
	import ui.UIImageView;
	import ui.UIObject;
	import ui.UIScene;
	import ui.UITextBMFont;
	
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
		
		override public function onEnter():void
		{
			AccountManager.getInstance().registerMsgs(proList ,onNetworkEvent,"HallScene");
			updateUserInfo();
			if(Global.giftVO != null && !Global.giftVO.fetched)
			{
				WindowManager.getInstance().openWindow(WindowType.WINDOW_GIFT);
			}
			try
			{
				var msg:cs_update_places = new cs_update_places();
				msg.noop = 0 ;
				var msgBy:ByteArray = new ByteArray();
				msgBy.endian = Endian.LITTLE_ENDIAN ;
				msg.writeTo( msgBy );
				NetManager.sendProtobuf(Global.socketHall,"cs_update_places", msgBy );
			}
			catch( ex:Error)
			{
				trace("发送协议失败", "LogManager.LEVEL_WARNING");
			}
		}
		
		override public function onLeave():void
		{
			disposePro();
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
		
		override public function initUI():void
		{
			btnUser = getChildByName("btn_user") as Button;
			btnShop = getChildByName("btn_shop") as Button;
			btnActivity = getChildByName("btn_activity") as Button;
			btnRank = getChildByName("btn_rank") as Button;
			btnRule = getChildByName("btn_rule") as Button;
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
			imgHead.setTexture(ResManager.getMyHeadTexture());
			imgTitle.setTexture(ResManager.getMyTitleTexture());
		}
			
		public function disposePro():void{
			AccountManager.getInstance().removeMsgs(proList ,"HallScene");		
		}
		private var proList:Array = ["sc_broadcast_msg",
			"sc_hall_debug",
			"sc_enter_place",
			"sc_get_item",
			"sc_update_places",
			"sc_enter_place_failed"];
		public function onNetworkEvent(e:Notification):void
		{
			var name:String = e.name ;
			var content:ByteArray = e.body as ByteArray ;
			try
			{
				if(name == "sc_broadcast_msg")
				{
					var msg:sc_broadcast_msg = new sc_broadcast_msg() ;
					msg.mergeFrom(content) ;
					NoticeBoard.show(msg.getMsg());
					return false;
				}
				else if(name == "sc_hall_debug")
				{
					var msg1:sc_hall_debug = new sc_hall_debug() ;
					msg1.mergeFrom(content) ;
					trace("debug:" + msg1.getInfo());
					return false;
				}
				else if(name == "sc_enter_place")
				{
					var msg2:sc_enter_place = new sc_enter_place() ;
					msg2.mergeFrom(content) ;
					SceneManager.getInstance().switchScene(SceneType.SCENE_GAME, new EnterGameVO(new IpAddressVO(msg2.host, msg2.port), false));
					return false;
				}
				else if(name == "sc_get_item")
				{
					 var msg3:sc_get_item = new sc_get_item() ;
					msg3.mergeFrom(content) ;
					Global.userDataVO.gold += msg3.gold;
					updateUserInfo();
					var id:String = AccountManager.getInstance().getId();
					var type:String = AccountManager.getInstance().getType();
					var cfp:cs_friend_profile = new cs_friend_profile();
					cfp.id = id ;
					cfp.idtype = type ;
					cfp.why = "myprofile" ;
					var msgBy:ByteArray = new ByteArray();
					msgBy.endian = Endian.LITTLE_ENDIAN ;
					cfp.writeTo( msgBy );
					NetManager.sendProtobuf(Global.socketHall,"cs_friend_profile", msgBy );
					return false;
				}
				else if(name == "sc_update_places")
				{
					try
					{
						var pb:sc_update_places = new sc_update_places() ;
						pb.mergeFrom(content) ;
						PlaceDataManager.getInstance().init(pb.placeInfos );
					}
					catch( e:Error)
					{
						trace("更新场地信息失败", "LogManager.LEVEL_ERROR");
					}
					return false;
				}
				else if(name == "sc_enter_place_failed")
				{
					var msg4:sc_enter_place_failed = new sc_enter_place_failed()
					msg4.mergeFrom(content) ;
					trace("进入游戏失败，错误代码:" + msg4.reason , "LogManager.LEVEL_WARNING");
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
				trace("金币不足1000，不能快速开始", "LogManager.LEVEL_WARNING");
			}
			else
			{
				Global.socketHall.reconnect() ;
				var userId:String = AccountManager.getInstance().getId();
				var userType:String = AccountManager.getInstance().getType();
				Global.socketHall.send(JSON.stringify(["enter_hall",userId,userType,1]));
			}
		}
		
		/** 请求进入某游戏场 */
		private function reqEnterPlace( placeId:String):void
		{
			var placeDataMgr:PlaceDataManager = PlaceDataManager.getInstance();
			var place:PlaceData = placeDataMgr[placeId];
			
			if(place == null)
			{
				trace("对应场次尚未开放", "LogManager.LEVEL_WARNING");
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
				trace("入场需求金币不足", "LogManager.LEVEL_WARNING");
				return;
			}
			try
			{
				var msg:cs_enter_place = new cs_enter_place();
				msg.placeId = placeId ;
				msg.usrKey = "" ;
				var msgBy:ByteArray = new ByteArray();
				msgBy.endian = Endian.LITTLE_ENDIAN ;
				msg.writeTo( msgBy );
				NetManager.sendProtobuf(Global.socketHall,"cs_enter_place", msgBy);
			}
			catch( e:Error)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
			return;
		}
	}
}