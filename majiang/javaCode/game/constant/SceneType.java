
package game.constant;

import game.control.LogManager;
import game.view.scene.HallScene;
import game.view.scene.gamescene.GameScene;
import ui.UIScene;

public class SceneType
{

	protected Class _cls;

	protected String _confName;

	public SceneType(Class cls, String confName)
	{
		_cls = cls;
		_confName = confName;
	}

	public UIScene createInstance()
	{
		UIScene newInstance;
		try
		{
			newInstance = (UIScene)_cls.newInstance();
			newInstance.buildUI(_confName);
		}
		catch(Exception e)
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
