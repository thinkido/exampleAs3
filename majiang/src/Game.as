package
{
	
	import br.com.stimuli.loading.BulkLoader;
	
	import com.mike.utils.ResolutionUtil;
	import com.thinkido.framework.manager.keyBoard.KeyBoardManager;
	import com.thinkido.framework.manager.loader.LoaderManager;
	import com.thinkido.framework.manager.loader.vo.LoadData;
	
	import configs.GameInstance;
	
	import events.GameEvent;
	
	import flash.events.Event;
	
	import framework.resources.Res;
	
	import game.constant.WindowType;
	import game.control.AccountManager;
	import game.control.LoadingManager;
	import game.control.PlaceDataManager;
	import game.control.SceneManager;
	import game.control.WindowManager;
	import game.model.Global;
	
	import jing.configs.CardLayout;
	
	import managers.LayerManager;
	import managers.ResManager;
	import managers.SoundManager;
	
	import starling.display.Image;
	import starling.display.Sprite;
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
			EventCenter.instance.addEventListener(GameEvent.START_GAME, startGame);
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
		
		public function startGame(e:GameEvent=null):void
		{
			var arr:Array = [] ;
			var ld:LoadData ;
			arr = [ "img_dark_bg_png" , ResManager.getSheetUrl("head_json"), ResManager.getSheetUrl("title_json") ] ;
			var la:Array = [] ;
			var preloaded:Function = function (evt:Event):void{
				init();
			}
			for (var i:int = 0 ; i < arr.length ; i++ ) 
			{
				
				if( i == arr.length -1 ){	//最后一个;
					ld = new LoadData( arr[i] ,preloaded );
				}	else{
					ld = new LoadData( arr[i] );
				}			
				la.push(ld ) ;	
			}		
			
			
			LoaderManager.load( la , ResManager.resLoader ,true ) ;
		}	
		private function preloadComplated():void{
//			ResManager.assetsManager.addTextureAtlas(ResManager.YLXD_NAME, new TextureAtlas(Texture.fromBitmap(ResManager.resLoader.getContent(ResManager.YLXD)),ResManager.resLoader.getContent(ResManager.YLXDXML)));
//			ResManager.assetsManager.addTextureAtlas(ResManager.YLXD_NAME2, new TextureAtlas(Texture.fromBitmap(ResManager.resLoader.getContent(ResManager.YLXD2)),ResManager.resLoader.getContent(ResManager.YLXDXML2)));
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
			Global.cl = new CardLayout();			
			
			WindowType.WINDOW_POPUP.createInstance();
			
			var imgDarkBgFileName:String = "img_dark_bg_png";
			ResManager.imgDarkBg = ResManager.getFile(imgDarkBgFileName, Res.TYPE_TEXTURE ) as Texture;
			var ssHeadFileName:String = "head_json";
			ResManager.ssHead = ResManager.getFile(ssHeadFileName, Res.TYPE_TEXTUREATLAS) as TextureAtlas;
			var ssTitleFileName:String = "title_json";
			ResManager.ssTitle = ResManager.getFile(ssTitleFileName , Res.TYPE_TEXTUREATLAS ) as TextureAtlas;
			
		}
		private function initEvt():void
		{
			KeyBoardManager.instance.start();	
			SoundManager.init();	
			LayerManager.init() ;
//			AccountManager.getInstance().init( this.stage ) ; 		// 会从这里开始处理协议进入逻辑,可能需要调整位置;
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