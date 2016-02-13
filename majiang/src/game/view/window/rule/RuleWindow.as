package game.view.window.rule
{
	import framework.resources.Res;
	
	import game.control.WindowManager;
	
	import managers.ResManager;
	
	import starling.display.Button;
	
	import ui.UIImageView;
	import ui.UIObject;
	import ui.UIWindow;
	
	public class RuleWindow extends UIWindow
	{
		
		private var TAB_LENGTH:int = 4;
		
		private var TYPE_STRING_LIST:Vector.<String> = new Vector.<String>;
		
		private var CONTENT_LEN_LIST:Vector.<int> = new Vector.<int>;
		
		private var _curTab:int;
		
//		private int[] _curIndexList = new int[TAB_LENGTH];
		private var _curIndexList:Vector.<int> = new Vector.<int>;
		
		private var _btnTabList:Vector.<Button> = new Vector.<Button>;
		
		private var _btnClose:Button;
		
		private var _imgContent:UIImageView;
		
		public function RuleWindow():void
		{
			this.TYPE_STRING_LIST.push("aboutus", "rule", "score", "type");
			this.CONTENT_LEN_LIST.push(1, 5, 1, 38);
		}
		
		override public function initUI():void
		{
			_imgContent = getChildByName("img_content") as UIImageView;
//			_imgContent.setAnchor(ANCHOR_CENTER);
			_btnClose = getChildByName("btn_close") as Button; 
			for(var i:int = 0; i < TAB_LENGTH; i++)
			{
				_btnTabList[i] = getChildByName("btn_tab_" + (i + 1)) as Button;
				_curIndexList[i] = 0;
			}
			_curTab = 0;
		}
		
		override public function onEnter():void
		{
			updateTab();
			updateContent();
		}
		
		override public function onLeave():void
		{
			
		}
		
		override public function onConfirm( target:UIObject):void
		{
			if(target == _btnClose)
				WindowManager.getInstance().closeWindow(this);
		}
		
		override public function onMove( dir:int):void
		{
			if(_selected == _btnClose)
			{
				if(dir == DIR_DOWN)
				{
					switchFocus(_btnTabList[_curTab]);
				}
			}
			else
			{
				if(dir == DIR_DOWN)
					goNext();
				else if(dir == DIR_UP)
				{
					if(goPre())
					{
						switchFocus(_btnClose);
					}
				}
				else if(dir == DIR_LEFT)
				{
					goLeft();
				}
				else if(dir == DIR_RIGHT)
				{
					goRight();
				}
			}
		}
		
		override public function onDispose():void
		{
			super.onDispose();
			TYPE_STRING_LIST = null;
			CONTENT_LEN_LIST = null;
			_curIndexList = null;
			_btnTabList = null;
			_btnClose = null;
			_imgContent = null;
		}
		
		private function goPre():Boolean
		{
			if(_curIndexList[_curTab] > 0)
			{
				_curIndexList[_curTab]--;
				updateContent();
				return false;
			}
			else
				return true;
		}
		
		private function goNext():void
		{
			if(_curIndexList[_curTab] < CONTENT_LEN_LIST[_curTab] - 1)
			{
				_curIndexList[_curTab]++;
				updateContent();
			}
		}
		
		private function goRight():void
		{
			_curTab++;
			if(_curTab >= TAB_LENGTH)
				_curTab -= TAB_LENGTH;
			updateTab();
			updateContent();
		}
		
		private function goLeft():void
		{
			_curTab--;
			if(_curTab < 0)
				_curTab += TAB_LENGTH;
			updateTab();
			updateContent();
		}
		
		private function updateTab():void
		{
			for(var i:int = 0; i < TAB_LENGTH; i++)
			{
				var isCur:Boolean = i == _curTab;
				if(isCur)
					switchFocus(_btnTabList[i]);
			}
		}
		
		private function updateContent():void
		{
			var filename:String = "img_txt_" + TYPE_STRING_LIST[_curTab] + "_" + (_curIndexList[_curTab] + 1) + "_png";
			_imgContent.setTexture( ResManager.getFile(filename , Res.TYPE_TEXTURE ) );
			ResManager.release(filename);
		}
		
	}
}
