package lm.mui.controls
{
	import com.thinkido.framework.manager.keyBoard.KeyBoardManager;
	import com.thinkido.framework.manager.keyBoard.KeyCode;
	import com.thinkido.framework.manager.keyBoard.KeyEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import game.common.GameInstance;
	import game.common.staticdata.SkinClassNameDefine;
	import game.manager.POPWindowManager;
	
	import lm.components.window.WindowEvent;
	import lm.mui.CompCreateFactory;
	import lm.mui.core.GlobalClass;

	public class GAlert extends GUIComponent
	{
		public static const OK:uint = 0x1;
		public static const CANCEL:uint = 0x2;
		public static const TIMER:uint = 0x4;
		public static const CLOSE:uint = 0X8;
//		public static const YES:uint = 0x4;
//		public static const NO:uint = 0x8;
		
		private var _okLabel:String = Language.getKey("3486");
		private var _cancelLabel:String = Language.getKey("4014");
//		private static const yesLabel:String = Language.getKey("5232");
//		private static const noLabel:String = Language.getKey("5233");
		
		private var title:TextField;
		private var msg:TextField;
		private var bg:GImageBitmap; 
		private var closeFunc:Function;
		
		private var dispatcher:DisplayObject = null;
		
		private var _okBtn:GButton;
		private var _cancelBtn:GButton;
		private var _timerBtn:TimeButton;
		private var _closeBtn:GButton;
		
		private var _data:Object;
		
		public function GAlert():void
		{
			init();
		}
		
		private function init():void
		{
			this.width = 367;
			this.height = 160;
			
			bg = new GImageBitmap();
			bg.bitmapData = GlobalClass.getBitmapData("GeneralNoTitleBG");
			bg.scale9Grid = SkinClassNameDefine.GENERALNOTITLEBGRECT;
			bg.width = 367;
			bg.height = 160;
			this.addChild(bg);
			
			var bg2:GImageBitmap = new GImageBitmap();
			bg2.bitmapData = GlobalClass.getBitmapData("GeneralInerBG");
			bg2.scale9Grid = SkinClassNameDefine.GENERALINERBGRECT;
			bg2.width = 348;
			bg2.height = 143;
			bg2.x = 10;
			bg2.y = 8;
			this.addChild(bg2);
			
			var format:TextFormat = new TextFormat(null,12,0x000000);
			title = CompCreateFactory.createTextField(15,10,100,22,format);
//			this.addChild(title);
			msg = CompCreateFactory.createTextField(79,37,217,54,format);
			msg.wordWrap = true;
			msg.multiline = true;
			this.addChild(msg);
		}
		
		/**
		 * 
		 * @param $text
		 * @param $title
		 * @param flags
		 * @param $parent
		 * @param closeHandler
		 * @param timeCount		计时器按钮计时数
		 * @param modal
		 * @return 
		 * 
		 */		
		public static function show($text:String = '', $title:String = '', flags:uint = 0x1, $parent:Sprite = null,closeHandler:Function = null, timeCount:int = 5, modal:Boolean = true):GAlert
		{
			var alert:GAlert = new GAlert();
			alert.create($text,$title, flags, $parent, closeHandler, timeCount, modal);
			POPWindowManager.showAlert(alert,$parent,modal);
			alert.addListener();
			return alert;
		}
		
		protected function addListener():void
		{
			this.stage.addEventListener(MouseEvent.CLICK, stageCLickHandler,true);
			this.stage.addEventListener(MouseEvent.MOUSE_DOWN, stageCLickHandler, true);
			KeyBoardManager.instance.addEventListener(KeyEvent.KEY_DOWN, this.onKeyDown);
		}

		private function onKeyDown(event:KeyEvent):void
		{
			if (event.keyEvent.keyCode == KeyCode.ENTER)
			{
				var type:int;
				if (okBtn)
					type = GAlert.OK;
				else if (timerBtn)
					type = GAlert.TIMER;
				if(dispatcher != null)
				{
					var windowEvent:WindowEvent = new WindowEvent(WindowEvent.CLOSE);
					windowEvent.detail = type;
					windowEvent.data = this._data;
					dispatcher.dispatchEvent(windowEvent);
				}
				close();
			}
		}
		
		private function stageCLickHandler(event:MouseEvent):void
		{
			var rect:Rectangle = this.getBounds(this.stage);
			if(event.stageX && !rect.contains(event.stageX, event.stageY))
			{
				event.stopPropagation();
			}
		}
		
		private function removeListener():void
		{
			this.stage.removeEventListener(MouseEvent.CLICK, stageCLickHandler,true);
			this.stage.removeEventListener(MouseEvent.MOUSE_DOWN, stageCLickHandler, true);
		}
		
		protected function create($text:String = '', $title:String = '', flags:uint = 0x1, $parent:Sprite = null,closeHandler:Function = null, timeCount:int = 5, modal:Boolean = false):void
		{
			var flagArr:Array = byteToArray(flags);
			
			if(!isAvailable(flagArr)){
				throw new Error(Language.getKey("5234"));
			}
			
			title.text = $title;
			msg.htmlText = $text;
			createBtns(flagArr,timeCount);
			
			if(closeHandler != null)
			{
				this.closeFunc = closeHandler;
				dispatcher = $parent == null ?  GameInstance.app : $parent;
				dispatcher.addEventListener(WindowEvent.CLOSE, this.closeFunc);
			}
		}
		
		private function isAvailable(flagArr:Array):Boolean
		{
			if(flagArr[0] == flagArr[1] && flagArr[0] == flagArr[2])
			{
				return false;
			}
			if(flagArr[0] && flagArr[2])
			{
				return false;
			}
			return true;
		}
		
		/**
		 * @param type flagArr[0] okBtn, flagArr[1] cancelBtn, flagArr[2] TimerBtn,  
		 */		
		private function createBtns(flagArr:Array,timeCount:int = 5):void
		{
			if(flagArr[0] == 1)
			{
				this._okBtn = new GButton();
				this._okBtn.width = 70;
				this._okBtn.styleName = 'GButton';
				this._okBtn.label = this._okLabel;
				this._okBtn.addEventListener(MouseEvent.CLICK,btnClickHandler);
				this.addChild(this._okBtn);
			}
			
			if(flagArr[1] == 1)
			{
				this._cancelBtn = new GButton();
				this._cancelBtn.width = 70;
				this._cancelBtn.styleName = 'GButton';
				this._cancelBtn.label = this._cancelLabel;
				this._cancelBtn.addEventListener(MouseEvent.CLICK,btnClickHandler);
				this.addChild(this._cancelBtn);
			}
			
			if(flagArr[2] == 1)
			{
				this._timerBtn = new TimeButton(timeCount,false);
				this._timerBtn.width = 70;
				this._timerBtn.styleName = 'GButton';
				this._timerBtn.addEventListener(MouseEvent.CLICK,btnClickHandler);
				this._timerBtn.addEventListener(TimeButton.TIME_OVER, timeOverHandler);
				this._timerBtn.tog = true;
				this.addChild(this._timerBtn);
			}
			if(flagArr[3] == 1)
			{
				this._closeBtn = new GButton();
				this._closeBtn.styleName = 'CloseBtn';
				this._closeBtn.label = '';
				this._closeBtn.addEventListener(MouseEvent.CLICK,btnClickHandler);
				this._closeBtn.setSize(18,18);
				this._closeBtn.x = this.width - this._closeBtn.width - 27;
				this._closeBtn.y = 27;
				this.addChild(this._closeBtn);
			}
			resetPosition();
		}
		
		private function timeOverHandler(event:Event):void
		{
			if(this.stage != null)
			{
//				this._timerBtn.addEventListener(MouseEvent.CLICK,btnClickHandler);
				this._timerBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			}
		}
		
		private function resetPosition():void
		{
			if(this._cancelBtn != null)
			{
				if(this._okBtn != null)
				{
					this._okBtn.x = (this.width - this._okBtn.width) / 2 - 50;
					this._okBtn.y = this.height - 45;
				}
				else if(this._timerBtn != null)
				{
					this._timerBtn.x = (this.width - this._timerBtn.width) / 2 - 50;
					this._timerBtn.y = this.height - 45;
				}
				this._cancelBtn.x = (this.width - this._cancelBtn.width) / 2 + 50;
				this._cancelBtn.y = this.height - 45;
			}
			else if(this.okBtn != null)
			{
				this._okBtn.x = (this.width - this._okBtn.width) / 2;
				this._okBtn.y = this.height - 45;
			}
			else if(this._timerBtn != null)
			{
				this._timerBtn.x = (this.width - this._timerBtn.width) / 2;
				this._timerBtn.y = this.height - 45;
			}
		}
		
		private function btnClickHandler(event:MouseEvent):void
		{
			var btn:GButton = event.target as GButton;
			var type:int;
			switch(btn)
			{
				case this._okBtn:
					type = GAlert.OK;
					break;
				case this._cancelBtn:
					type = GAlert.CANCEL;
					break;
				case this._timerBtn:
					type = GAlert.TIMER;
					break;
				case this._closeBtn:
					type = GAlert.CLOSE;
					break;
			}
			if(dispatcher != null)
			{
				var windowEvent:WindowEvent = new WindowEvent(WindowEvent.CLOSE);
				windowEvent.detail = type;
				windowEvent.data = this._data;
				dispatcher.dispatchEvent(windowEvent);
			}
			close();
		}
		
		public function close():void
		{
			KeyBoardManager.instance.removeEventListener(KeyEvent.KEY_DOWN, this.onKeyDown);
			if(this.closeFunc != null)
			{
				dispatcher.removeEventListener(WindowEvent.CLOSE, this.closeFunc);
				this.closeFunc = null;
				dispatcher = null;
			}
			this.removeListener();
			POPWindowManager.showAlert(this);
			GameInstance.stage.focus = GameInstance.stage ;
//			this.parent.removeChild(this);
		}
		
		private function byteToArray(flags:uint):Array
		{
			var arr:Array = [];
			arr.push(flags & 1);
			arr.push((flags & 2) >> 1);
			arr.push((flags & 4) >> 2);
			arr.push((flags & 8) >> 3);
			return arr;
		}
		
		public function get okBtn():GButton
		{
			return this._okBtn;
		}
		
		public function get cancelBtn():GButton
		{
			return this._cancelBtn;
		}
		
		public function get timerBtn():TimeButton
		{
			return this._timerBtn;
		}
		
		public function get data():Object
		{
			return this._data;
		}
		
		public function set data(value:Object):void
		{
			this._data = value;
		}
	}
}