package game.view.window.user
{
	import com.thinkido.framework.common.observer.Notification;
	
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import framework.consts.EventType;
	import framework.consts.KeyType;
	
	import game.constant.SceneType;
	import game.control.AccountManager;
	import game.control.NetManager;
	import game.control.SceneManager;
	import game.control.WindowManager;
	import game.model.Global;
	import game.util.CommonUtil;
	import game.view.scene.HallScene;
	
	import managers.ResManager;
	
	import network.YiuNetworkListener;
	
	import protocol.hallserver.cs_friend_profile;
	import protocol.hallserver.cs_update_profile;
	import protocol.hallserver.sc_friend_profile;
	import protocol.hallserver.t_friend_data;
	
	import starling.display.Button;
	import starling.events.EventDispatcher;
	
	import ui.UICheckBox;
	import ui.UIImageView;
	import ui.UILayer;
	import ui.UIObject;
	import ui.UITextBMFont;
	import ui.UIWindow;
	
	public class UserWindow extends UIWindow implements YiuNetworkListener
	{
		
		private var _btnClose:Button;
		
		private var _imgHead:UIImageView;
		
		private var _btnHead:Button;
		
		private var _bfName:UITextBMFont;
		
		private var _imgTitle:UIImageView;
		
		private var _bfLevel:UITextBMFont;
		
		private var _ckMale:UICheckBox;
		
		private var _ckFemale:UICheckBox;
		
		private var _bfTicket:UITextBMFont;
		
		private var _bfGold:UITextBMFont;
		
		private var _bfTotalGame:UITextBMFont;
		
		private var _bfContinuousWin:UITextBMFont;
		
		private var _bfWinRate:UITextBMFont;
		
		private var _mediator:UserHeadMediator;
		
		private var _originPortrait:int = 0;
		
		private var _originSex:int;
		
		override public function initUI():void
		{
			_mediator = new UserHeadMediator(getChildByName("layer_user_head") as UILayer);
			_btnClose = getChildByName("btn_close") as Button;
			_imgHead = getChildByName("img_head") as UIImageView;
			_btnHead = getChildByName("btn_head") as Button;
			_bfName = getChildByName("bf_name") as UITextBMFont;
//			_bfName.setAnchor(ANCHOR_BOTTOM_LEFT);
			_imgTitle = getChildByName("img_title") as UIImageView;
			_bfLevel = getChildByName("bf_level") as UITextBMFont;
//			_bfLevel.setAnchor(ANCHOR_BOTTOM_LEFT);
			_ckMale = getChildByName("ck_male") as UICheckBox;
			_ckFemale = getChildByName("ck_female") as UICheckBox;
			_bfTicket = getChildByName("bf_ticket") as UITextBMFont;
//			_bfTicket.setAnchor(ANCHOR_BOTTOM_LEFT);
			_bfGold = getChildByName("bf_gold") as UITextBMFont;
//			_bfGold.setAnchor(ANCHOR_BOTTOM_LEFT);
			_bfTotalGame = getChildByName("bf_total_game") as UITextBMFont;
//			_bfTotalGame.setAnchor(ANCHOR_BOTTOM_LEFT);
			_bfContinuousWin = getChildByName("bf_continuous_win") as UITextBMFont;
//			_bfContinuousWin.setAnchor(ANCHOR_BOTTOM_LEFT);
			_bfWinRate = getChildByName("bf_win_rate") as UITextBMFont;
//			_bfWinRate.setAnchor(ANCHOR_BOTTOM_LEFT);
			
//			_btnClose.setNeighbors(null, _btnHead, null, null);
//			_btnHead.setNeighbors(_btnClose, _ckMale, null, null);
//			_ckMale.setNeighbors(_btnHead, null, _ckFemale, _ckFemale);
//			_ckFemale.setNeighbors(_btnHead, null, _ckMale, _ckMale);
			
			switchFocus(_btnClose);
		}
		
		override public function onEnter():void
		{
			_mediator.setVisible(false);
			_originPortrait = Global.userDataVO.portrait;
			_originSex = Global.userDataVO.sex;
			updatePortrait();
			
			_bfName.setText(Global.userDataVO.name);
			_bfLevel.setText("" + Global.userDataVO.level);
			_imgTitle.setTexture(ResManager.getMyTitleTexture());
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
			
			AccountManager.getInstance().registerMsgs(proList ,onNetworkEvent,"UserWindow");
//			YiuNetworkHandlerMgr.subscribe(this);
			var id:String = AccountManager.getInstance().getId();
			var idtype:String = AccountManager.getInstance().getType();
			try
			{
				var msg:cs_friend_profile = new cs_friend_profile();
				msg.id = id ;
				msg.idtype = idtype ;
				var msgBy:ByteArray = new ByteArray();
				msgBy.endian = Endian.LITTLE_ENDIAN ;
				msg.writeTo( msgBy );
				NetManager.sendProtobuf(Global.socketHall,"cs_friend_profile", msgBy );
			}
			catch( e:Error)
			{
				trace("发送协议失败", "LogManager.LEVEL_ERROR");
			}
		}
		
		private function updatePortrait():void
		{
			_imgHead.setTexture(ResManager.getMyHeadTexture());
		}
		
		override public function onLeave():void
		{
			disposePro();
		}
		
		override public function onConfirm(target:UIObject):void
		{
			if(_btnClose == target)
			{
				WindowManager.getInstance().closeWindow(this);
				if(_originSex != Global.userDataVO.sex || _originPortrait != Global.userDataVO.portrait)
				{
					try
					{
						var msg:cs_update_profile = new cs_update_profile();
						msg.sex = Global.userDataVO.sex ;
						msg.portrait = Global.userDataVO.portrait ;
						var msgBy:ByteArray = new ByteArray();
						msgBy.endian = Endian.LITTLE_ENDIAN ;
						msg.writeTo( msgBy );
						NetManager.sendProtobuf(Global.socketHall,"cs_update_profile", msgBy );
						if(SceneManager.getInstance().getCurSceneType() == SceneType.SCENE_HALL)
							(SceneManager.getInstance().getCurScene() as HallScene).updateUserInfo();
						CommonUtil.showPopupWindow(false, "保存玩家信息成功", null);
					}
					catch( e:Error)
					{
						trace("保存玩家信息失败", "LogManager.LEVEL_ERROR");
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
		public function disposePro():void{
			AccountManager.getInstance().removeMsgs(proList ,"UserWindow");		
		}
		private var proList:Array = ["sc_friend_profile"];
		
		public function onNetworkEvent(e:Notification):void
		{
			var name:String = e.name ;
			var content:ByteArray = e.body as ByteArray ;
			try
			{
				if(name == "sc_friend_profile")
				{
					var msg:sc_friend_profile = new sc_friend_profile() ;
					msg.mergeFrom(content) ;
					var data:t_friend_data = msg.profile ;
					Global.userDataVO.update(data);
					_bfTotalGame.setText("" + Global.userDataVO.getTotalNum());
					// _bfContinuousWin
					_bfWinRate.setText(Global.userDataVO.getWinRate());
				}
			}
			catch( ex:Error)
			{
				ex.printStackTrace();
			}
//			return false;
		}
		
		public function onReciveEvent( type:int, dispatcher:EventDispatcher, data:Object):void
		{
			if(type == EventType.EVENT_KEY_PRESSED && _mediator.getVisible())
			{
				var keyCode:int = int(data);
				if(keyCode >= KeyType.NUM_0 && keyCode <= KeyType.NUM_9)
					choosePortrait(keyCode - KeyType.NUM_0);
			}
			else
				super.onReciveEvent(type, dispatcher, data);
		}
		
		private function showHeadPanel():void
		{
			_mediator.setSex(Global.userDataVO.sex);
			_mediator.setVisible(true);
		}
		
		private function hideHeadPanel():void
		{
			_mediator.setVisible(false);
		}
		
		private function choosePortrait( index:int):void
		{
			if(index > 0)
			{
				Global.userDataVO.portrait = index;
				updatePortrait();
			}
			hideHeadPanel();
		}
	}
}
