package
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import com.mike.utils.ResolutionUtil;
	import com.thinkido.framework.manager.keyBoard.KeyBoardManager;
	
	import configs.GameInstance;
	
	import events.GameEvent;
	
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.utils.getTimer;
	
	import managers.ResManager;
	import managers.SoundManager;
	
	import starling.core.Starling;
	import starling.utils.AssetManager;
	
	public class Main extends Sprite
	{
		private var app:Starling;

		
		public function Main()
		{
			super();
			
			if (stage){
				this.init(null);
			}else{
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.BACK)
			{
				e.preventDefault();
			}
		}
		
		protected function onExit(event:Event=null):void
		{
			NativeApplication.nativeApplication.exit();
		}

		private function onGameDeactivate(e:Event):void
		{
			EventCenter.instance.dispatchGameEvent(GameEvent.STAGE_DEACTIVATE);
		}
		private function onGameActivate(e:Event):void
		{
			EventCenter.instance.dispatchGameEvent(GameEvent.STAGE_ACTIVATE);
		}

		private function init(event:Event=null):void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 30;
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			//						Starling.multitouchEnabled = false;
			
			
			ResolutionUtil.instance.init(new Point(1280,720));
			
			beginTime = getTimer();
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			
			stage.addEventListener(Event.DEACTIVATE, onGameDeactivate);
			stage.addEventListener(Event.ACTIVATE, onGameActivate);
			GameInstance.instance.sceneWidth = Math.min(stage.fullScreenWidth, stage.fullScreenHeight);
			GameInstance.instance.sceneHeight = Math.max(stage.fullScreenWidth, stage.fullScreenHeight);
			GameInstance.instance.scaleRatio = 1;//ResolutionUtil.instance.getBestRatio(GameInstance.instance.sceneWidth,GameInstance.instance.sceneHeight);
			
			EventCenter.instance.addEventListener(GameEvent.STARLING_CREATE, onStarlingCreated);
			var rect:Rectangle ;
			rect = new Rectangle(0,0,Math.min(stage.fullScreenWidth, stage.fullScreenHeight),Math.max(stage.fullScreenWidth, stage.fullScreenHeight));
//			if (!DeviceUtil.ios)
				Starling.handleLostContext = true;
			app = new Starling(Game,stage,rect,null,"auto","auto");
			app.stage.stageWidth = ResolutionUtil.instance.designWidth;
			app.stage.stageHeight = ResolutionUtil.instance.designHeight;
			app.showStats = true;
			app.start();
			loadRes(null);
			stage.addEventListener(Event.ENTER_FRAME, onenterframe);
		}
		
		protected function onenterframe(event:Event):void
		{
			trace("1");
		}
		
		private var beginTime:int = 0;
		
		protected function onStarlingCreated(event:GameEvent):void
		{
			GameInstance.instance.haveStarlingCreate = true;
			starGame();
		}
		
		protected function onClick(event:MouseEvent):void
		{
			starGame();
		}
		
		private var timeBool:Boolean = false;
		private function timeOut():void
		{
			timeBool = true;
			starGame();
		}
		
		
		private function initData():void
		{
//			GameInstance.instance.so = new LocalSO("com.kunpeng.collectcandy");
		}
		
		public function loadRes(e:GameEvent):void
		{
			ResManager.resLoader = new BulkLoader("main");
			
			ResManager.resLoader.add(ResManager.YLXDXML);
			ResManager.resLoader.add(ResManager.YLXD);
			ResManager.resLoader.add(ResManager.YLXDXML2);
			ResManager.resLoader.add(ResManager.YLXD2);
			ResManager.resLoader.add(ResManager.CANDYCONFIG);
			var comp:Function = function(e:BulkProgressEvent):void
			{
				ResManager.resLoader.removeEventListener(BulkProgressEvent.COMPLETE, comp);
				GameInstance.instance.resLoadCom = true;
				var am:AssetManager = new AssetManager();
				ResManager.assetsManager = am;
				starGame();
				SoundManager.init();
			};
			ResManager.resLoader.addEventListener(BulkProgressEvent.COMPLETE,comp);
			ResManager.resLoader.start();
		}
		
		private function starGame():void
		{
			trace(GameInstance.instance.resLoadCom,GameInstance.instance.haveStarlingCreate,timeBool);
			if (GameInstance.instance.resLoadCom && GameInstance.instance.haveStarlingCreate)
			{
				initData();
				EventCenter.instance.dispatchEvent(new GameEvent(GameEvent.START_GAME));
				GameInstance.beginTime = getTimer();
			}
		}
		
	}
}