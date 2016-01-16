
package game.model;

import jing.configs.Config;
import network.YiuNetworkSocket;
import framework.events.EventDispatcher;
import framework.resources.Res;
import framework.resources.SpriteSheet;
import framework.resources.Texture;
import framework.views.Sprite;
import game.constant.WindowType;
import game.control.AccountManager;
import game.control.LoadingManager;
import game.control.PlaceDataManager;
import game.control.SceneManager;
import game.control.WindowManager;
import game.model.vo.GiftVO;
import game.model.vo.UserDataVO;

public class Global
{

	private static Sprite _root;

	// ��Ϣ֪ͨ��
	public static EventDispatcher notice = new EventDispatcher();

	public static final String GAME_ID = "90E94D37-DA24-DD26-A84E-19877299B7DB";

	public static final String CARDHOUSE_URL = "http://182.140.237.62/cardhouse/iptv/";

	public static final int SCREEN_WIDTH = 640;

	public static final int SCREEN_HEIGHT = 530;

	/**
	 * ���ñ�
	 */
	public static Config cfg;

	/**
	 * ���ڻ�ɫ��͸���ڸ�
	 */
	public static Texture imgDarkBg;

	/**
	 * ͷ������
	 */
	public static SpriteSheet ssHead;

	/**
	 * �ƺ�����
	 */
	public static SpriteSheet ssTitle;

	/**
	 * ��Դ��ַ
	 */
	public static String resUrl = null;

	/**
	 * �����׽���
	 */
	public static YiuNetworkSocket socketHall = null;

	/**
	 * ��Ϸ���׽���
	 */
	public static YiuNetworkSocket socketGame = null;

	/**
	 * �û�����
	 */
	public static UserDataVO userDataVO;

	/**
	 * ��¼����
	 */
	public static GiftVO giftVO;

	/** ������������IPTV **/
	public static String account;

	public static String adAccount;

	public static String nickname;

	public static String returnURL;

	public static int diamond;

	/** ��ͼ�㼶 **/
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

		AccountManager.getInstance().connect();
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
