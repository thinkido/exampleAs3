package app.answer.manager
{
	import app.answer.common.GameConfig;
	import app.answer.common.GameInstance;
	import app.answer.manager.layer.LayerManager;
	
	import com.greensock.TweenLite;
	import com.thinkido.framework.common.timer.vo.TimerData;
	import com.thinkido.framework.engine.graphics.tagger.AttackFace;
	import com.thinkido.framework.manager.TimerManager;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import game.common.globle.FilterConst;
	import game.common.ui.componets.NotifyTextField;
	import game.common.ui.componets.RollText;

	/**
	 * TopTipManager 滚动字幕
	 * 用letterContainer 装字符
	 * @author	
	 * @version 20111008
	 */
	public class TopTipManager
	{
		private var _tipContainer:Object;
		private var _txtTipContainer:Object;
		private var _enterSceneTf:TextField;
		private var _enterSceneImg:Bitmap ;
		private var _enterSceneTD:TimerData;
		private var system_roll_box:Sprite;
		private var system_roll_box_mask:Shape;
		private var system_switch_box:Sprite;
		private var char_foot_box:Sprite;
		private var center_box:Sprite;
		private var acheAry:Array;
		private var aloneRunning:Boolean = false ;
		private var isRunning:Boolean = false;
		private static var _instance:TopTipManager;
		private static var filter_enterScene:Array = [new GlowFilter(3591, 1, 6, 6, 2, BitmapFilterQuality.LOW)];
		private static const SYSTEM_ROLL_SPEED:Number = 0.55;
		private static const SYSTEM_ROLL_WIDTH_SCALE:Number = 0.55;
		private static const SYSTEM_ROLL_WIDTH_MIN:Number = 500;
		private static const SYSTEM_ROLL_U:Number = 0.5;
		private static const SYSTEM_ROLL_V:Number = 0.12;
		private static const SYSTEM_SWITCH_NUM:int = 5;
		private static const SYSTEM_SWITCH_ONE_HEIGHT:int = 26;
		private static const SYSTEM_SWITCH_ONE_TIME:Number = 1.5;
		private static const SYSTEM_SWITCH_ONE_SWITCH_TIME1:Number = 0.2;
		private static const SYSTEM_SWITCH_ONE_SWITCH_TIME2:Number = 1;
		private static const SYSTEM_SWITCH_ONE_SWITCH_DIS:Number = 20;
		private static const SYSTEM_SWITCH_U:Number = 0.5;
		private static const SYSTEM_SWITCH_V:Number = 0.25;
		private static var filter_systemSwitch:Array = [new GlowFilter(3591, 1, 4, 4, 4, BitmapFilterQuality.LOW)];
		private static const CHAR_FOOT_TIME:Number = 5;
		private static const CHAR_FOOT_DIS:Number = 100;
		private static const CHAR_FOOT_U:Number = 0.55;
		private static const CHAR_FOOT_V:Number = 0.55;
		private static var filter_char:Array = [new GlowFilter(3591, 1, 4, 4, 4, BitmapFilterQuality.LOW)];
		private static const CENTER_TIME:Number = 1.8;
		private static const CENTER_TIME1:Number = 0.4;
		private static const CENTER_TIME2:Number = 0.8;
		private static const CENTER_U:Number = 0.5;
		private static const CENTER_V:Number = 0.5;
		private static var filter_center:Array = [new GlowFilter(3591, 1, 4, 4, 4, BitmapFilterQuality.LOW)];
		
		
		public function TopTipManager()
		{
			this._tipContainer = new Object();
			this._txtTipContainer = new Object();
			this._enterSceneTf = new TextField();
			this.acheAry = [];
			this._enterSceneTf.autoSize = TextFieldAutoSize.LEFT;
			this._enterSceneTf.mouseEnabled = false;
			this._enterSceneTf.filters = filter_enterScene;
			var defaultTf:TextFormat = new TextFormat();
			defaultTf.size = 35;
			defaultTf.bold = true;
			defaultTf.color = 11992832;
			this._enterSceneTf.defaultTextFormat = defaultTf;
			this.system_roll_box = new Sprite();
			this.system_roll_box.mouseEnabled = false;
			this.system_roll_box.mouseChildren = true;
			this.system_roll_box_mask = new Shape();
			this.system_roll_box.mask = this.system_roll_box_mask;
			this.system_switch_box = new Sprite();
			this.system_switch_box.mouseEnabled = false;
			this.system_switch_box.mouseChildren = false;
			this.char_foot_box = new Sprite();
			this.char_foot_box.mouseEnabled = false;
			this.char_foot_box.mouseChildren = false;
			this.center_box = new Sprite();
			this.center_box.mouseEnabled = false;
			this.center_box.mouseChildren = false;
			return;
		}
		
		private function SceneImgLoadCom(evt:Event):void
		{
			var delay:Number;
			var tt:Number;
			var onUpdate:Function;
			this.removeEnterSceneImg();
			var temp:Bitmap = Loader(evt.target.loader).content as Bitmap ;
			_enterSceneImg = new Bitmap(temp.bitmapData);
			Loader(evt.target.loader).unload() ;
			onUpdate = function (param1:Number) : void
			{
				if (param1 < tt)
				{
					_enterSceneImg.alpha = param1 / tt;
				}
				else if (param1 > delay + tt)
				{
					_enterSceneImg.alpha = (tt - (param1 - delay - tt)) / tt;
				}
				else
				{
					_enterSceneImg.alpha = 1;
				}
				return;
			}
			;
			var id:String = "map_name";
			var scaleX:* = 0.5;
			var scaleY:* = 0.1;
			delay = 4;
			tt = 0.7;
			_enterSceneImg.alpha = 0;
			this._enterSceneImg.x = 100 ;
			this._enterSceneImg.y = int((GameInstance.stage.stageHeight - _enterSceneImg.height) / 2) ;
			this._txtTipContainer[id] = [this._enterSceneImg , scaleX, scaleY];
			LayerManager.effectLayer.addChild(this._enterSceneImg);
			var duration:Number = delay + tt * 2;
			var from:Number = 0;
			var to:Number = duration;
			this._enterSceneTD = TimerManager.createExactTimer(duration, from, to, onUpdate, this.removeEnterSceneImg);
		}			
			
		/**
		 *
		 *  进入场景字幕
		 * @param enterString 字幕字符串
		 * 
		 */		
		public function addEnterSceneTip(sceneStr:String) : void
		{
			var delay:Number;
			var tt:Number;
			var onUpdate:Function;
			var toText:String = sceneStr;
			onUpdate = function (param1:Number) : void
			{
				if (param1 < tt)
				{
					_enterSceneTf.alpha = param1 / tt;
				}
				else if (param1 > delay + tt)
				{
					_enterSceneTf.alpha = (tt - (param1 - delay - tt)) / tt;
				}
				else
				{
					_enterSceneTf.alpha = 1;
				}
				return;
			}
				;
			this.removeEnterSceneTip();
			var id:String = "map_name";
			var scaleX:* = 0.5;
			var scaleY:* = 0.1;
			delay = 4;
			tt = 0.7;
			this._enterSceneTf.alpha = 0;
			this._enterSceneTf.text = toText;
			this._enterSceneTf.x = GameInstance.stage.stageWidth * scaleX - this._enterSceneTf.width * 0.5;
			this._enterSceneTf.y = GameInstance.stage.stageHeight * scaleY;
			this._txtTipContainer[id] = [this._enterSceneTf, scaleX, scaleY];
			LayerManager.msgTipLayer.addChild(this._enterSceneTf);
			var duration:Number = delay + tt * 2;
			var from:Number = 0;
			var to:Number = duration;
			this._enterSceneTD = TimerManager.createExactTimer(duration, from, to, onUpdate, this.removeEnterSceneTip);
			return;
		}
		
		/**
		 * 删除进入场景字幕
		 * 
		 */		
		public function removeEnterSceneTip() : void
		{
			if (this._enterSceneTD != null)
			{
				TimerManager.deleteTimer(this._enterSceneTD);
				this._enterSceneTD = null;
			}
			if (this._enterSceneTf.parent != null)
			{
				this._enterSceneTf.parent.removeChild(this._enterSceneTf);
			}
			delete this._txtTipContainer["map_name"];
			return;
		}
		/**
		 * 删除进入场景文字图片
		 * 
		 */		
		public function removeEnterSceneImg() : void
		{
			if ( this._enterSceneTD != null )
			{
				TimerManager.deleteTimer(this._enterSceneTD);
				this._enterSceneTD = null;
			}
			if (_enterSceneImg != null && this._enterSceneImg.parent != null)
			{
				this._enterSceneImg.parent.removeChild(this._enterSceneImg);
				_enterSceneImg.bitmapData.dispose() ;
			}
			delete this._txtTipContainer["map_name"];
			return;
		}
		
		/**
		 * 
		 * 滚动字幕区域
		 * @param rollWidth 区域宽度 
		 * 
		 */		
		private function setSystemRollAreaBg(rollWidth:Number) : void
		{
			this.system_roll_box.graphics.clear();
			this.system_roll_box.graphics.beginFill(0, 0.3);
			this.system_roll_box.graphics.drawRect(0, 0, rollWidth, 20);
			this.system_roll_box.graphics.endFill();
			this.system_roll_box_mask.graphics.clear();
			this.system_roll_box_mask.graphics.beginFill(0, 1);
			this.system_roll_box_mask.graphics.drawRect(0, 0, rollWidth, 20);
			this.system_roll_box_mask.graphics.endFill();
			return;
		}
		
		/**
		 * 
		 * 系统水平滚动字幕
		 * @param showStr 显示字符串
		 * @param maxCount 最大显示行数
		 * 
		 */		
		public function addSystemRollTip(showStr:String, maxCount:int = 1) : void
		{
			var rollWidth:Number;
			var showString:String = showStr;
			var showCount:int = maxCount;
			if (!RollText.hasInit())
			{
				var onComplete:Function = function () : void
				{
					if (system_roll_box.parent != null)
					{
						system_roll_box.parent.removeChild(system_roll_box);
					}
					if (system_roll_box_mask.parent != null)
					{
						system_roll_box_mask.parent.removeChild(system_roll_box_mask);
					}
					return;
				}
					;
				rollWidth = SYSTEM_ROLL_WIDTH_MIN;
				this.setSystemRollAreaBg(rollWidth);
				RollText.init(this.system_roll_box, rollWidth, 0, 5, SYSTEM_ROLL_SPEED, 10, onComplete);
				RollText.resetMaxWidth(rollWidth);
			}
			if (this.system_roll_box.parent != LayerManager.msgTipLayer)
			{
				rollWidth = SYSTEM_ROLL_WIDTH_MIN;
				this.system_roll_box.x = GameInstance.stage.stageWidth * SYSTEM_ROLL_U - rollWidth / 2;
				this.system_roll_box.y = GameInstance.stage.stageHeight * SYSTEM_ROLL_V;
				this.system_roll_box_mask.x = GameInstance.stage.stageWidth * SYSTEM_ROLL_U - rollWidth / 2;
				this.system_roll_box_mask.y = GameInstance.stage.stageHeight * SYSTEM_ROLL_V;
				LayerManager.msgTipLayer.addChild(this.system_roll_box);
				LayerManager.msgTipLayer.addChild(this.system_roll_box_mask);
			}
			RollText.pushText(showString, showCount);
			return;
		}
		
		private var systemSwitchTfLastStr:String = "" ;
		/**
		 *	向上滚动字幕
		 * @param switchStr 开关字符串
		 * 
		 */		
		public function addSystemSwitchTip(switchStr:String) : void
		{
			var systemSwitchTf:TextField;
			var oldNumChildren:int;
			var delay:Number;
			var tt1:Number;
			var tt2:Number;
			var dis:Number;
			var onUpdate:Function;
			var onComplete:Function;
			var dobj:DisplayObject;
			var toText:String = switchStr;
			if( systemSwitchTfLastStr == toText){
				return ;
			}
			onUpdate = function (param1:Number) : void
			{
				if (param1 < tt1)
				{
					if (oldNumChildren == 0)
					{
						if (system_switch_box.numChildren == 1)
						{
							systemSwitchTf.y = (-dis) * (param1 / tt1);
						}
						systemSwitchTf.alpha = param1 / tt1;
					}
				}
				else if (param1 > delay + tt1)
				{
					systemSwitchTf.alpha = (tt2 - (param1 - delay - tt1)) / tt2;
				}
				else
				{
					systemSwitchTf.alpha = 1;
				}
				return;
			}
				;
			onComplete = function () : void
			{
				if( systemSwitchTfLastStr == systemSwitchTf.name){
					systemSwitchTfLastStr = "" ;
				}
				if (systemSwitchTf.parent != null)
				{
					systemSwitchTf.parent.removeChild(systemSwitchTf);
				}
				if (system_switch_box.numChildren == 0)
				{
					if (system_switch_box.parent != null)
					{
						system_switch_box.parent.removeChild(system_switch_box);
					}
				}
				else
				{
					resizeSystemSwitch();
				}
				return;
			}
				;
			systemSwitchTf = new TextField();
			systemSwitchTf.autoSize = TextFieldAutoSize.LEFT;
			systemSwitchTf.mouseEnabled = false;
			systemSwitchTf.filters = filter_systemSwitch;
			var systemSwitchTFormat:TextFormat = new TextFormat();
			systemSwitchTFormat.size = 20;
			systemSwitchTFormat.font = "宋体" ;
			systemSwitchTFormat.bold = true;
			systemSwitchTFormat.color = 0xffff00 ; ;
			systemSwitchTf.defaultTextFormat = systemSwitchTFormat;
			systemSwitchTf.htmlText = toText;
			systemSwitchTf.x = (-systemSwitchTf.width) / 2;
			systemSwitchTf.name = toText ;
			oldNumChildren = this.system_switch_box.numChildren;
			systemSwitchTfLastStr = toText ;
			if (oldNumChildren == 0)
			{
				systemSwitchTf.y = SYSTEM_SWITCH_ONE_SWITCH_DIS;
				systemSwitchTf.alpha = 0;
				this.system_switch_box.addChild(systemSwitchTf);
				this.system_switch_box.x = GameInstance.stage.stageWidth * SYSTEM_SWITCH_U;
//				this.system_switch_box.y = GameInstance.stage.stageHeight * SYSTEM_SWITCH_V;
				this.system_switch_box.y = 235 ;
				LayerManager.msgTipLayer.addChild(this.system_switch_box);
			}
			else
			{
				if (oldNumChildren >= SYSTEM_SWITCH_NUM)
				{
					dobj = this.system_switch_box.removeChildAt(0);
					TweenLite.killTweensOf(dobj);
				}
				this.system_switch_box.addChild(systemSwitchTf);
				this.resizeSystemSwitch();
			}
			var oldWidth:Number = systemSwitchTf.width;
			systemSwitchTf.scaleX = 2;
			systemSwitchTf.scaleY = 2;
			systemSwitchTf.x -= oldWidth >> 1;
			delay = SYSTEM_SWITCH_ONE_TIME;
			tt1 = SYSTEM_SWITCH_ONE_SWITCH_TIME1;
			tt2 = SYSTEM_SWITCH_ONE_SWITCH_TIME2;
			dis = SYSTEM_SWITCH_ONE_SWITCH_DIS;
			var duration:Number = delay + tt1 + tt2;
			var from:Number;
			var to:Number = duration;
			TimerManager.createOneOffExactTimer(duration, from, to, onUpdate, onComplete);
			TweenLite.to(systemSwitchTf,0.3,{scaleX:1, scaleY:1,x:-oldWidth>>1});
			return;
		}
		
		
		public function addSyTweenLiteTip(str:String):void
		{
			var tweenTf:TextField = new TextField();
			tweenTf.autoSize = TextFieldAutoSize.LEFT;
			tweenTf.mouseEnabled = false;
			tweenTf.filters = filter_systemSwitch;
			var systemSwitchTFormat:TextFormat = new TextFormat();
			systemSwitchTFormat.size = 20;
			systemSwitchTFormat.font = "宋体";
			systemSwitchTFormat.bold = true;
			systemSwitchTFormat.color = 0xffff00 ; ;
			tweenTf.defaultTextFormat = systemSwitchTFormat;
			tweenTf.htmlText = str;
			tweenTf.y = GameConfig.sceneHeight / 2;
			tweenTf.x = (GameConfig.sceneWidth - tweenTf.width) / 2;
//			tweenTf.name = str;
//			tweenTf = this.system_switch_box.numChildren;
			var onComplete:Function = function(tf:TextField):void
			{
				
			}
			
			TweenLite.to(tweenTf, 2, {y:tweenTf.y - 230, alpha:0,onComplete:onComplete,onCompleteParams:[tweenTf] });
		}
		
		
		/**
		 *调整开关字幕大小、位置 
		 * 
		 */		
		private function resizeSystemSwitch() : void
		{
			var tf:TextField = null;
			var len:int = this.system_switch_box.numChildren;
			var index:int = len - 1;
			while (index >= 0)
			{
				tf = this.system_switch_box.getChildAt(index) as TextField;
				tf.y = (-((len - 1) - index)) * SYSTEM_SWITCH_ONE_HEIGHT;
				index = index - 1;
			}
			return;
		}
		/**
		 * 文字从脚底逐渐向上移动，消失 
		 * @param charStr
		 * 
		 */		
		public function addCharFootTip(charStr:String) : void
		{
			var charTf:TextField;
			var dis:Number;
			var to:Number;
			var onUpdate:Function;
			var onComplete:Function;
			var toText:String = charStr;
			onUpdate = function (param1:Number) : void
			{
				charTf.y = (-dis) * (param1 / to);
				charTf.alpha = 1 - param1 / to;
				return;
			}
				;
			onComplete = function () : void
			{
				if (charTf.parent != null)
				{
					charTf.parent.removeChild(charTf);
				}
				if (char_foot_box.numChildren == 0)
				{
					if (char_foot_box.parent != null)
					{
						char_foot_box.parent.removeChild(char_foot_box);
					}
				}
				return;
			}
				;
			charTf = new TextField();
			charTf.autoSize = TextFieldAutoSize.LEFT;
			charTf.mouseEnabled = false;
			charTf.filters = filter_char;
			var charTFormat:TextFormat = new TextFormat();
			charTFormat.size = 14;
			charTFormat.font = "宋体" ;
			charTFormat.color = 0xffff00 ;;
			charTf.defaultTextFormat = charTFormat;
			charTf.text = toText;
			var oldNumChildren:int = this.char_foot_box.numChildren;
			if (oldNumChildren == 0)
			{
				this.char_foot_box.addChild(charTf);
				this.char_foot_box.x = GameInstance.stage.stageWidth * CHAR_FOOT_U;
				this.char_foot_box.y = GameInstance.stage.stageHeight * CHAR_FOOT_V;
				LayerManager.msgTipLayer.addChild(this.char_foot_box);
			}
			else
			{
				this.char_foot_box.addChild(charTf);
			}
			dis = CHAR_FOOT_DIS;
			var duration:Number = CHAR_FOOT_TIME;
			var from:Number;
			to = duration;
			TimerManager.createOneOffExactTimer(duration, from, to, onUpdate, onComplete);
			return;
		}
		
		/**
		 * 添加提示 
		 * @param $key
		 * @param param2
		 * @param param3
		 * @param $type
		 * @param $value
		 * @param $text
		 * @see AttackFace.
		 */			
		public function addTip($key:String, param2:Number, param3:Number, $type:String, $value:int = -1, $text:String = "") : void
		{
			var af:AttackFace = AttackFace.createAttackFace($type, $value, $text);
			af.mouseEnabled = false;
			af.x = GameInstance.stage.stageWidth * param2;
			af.y = GameInstance.stage.stageHeight * param3;
			this._tipContainer[$key] = [af, param2, param3];
			LayerManager.msgTipLayer.addChild(af);
			return;
		}
		
		/**
		 *删除提示 
		 * @param $id
		 * 
		 */		
		public function removeTip($id:String) : void
		{
			var af:AttackFace = null;
			if (this._tipContainer.hasOwnProperty($id))
			{
				af = this._tipContainer[$id][0];
				if (af != null && af.parent != null && af.parent == LayerManager.msgTipLayer)
				{
					af.parent.removeChild(af);
				}
				AttackFace.recycleAttackFace(af);
				this._tipContainer[$id] = null;
				delete this._tipContainer[$id];
			}
			return;
		}
		/**
		 * 中间文字 如：自动寻路 
		 * @param param1
		 * 
		 */		
		public function addCenterTip(param1:String) : void
		{
			this.acheAry.push(param1);
			if (!this.isRunning)
			{
				this.doAddCenterTip();
			}
			return;
		}
		
		public function showAlone( $value:String ):void{
			var tfBox:Sprite;
			var onUpdate:Function;
			var onComplete:Function;
			var delay:Number;
			var tt1:Number;
			var tt2:Number;
			onUpdate = function (param1:Number) : void
			{
				if (param1 < tt1)
				{
					tfBox.alpha = param1 / tt1;
					var scale:Number = 1 + param1 / tt1 * 0.5;
					tfBox.scaleY = scale ;
					tfBox.scaleX = scale ;
				}
				else if (param1 > delay + tt1)
				{
					tfBox.alpha = (tt2 - (param1 - delay - tt1)) / tt2;
				}
				else
				{
					tfBox.alpha = 1;
					tfBox.scaleX = 1.5;
				}
				return;
			}
				;
			onComplete = function () : void
			{
				if (tfBox.parent != null)
				{
					tfBox.parent.removeChild(tfBox);
				}
				if (center_box.numChildren == 0)
				{
					if (center_box.parent != null)
					{
						center_box.parent.removeChild(center_box);
					}
				}
				aloneRunning = false ;
				return;
			}
			if(aloneRunning){
				tfBox = center_box.getChildAt(0) as Sprite;
				centerTf = tfBox.getChildAt(0) as TextField ;
				if(centerTf.text == $value ){
					return ;
				}
			}else{
				aloneRunning = true ;
				tfBox = new Sprite();
				tfBox.mouseEnabled = false;
				tfBox.mouseChildren = false;
				tfBox.alpha = 0;
				var centerTf:TextField = new TextField();
				centerTf.autoSize = TextFieldAutoSize.LEFT;
				centerTf.mouseEnabled = false;
				centerTf.filters = filter_center;
				var centerTFormat:TextFormat = new TextFormat();
				centerTFormat.size = 20 ;
				centerTFormat.font = "宋体" ;
				centerTFormat.color = 0xff0000 ;
				centerTf.defaultTextFormat = centerTFormat;
				centerTf.x = (-centerTf.width) / 2;
				centerTf.y = (-centerTf.height) / 2;
				tfBox.addChild(centerTf);
				this.center_box.addChild(tfBox);
			}
			centerTf.text = $value;
			if (this.center_box.parent != LayerManager.msgTipLayer)
			{
				this.center_box.x = (GameInstance.stage.stageWidth - center_box.width )/2;
				this.center_box.y = GameInstance.stage.stageHeight * CENTER_V;
				LayerManager.msgTipLayer.addChild(this.center_box);
			}
			var duration:Number = 1.5;
			delay = CENTER_TIME;
			tt1 = CENTER_TIME1;
			tt2 = CENTER_TIME2;
			var from:Number;
			var to:Number = duration;
			TimerManager.createOneOffExactTimer(duration, from, to, onUpdate, onComplete);
		}
		
		private function doAddCenterTip() : void
		{
			var tfBox:Sprite;
			var delay:Number;
			var tt1:Number;
			var tt2:Number;
			var onUpdate:Function;
			var onComplete:Function;
			onUpdate = function (param1:Number) : void
			{
				if (param1 < tt1)
				{
					tfBox.alpha = param1 / tt1;
					var scale:Number = 1 + param1 / tt1 * 0.5;
					tfBox.scaleY = scale ;
					tfBox.scaleX = scale ;
				}
				else if (param1 > delay + tt1)
				{
					tfBox.alpha = (tt2 - (param1 - delay - tt1)) / tt2;
				}
				else
				{
					tfBox.alpha = 1;
					tfBox.scaleX = 1.5;
				}
				return;
			}
				;
			onComplete = function () : void
			{
				if (tfBox.parent != null)
				{
					tfBox.parent.removeChild(tfBox);
				}
				if (center_box.numChildren == 0)
				{
					if (center_box.parent != null)
					{
						center_box.parent.removeChild(center_box);
					}
				}
				doAddCenterTip();
				return;
			}
				;
			if (this.acheAry.length == 0)
			{
				this.isRunning = false;
				return;
			}
			this.isRunning = true;
			var $value:String = this.acheAry.shift();
			tfBox = new Sprite();
			tfBox.mouseEnabled = false;
			tfBox.mouseChildren = false;
			tfBox.alpha = 0;
			var centerTf:TextField = new TextField();
			centerTf.autoSize = TextFieldAutoSize.LEFT;
			centerTf.mouseEnabled = false;
			centerTf.filters = filter_center;
			var centerTFormat:TextFormat = new TextFormat();
			centerTFormat.size = 36;
			centerTFormat.font = "宋体" ;
			centerTFormat.color = 0xff0000 ;
			centerTf.defaultTextFormat = centerTFormat;
			centerTf.text = $value;
			centerTf.x = (-centerTf.width) / 2;
			centerTf.y = (-centerTf.height) / 2;
			tfBox.addChild(centerTf);
			this.center_box.addChild(tfBox);
			if (this.center_box.parent != LayerManager.msgTipLayer)
			{
				this.center_box.x = GameInstance.stage.stageWidth * CENTER_U;
				this.center_box.y = GameInstance.stage.stageHeight * CENTER_V;
				LayerManager.msgTipLayer.addChild(this.center_box);
			}
			delay = CENTER_TIME;
			tt1 = CENTER_TIME1;
			tt2 = CENTER_TIME2;
			var duration:Number = delay + tt1 + tt2;
			var from:Number;
			var to:Number = duration;
			TimerManager.createOneOffExactTimer(duration, from, to, onUpdate, onComplete);
			return;
		}
		
		
		/**
		 * 调整大小 、更换位置
		 * 
		 */
		public function resize() : void
		{
			var $key:String = null;
			var value:Array = null;
			var af:AttackFace = null;
			var tf:TextField = null;
			var _w:Number = NaN;
			for ($key in this._tipContainer)
			{
				value = this._tipContainer[$key];
				af = value[0];
				af.x = GameInstance.stage.stageWidth * value[1];
				af.y = GameInstance.stage.stageHeight * value[2];
			}
			for ($key in this._txtTipContainer)
			{
				value = this._txtTipContainer[$key];
				tf = value[0];
				tf.x = GameInstance.stage.stageWidth * value[1] - tf.width * 0.5;
				tf.y = GameInstance.stage.stageHeight * value[2];
			}
			_w = SYSTEM_ROLL_WIDTH_MIN;
			this.setSystemRollAreaBg(_w);
			RollText.resetMaxWidth(_w);
			this.system_roll_box.x = GameInstance.stage.stageWidth * SYSTEM_ROLL_U - _w / 2;
			this.system_roll_box.y = GameInstance.stage.stageHeight * SYSTEM_ROLL_V;
			this.system_roll_box_mask.x = GameInstance.stage.stageWidth * SYSTEM_ROLL_U - _w / 2;
			this.system_roll_box_mask.y = GameInstance.stage.stageHeight * SYSTEM_ROLL_V;
			this.system_switch_box.x = GameInstance.stage.stageWidth * SYSTEM_SWITCH_U;
			this.system_switch_box.y = GameInstance.stage.stageHeight * SYSTEM_SWITCH_V;
			this.char_foot_box.x = GameInstance.stage.stageWidth * CHAR_FOOT_U;
			this.char_foot_box.y = GameInstance.stage.stageHeight * CHAR_FOOT_V;
			this.center_box.x = GameInstance.stage.stageWidth * CENTER_U;
			this.center_box.y = GameInstance.stage.stageHeight * CENTER_V;
			return;
		}
		
		/**
		 * 系统场景字符
		 * @param switchStr 
		 * @param $x
		 * @param $y
		 * @param $time
		 * 
		 */		
		public function addSystemTip(switchStr:String, $data :Object) : void
		{
			var af:TextField ;
			var format:TextFormat = new TextFormat(null,14,0x00ff00);
			af = new TextField();
			af.defaultTextFormat = format;
			af.height = 22;
			af.htmlText = switchStr;
			af.width = af.textWidth + 2;
			var move:int = $data.dis||50 ;
			af.mouseEnabled = false;
			af.x = $data.x ;
			af.y = $data.y ;	
			LayerManager.msgTipLayer.addChild(af);
			var onComplete:Function = function():void{
				af.parent.removeChild(af);
			};
			TweenLite.to(af,0.5,{y:af.y - move, delay:0.2 ,overwrite:0, onComplete:onComplete});
			return;
		}
		
		
		
		
		/**
		 * 系统提示跟随鼠标字符
		 * @param switchStr 
		 * @param $x
		 * @param $y
		 * @param $time
		 * 
		 */		
		public function addSystemMouseTip(switchStr:String, format:TextFormat=null) : void
		{
			var af:TextField ;
			var format:TextFormat = format || new TextFormat(null,14,0x00ff00,true,null,null,null,null);
			af = new TextField();
			af.defaultTextFormat = format;
			af.height = 22;
			af.htmlText = switchStr;
			af.width = af.textWidth + 2;
			var move:int = 100 ;
			af.mouseEnabled = false;
			af.x = GameInstance.stage.mouseX ;
			af.y = GameInstance.stage.mouseY;	
			af.filters = [FilterConst.ONE_PIXEL_BLACK];
			LayerManager.msgTipLayer.addChild(af);
			var onComplete:Function = function():void{
				af.parent.removeChild(af);
			};
			var toY:Number = af.y - move;
			toY = toY > 0 ? toY : 0;
			TweenLite.to(af,1,{y:toY, overwrite:0, onComplete:onComplete});
			return;
		}
		/**
		 * 系统提示跟随鼠标字符，数组格式
		 * @param switchStr 
		 * @param $time
		 * 
		 */		
		public function addSystemMouseTipArray(text:Array, format:TextFormat=null) : void
		{
			var af:NotifyTextField ;
			var switchStr:String = "";
			var format:TextFormat = format || new TextFormat(null,14,0x00ff00,true,null,null,null,null);
			var i:int = 0, len:int = text.length;
			var move:int = 100 ;
			for (;i<len;i++)
			{
				af = new NotifyTextField();
				af.defaultTextFormat = format;
				af.height = 22;
				af.htmlText = text[i];
				af.width = af.textWidth + 2;
				af.mouseEnabled = false;
				af.x = GameInstance.stage.mouseX ;
				af.y = GameInstance.stage.mouseY-i*22;	
				af.filters = [FilterConst.ONE_PIXEL_BLACK];
				LayerManager.msgTipLayer.addChild(af);
				var toY:Number = af.y - move;
				toY = toY > 0 ? toY : 0;
				TweenLite.to(af,1,{y:toY, overwrite:0, onComplete:af.onComplete});
			}
			return;
		}
		
		
		public static function getInstance() : TopTipManager
		{
			if (!_instance)
			{
				_instance = new TopTipManager;
			}
			return _instance;
		}
	}
}