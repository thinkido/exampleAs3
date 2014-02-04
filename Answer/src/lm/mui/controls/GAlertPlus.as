package lm.mui.controls
{
	import fl.controls.CheckBox;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import game.manager.POPWindowManager;

	public class GAlertPlus extends GAlert
	{
		public static const OK:uint = 0x1;
		public static const CANCEL:uint = 0x2;
		public static const TIMER:uint = 0x4;
		public static const CLOSE:uint = 0X8;
		
		private var checkBox:GCheckBox;
		private var _data:Object;
		
		public function GAlertPlus()
		{
			super();
			createChild();
		}
		
		public static function show($text:String = '', $title:String = '', flags:uint = 0x1, $parent:Sprite = null,closeHandler:Function = null, timeCount:int = 5, modal:Boolean = true):GAlertPlus
		{
			var alert:GAlertPlus = new GAlertPlus();
			alert.create($text,$title, flags, $parent, closeHandler, timeCount, modal);
			POPWindowManager.showAlert(alert,$parent,modal);
			alert.addListener();
			return alert;
		}
		
		private function createChild():void
		{
			this.checkBox = new GCheckBox();
			this.checkBox.addEventListener(Event.CHANGE, changeHandler);
			this.checkBox.styleName = 'CheckBox';
			this.checkBox.move(132,86);
			this.checkBox.label = Language.getKey("5235");
			this.addChild(this.checkBox);
		}
		
		private function changeHandler(event:Event):void
		{
			this.data = this.checkBox.selected;
		}
		
	}
}