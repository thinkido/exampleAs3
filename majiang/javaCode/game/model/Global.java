
package game.model;

import jing.configs.Config;
import network.YiuNetworkSocket;
import framework.events.EventDispatcher;
import framework.resources.Res;
import framework.resources.SpriteSheet;
import framework.resources.Texture;
import framework.views.Bitmap;
import framework.views.Sprite;
import game.constant.SceneType;
import game.constant.WindowType;
import game.control.AccountManager;
import game.control.LoadingManager;
import game.control.PlaceDataManager;
import game.control.SceneManager;
import game.control.WindowManager;
import game.model.callback.ICallback;
import game.model.vo.EnterGameVO;
import game.model.vo.GiftVO;
import game.model.vo.UserDataVO;

public class Global
{

	private static Sprite _root;

	// 消息通知器
	public static EventDispatcher notice = new EventDispatcher();

	public static final String GAME_ID = "90E94D37-DA24-DD26-A84E-19877299B7DB";

	public static final String CARDHOUSE_URL = "http://182.140.237.62/cardhouse/iptv/";

	public static final int SCREEN_WIDTH = 640;

	public static final int SCREEN_HEIGHT = 530;

	/**
	 * 初始化背景
	 */
	private static Bitmap initBg;

	/**
	 * 配置表
	 */
	public static Config cfg;

	/**
	 * 窗口灰色半透明遮盖
	 */
	public static Texture imgDarkBg;

	/**
	 * 头像纹理集
	 */
	public static SpriteSheet ssHead;

	/**
	 * 称号纹理集
	 */
	public static SpriteSheet ssTitle;

	/**
	 * 资源地址
	 */
	public static String resUrl = null;

	/**
	 * 大厅套接字
	 */
	public static YiuNetworkSocket socketHall = null;

	/**
	 * 游戏服套接字
	 */
	public static YiuNetworkSocket socketGame = null;

	/**
	 * 用户数据
	 */
	public static UserDataVO userDataVO;

	/**
	 * 登录奖励
	 */
	public static GiftVO giftVO;

	/** 以下数据来自IPTV **/
	public static String account;

	public static String adAccount;

	public static String nickname;

	public static String returnURL;

	public static int diamond;

	/** 视图层级 **/
	public static Sprite sceneLayer;

	public static Sprite windowLayer;

	public static Sprite effectLayer;

	public static Sprite loadingLayer;

	public static Sprite root()
	{
		return _root;
	}

	public static void setRoot(Sprite root)
	{
		if(null == _root)
		{
			_root = root;
			sceneLayer = new Sprite();
			windowLayer = new Sprite();
			effectLayer = new Sprite();
			loadingLayer = new Sprite();
			_root.addChild(sceneLayer);
			_root.addChild(windowLayer);
			_root.addChild(effectLayer);
			_root.addChild(loadingLayer);
		}
	}

	public static void reset()
	{
		WindowManager.getInstance().closeAllWindow();
		SceneManager.getInstance().reset();
		AccountManager.getInstance().reset();
		PlaceDataManager.getInstance().reset();
		System.gc();
	}

	public static void init()
	{
		LoadingManager.getInstance().init("loadingwindow_json", "loadingscene_json");
		WindowType.WINDOW_POPUP.createInstance();
		String imgDarkBgFileName = "img_dark_bg_png";
		imgDarkBg = Res.actively.getTexture(imgDarkBgFileName);
		Res.actively.release(imgDarkBgFileName);
		String ssHeadFileName = "head_json";
		ssHead = Res.actively.getSheet(ssHeadFileName);
		Res.actively.release(ssHeadFileName);
		String ssTitleFileName = "title_json";
		ssTitle = Res.actively.getSheet(ssTitleFileName);
		Res.actively.release(ssTitleFileName);
		LoadingManager.getInstance().showLoading(true, "登录中", new ICallback()
		{

			public void run()
			{
				AccountManager.getInstance().connect();
			}
		});
	}

	public static void startGame(EnterGameVO vo)
	{
		LoadingManager.getInstance().hideLoading();
		if(null == vo)
			SceneManager.getInstance().switchScene(SceneType.SCENE_HALL);
		else
			SceneManager.getInstance().switchScene(SceneType.SCENE_GAME, vo);
	}

	public static void hideInitBg()
	{
		loadingLayer.removeChild(initBg);
		initBg = null;
	}

	public static Texture getMyHeadTexture()
	{
		return getHeadTexture(userDataVO.sex, userDataVO.portrait);
	}

	public static Texture getHeadTexture(int sex, int portrait)
	{
		if(sex == 0)
			portrait += 9;
		return ssHead.getTexture("head_" + portrait);
	}

	public static Texture getMyTitleTexture()
	{
		return getTitleTexture(userDataVO.level);
	}

	public static Texture getTitleTexture(int level)
	{
		return ssTitle.getTexture("title_" + level);
	}
}
