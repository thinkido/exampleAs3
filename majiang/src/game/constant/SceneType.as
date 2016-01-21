package game.constant
{
	import game.control.LogManager;
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
			catch(e:Error)
			{
				e.printStackTrace();
				newInstance = null;
				LogManager.getInstance().log(e.getMessage(), LogManager.LEVEL_ERROR);
			}
			return newInstance;
		}
		
		public static final SceneType SCENE_HALL = new SceneType(HallScene.class, "hall_scene_json");;
			
			public static final SceneType SCENE_GAME = new SceneType(GameScene.class, "game_scene_json");
				
				}
