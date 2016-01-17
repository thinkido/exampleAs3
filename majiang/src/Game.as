package
{
	
	import configs.GameInstance;
	
	import events.GameEvent;
	
	import managers.ResManager;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
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
		
		private function onRender(event:Event):void
		{
//			var t:int = getTimer();
//			trace("背景耗时"+(getTimer() - t));
		}
		
		public function beginAfterRes(e:GameEvent=null):void
		{
			ResManager.assetsManager.addTextureAtlas(ResManager.YLXD_NAME, new TextureAtlas(Texture.fromBitmap(ResManager.resLoader.getContent(ResManager.YLXD)),ResManager.resLoader.getContent(ResManager.YLXDXML)));
			ResManager.assetsManager.addTextureAtlas(ResManager.YLXD_NAME2, new TextureAtlas(Texture.fromBitmap(ResManager.resLoader.getContent(ResManager.YLXD2)),ResManager.resLoader.getContent(ResManager.YLXDXML2)));
			initUI();
		}
		
		private function initUI():void
		{
			firstLayer = new Sprite();
			this.addChild(firstLayer);
			
			secondeLayer = new Sprite();
			this.addChild(secondeLayer);
			
			thirdLayer = new Sprite();
			this.addChild(thirdLayer);
			
		}
		
		
		
	}
}