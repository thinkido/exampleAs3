package game.view.window
{
	import com.thinkido.framework.manager.keyBoard.KeyBoardManager;
	import com.thinkido.framework.manager.keyBoard.KeyCode;
	import com.thinkido.framework.manager.keyBoard.KeyEvent;
	
	import framework.consts.KeyType;
	
	import game.control.WindowManager;
	import game.model.Global;
	import game.util.CommonUtil;
	
	import starling.display.Button;
	import starling.text.TextField;
	
	import ui.UIObject;
	import ui.UIWindow;
	
	public class GiftWindow extends UIWindow {
		
		private var _btnGiftList:Vector.<Button>;
		
		private var _btnGet:Button;
		
		override public function initUI():void
		{
			_btnGiftList = new Vector.<Button>;
			for (var i:int = 0; i < 7; i++) {
				_btnGiftList[i] =  getChildByName("btn_gift_" + (i + 1)) as Button;
			}
			_btnGet =  getChildByName("btn_get_gift") as Button;
			KeyBoardManager.instance.addEventListener(KeyEvent.KEY_DOWN, this.onKeyDownHandler);
			KeyBoardManager.instance.addEventListener(KeyEvent.KEY_UP, this.onKeyUpHandler);
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
//					_btnGet.setState(STATE_DISABLE);
					_btnGet.enabled = false;
			}
		}
		
		override public function onLeave():void {
			
		}
		
		private function onKeyUpHandler(event:KeyEvent):void
		{
			if(event.keyEvent.target is TextField )
			{				
				return;
			}			
			var keycode:int = event.keyEvent.keyCode;
			switch(keycode)
			{
				case KeyCode.Num1:
					
					break;
			}
		}
		
		private function onKeyDownHandler(event:KeyEvent):void
		{
			var keyCode:int = event.keyEvent.keyCode;
			
				switch (keyCode)
				{
					case KeyType.CONFIRM:
						if (!Global.giftVO.fetched) 
						{
							Global.giftVO.fetched = true;
							_btnGiftList[Global.giftVO.day - 1].setState(STATE_DISABLE);
//							_btnGet.setState(STATE_DISABLE);
							_btnGet.enabled = false;
							/*CommonUtil.showPopupWindow(false, "恭喜,成功领取"
								+ Global.giftVO.gold + "积分", new ICallbackB() {
									public void run(boolean data) {
										close();
									}
								});*/
							CommonUtil.showPopupWindow(false, "恭喜,成功领取"
								+ Global.giftVO.gold + "积分", close);
						} else {
							close();
						}
						break;
				}
				
			}

		
		public function close():void {
			WindowManager.getInstance().closeWindow(this);
		}
		
		 override public function onConfirm( target:UIObject):void {
			
		}
	}
}