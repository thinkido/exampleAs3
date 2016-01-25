package game.view.window
{
	import game.constant.WindowType;
	import game.control.WindowManager;
	import game.util.CommonUtil;
	
	import starling.display.Button;
	
	import ui.UIButton;
	import ui.UIObject;
	import ui.UIWindow;
	
	public class ActivityWindow extends UIWindow
	{
		
		private var _btnTabList:Vector.<Button>;
		
		private var _btnClose:Button;
		
		override public function initUI():void
		{
			_btnClose = getChildByName("btn_close") as Button;
			_btnTabList = new Vector.<Button>;
			for(var i:int = 0; i < 3; i++)
			{
				_btnTabList[i] = getChildByName("btn_tab_" + (i + 1)) as Button;
			}
			_btnClose.setNeighbors(null, _btnTabList[0], null, null);
			for(var i:int = 0; i < 3; i++)
			{
				var pre:int = i - 1;
				if(pre < 0)
					pre += 3;
				var next:int = i + 1;
				if(next >= 3)
					next -= 3;
				_btnTabList[i].setNeighbors(_btnClose, null, _btnTabList[pre], _btnTabList[next]);
			}
			switchFocus(_btnTabList[0]);
		}
		
		override public function onEnter():void
		{
			
		}
		
		override public function onLeave():void
		{
			
		}
		
		override public function onConfirm( target:UIObject):void
		{
			if(_btnClose == target)
			{
				WindowManager.getInstance().closeWindow(this);
			}
			else if(_btnTabList[0] == target)
			{
				WindowManager.getInstance().openWindow(WindowType.WINDOW_GIFT);
			}
			else if(_btnTabList[1] == target)
			{
				WindowManager.getInstance().openWindow(WindowType.WINDOW_COLLECT);
			}
			else if(_btnTabList[2] == target)
			{
				CommonUtil.showPopupWindow(false, "�����ڴ�", null);
			}
		}
	}
}
