package game.model
{	
	import flash.system.System;
	
	import game.control.PlaceDataManager;
	import game.control.SceneManager;
	import game.control.WindowManager;
	import game.model.vo.GiftVO;
	import game.model.vo.UserDataVO;
	
	import network.YiuNetworkSocket;
	
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	
	public class Global
	{
		
		private static var _root:Sprite;
		
		// 消息通知器
		public static var notice:EventDispatcher = new EventDispatcher();
		
		public static final const GAME_ID:String = "90E94D37-DA24-DD26-A84E-19877299B7DB";
		
		public static final const CARDHOUSE_URL:String = "http://182.140.237.62/cardhouse/iptv/";
		
		public static const SCREEN_WIDTH:int = 640;
		
		public static const SCREEN_HEIGHT:int = 530;
		
		/**
		 * 配置表
		 */
		public static var cfg:Config;
		
		/**
		 * 窗口灰色半透明遮盖
		 */
		public static var imgDarkBg:Texture;
		
		/**
		 * 头像纹理集
		 */
		public static var ssHead:SpriteSheet;
		
		/**
		 * 称号纹理集
		 */
		public static var ssTitle:SpriteSheet;
		
		/**
		 * 资源地址
		 */
		public static var resUrl:String = null;
		
		/**
		 * 大厅套接字
		 */
		public static var socketHall:YiuNetworkSocket = null;
		
		/**
		 * 游戏服套接字
		 */
		public static var socketGame:YiuNetworkSocket = null;
		
		/**
		 * 用户数据
		 */
		public static var userDataVO:UserDataVO;
		
		/**
		 * 登录奖励
		 */
		public static var giftVO:GiftVO;
		
		/** 以下数据来自IPTV **/
		public static var account:String;
		
		public static var adAccount:String;
		
		public static var nickname:String;
		
		public static var returnURL:String;
		
		public static var diamond:int;
		
		/** 视图层级 **/
		public static var sceneLayer:Sprite;
		
		public static var windowLayer:Sprite;
		
		public static var effectLayer:Sprite;
		
		public static var loadingLayer:Sprite;
		
		public static function root():Sprite
		{
			return _root;
		}
		
		public static function setRoot(root:Sprite):void
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
		
		public static function reset():void
		{
			WindowManager.getInstance().closeAllWindow();
			SceneManager.getInstance().reset();
			AccountManager.getInstance().reset();
			PlaceDataManager.getInstance().reset();
			System.gc();
		}
		
		public static function init():void
		{
			LoadingManager.getInstance().init("loadingwindow_json", "loadingscene_json");
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
			
			AccountManager.getInstance().connect();
		}
		
		public static function getMyHeadTexture():Texture
		{
			return getHeadTexture(userDataVO.sex, userDataVO.portrait);
		}
		
		public static function getHeadTexture(sex:int, portrait:int):Texture
		{
			if(sex == 0)
				portrait += 9;
			return ssHead.getTexture("head_" + portrait);
		}
		
		public static function getMyTitleTexture():Texture
		{
			return getTitleTexture(userDataVO.level);
		}
		
		public static function getTitleTexture(level:int):Texture
		{
			return ssTitle.getTexture("title_" + level);
		}
	}
}