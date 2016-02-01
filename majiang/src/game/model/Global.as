package game.model
{	
	import com.thinkido.framework.net.JSocket;
	
	import flash.system.System;
	
	import framework.resources.Res;
	import framework.resources.SpriteSheet;
	
	import game.constant.WindowType;
	import game.control.AccountManager;
	import game.control.LoadingManager;
	import game.control.PlaceDataManager;
	import game.control.SceneManager;
	import game.control.WindowManager;
	import game.model.vo.GiftVO;
	import game.model.vo.UserDataVO;
	
	import jing.configs.Config;
	
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	
	public class Global
	{
		
		public static var game:Game;
		
		private static var _root:Sprite;
		
		// 消息通知器
		public static var notice:EventDispatcher = new EventDispatcher();
		
		public static const GAME_ID:String = "90E94D37-DA24-DD26-A84E-19877299B7DB";
		
		public static const CARDHOUSE_URL:String = "http://182.140.237.62/cardhouse/iptv/";
		
		public static const SCREEN_WIDTH:int = 640;
		
		public static const SCREEN_HEIGHT:int = 530;
		
		/**
		 * 配置表
		 */
		public static var cfg:Config;
		
		/**
		 * 资源地址
		 */
		public static var resUrl:String = null;
		
		/**
		 * 大厅套接字
		 */
		public static var socketHall:JSocket = null;
		
		/**
		 * 游戏服套接字
		 */
		public static var socketGame:JSocket = null;
		
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
		
	}
}