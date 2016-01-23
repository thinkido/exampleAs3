package game.view.window;
{
	import framework.consts.KeyType;
	
	import game.control.LogManager;
	import game.control.WindowManager;
	import game.model.Global;
	import game.model.callback.ICallbackB;
	import game.util.CommonUtil;
	
	import starling.display.Button;
	import starling.events.EventDispatcher;
	
	import ui.UIButton;
	import ui.UIObject;
	import ui.UIWindow;
	
	public class GiftWindow extends UIWindow {
		
		private var _btnGiftList:Vector.<Button>;
		
		private var _btnGet:Button;
		
		override protected function initUI():void
		{
			_btnGiftList = new Vector.<Button>;
			for (var i:int = 0; i < 7; i++) {
				_btnGiftList[i] =  getChildByName("btn_gift_" + (i + 1)) as Button;
			}
			_btnGet =  getChildByName("btn_get_gift") as Button;
		}
		
		override public function onEnter():void
		{
			if (Global.giftVO == null) {
				WindowManager.getInstance().closeWindow(this);
				trace("非法礼品VO", "LogManager.LEVEL_ERROR");
			} else {
				for (var i:int = 0; i < 7; i++) {
					if (i < Global.giftVO.day - 1)
						_btnGiftList[i].setState(STATE_DISABLE);
					else if (i == Global.giftVO.day - 1) {
						if (Global.giftVO.fetched)
							_btnGiftList[i].setState(STATE_DISABLE);
						else
							_btnGiftList[i].setState(STATE_FOCUS);
					} else
						_btnGiftList[i].setState(STATE_NORMAL);
				}
				if (Global.giftVO.fetched)
					_btnGet.setState(STATE_DISABLE);
			}
		}
		
		override public function onLeave():void {
			
		}
		
		override protected function onKeyPressed( type:int, dispatcher:EventDispatcher, data:Object):void
		{
				var keyCode:int = int( data);
				switch (keyCode)
				{
					case KeyType.CONFIRM:
						if (!Global.giftVO.fetched) 
						{
							Global.giftVO.fetched = true;
							_btnGiftList[Global.giftVO.day - 1].setState(STATE_DISABLE);
							_btnGet.setState(STATE_DISABLE);
							CommonUtil.showPopupWindow(false, "恭喜,成功领取"
								+ Global.giftVO.gold + "积分", new ICallbackB() {
									public void run(boolean data) {
										close();
									}
								});
						} else {
							close();
						}
						break;
				}
				
			}
		
		public function close():void {
			WindowManager.getInstance().closeWindow(this);
		}
		
		 public function onConfirm( target:UIObject):void {
			
		}
	}
}