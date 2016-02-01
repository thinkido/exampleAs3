package
{
	
	import com.mike.utils.ResolutionUtil;
	import com.thinkido.framework.common.Global;
	import com.thinkido.framework.manager.keyBoard.KeyBoardManager;
	
	import configs.GameInstance;
	
	import events.GameEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import framework.resources.Res;
	
	import game.constant.WindowType;
	import game.control.AccountManager;
	import game.control.LoadingManager;
	import game.control.PlaceDataManager;
	import game.control.SceneManager;
	import game.control.WindowManager;
	import game.model.Global;
	
	import managers.LayerManager;
	import managers.ResManager;
	import managers.SoundManager;
	
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Game extends Sprite
	{
		private var music:Image;
		private var firstLayer:Sprite;
		private var secondeLayer:Sprite;
		private var thirdLayer:Sprite;
		private var showBG:Boolean = true;
		private var bgItem:Image;
		
		public function Game()
		{
//			EventCenter.instance.addEventListener(GameEvent.GAME_STATE_CHANGE, stateHandler);
			EventCenter.instance.addEventListener(GameEvent.START_GAME, beginAfterRes);
			EventCenter.instance.addEventListener(GameEvent.STAGE_ACTIVATE, onStageActivate);
			EventCenter.instance.addEventListener(GameEvent.STAGE_DEACTIVATE, onStageDeactivate);
			this.addEventListener(Event.ADDED_TO_STAGE,onResize);
			
//			this.addChild(new Stage);
		}
		
		private var oldSoundEnable:Boolean = false;
		protected function onStageDeactivate(event:GameEvent):void
		{
			oldSoundEnable = GameInstance.instance.soundEnable;
			if (oldSoundEnable)
			{
//				playSound(false);
			}
		}
		
		protected function onStageActivate(event:GameEvent):void
		{
			if (oldSoundEnable)
			{
//				playSound(true);
			}
		}
		
		private function onResize(event:Event):void
		{
			trace("添加到舞台");
			EventCenter.instance.dispatchEvent(new GameEvent(GameEvent.STARLING_CREATE));
		}
		private function init():void{
			initData();
			initView();
			initEvt();
		}
		private function onRender(event:Event):void
		{
//			var t:int = getTimer();
//			trace("背景耗时"+(getTimer() - t));
		}
		
		public function beginAfterRes(e:GameEvent=null):void
		{
			ResManager.assetsManager.addTextureAtlas(ResManager.YLXD_NAME, new TextureAtlas(Texture.fromBitmap(ResManager.resLoader.getContent(ResManager.YLXD)),ResManager.resLoader.getContent(ResManager.YLXDXML)));
			ResManager.assetsManager.addTextureAtlas(ResManager.YLXD_NAME2, new TextureAtlas(Texture.fromBitmap(ResManager.resLoader.getContent(ResManager.YLXD2)),ResManager.resLoader.getContent(ResManager.YLXDXML2)));
			
			init();
		}
		
		private function initData():void
		{
			game.model.Global.game = this ;
			game.model.Global.SCREEN_WIDTH = ResolutionUtil.instance.designWidth;
			game.model.Global.SCREEN_HEIGHT = ResolutionUtil.instance.designHeight;
			
			LoadingManager.getInstance().init("loadingwindow_json", "loadingscene_json");
			
			AccountManager.getInstance().connect();
			
		}
		private function initView():void
		{			
			WindowType.WINDOW_POPUP.createInstance();
			var imgDarkBgFileName:String = "img_dark_bg_png";
			imgDarkBg = Res.actively.getTexture(imgDarkBgFileName);
			Res.actively.release(imgDarkBgFileName);
			var ssHeadFileName:String = "head_json";
			ssHead = Res.actively.getSheet(ssHeadFileName);
			Res.actively.release(ssHeadFileName);
			var ssTitleFileName:String = "title_json";
			ssTitle = Res.actively.getSheet(ssTitleFileName);
			Res.actively.release(ssTitleFileName);
		}
		private function initEvt():void
		{
			com.thinkido.framework.common.Global.instance.initStage( this.stage ) ; // 原引擎代码中 键盘事件监听 旧代码;
			KeyBoardManager.instance.start();	
			SoundManager.init();	
			LayerManager.init() ;
		}	
		
		public static function reset():void
		{
			WindowManager.getInstance().closeAllWindow();
			SceneManager.getInstance().reset();
			AccountManager.getInstance().reset();
			PlaceDataManager.getInstance().reset();
		}
	}
}