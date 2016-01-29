package game.constant
{
	
	import game.view.scene.HallScene;
	import game.view.scene.gamescene.GameScene;
	
	import ui.UIScene;
	
	public class SceneType
	{
		
		protected var _cls:Class;
		
		protected var _confName:String;
		
		public function SceneType(cls:Class, confName:String)
		{
			_cls = cls;
			_confName = confName;
		}
		
		public function createInstance():UIScene
		{
			var newInstance:UIScene;
			try
			{
				newInstance = _cls.newInstance() as UIScene;
				newInstance.buildUI(_confName);
			}
			catch(e:*)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
				newInstance = null;
				trace(e.getMessage(), "LogManager.LEVEL_ERROR");
			}
			return newInstance;
		}
		
//		public static var SCENE_HALL:SceneType = new SceneType(HallScene.class, "hall_scene_json");
//		public static var SCENE_GAME:SceneType = new SceneType(GameScene.class, "game_scene_json");
		public static var SCENE_HALL:SceneType = new SceneType(HallScene, "hall_scene_json");;
		public static var SCENE_GAME:SceneType = new SceneType(GameScene, "game_scene_json");
				
	}
}
