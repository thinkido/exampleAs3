package open3366.as3
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * open3366基础api 
	 * @author mandyxiong
	 * 
	 */	
	public class Open3366Api
	{
		private static var _dispatcher:EventDispatcher = new EventDispatcher();
		/**
		 * 初始化游戏 
		 * @param gameId 创建游戏时，系统分配的游戏id
		 * @param gameSwf 游戏主类
		 * @param isUseScore 是否使用积分功能 默认为true表示使用积分功能
		 * 
		 */		
		public static function initGame(gameId:String, gameSwf:Sprite, isUseScore:Boolean = true):void
		{
			if(gameSwf)
			{
				Open3366Core.init(gameId, gameSwf, isUseScore);
			}
		}
		
		/**
		 * 判断是否登录,获取uid 
		 * @param utf8
		 * 
		 */		
		public static function isLogin(utf8:int = 1):void
		{
			if(Open3366Core.baseService)
			{
				Open3366Core.baseService.isLogin(utf8);
			}
		}
		
		/**
		 * 弹出登录框 
		 * 
		 */		
		public static function showLogin():void
		{
			if(Open3366Core.baseService)
			{
				Open3366Core.baseService.showLogin();
			}
		}
		
		/**
		 * 获取时间戳 
		 * 
		 */		
		public static function getTimeStamp():void 
		{
			if(Open3366Core.baseService)
			{
				Open3366Core.baseService.getTimeStamp();
			}
		}
		
		/**
		 * 获取时间戳和token值 
		 * 
		 */		
		public static function getToken():void
		{
			if(Open3366Core.baseService)
			{
				Open3366Core.baseService.getToken();
			}
		}
		
		/**
		 * 获取消费总金额 
		 * 
		 */		
		public static function getConsumeTotal():void
		{
			if(Open3366Core.baseService)
			{
				Open3366Core.baseService.getConsumeTotal();
			}
		}
		
		/**
		 * 获取一段时间内的消费总金额 
		 * 
		 */		
		public static function getConsume(begintime:uint, endtime:uint):void
		{
			Open3366Core.loadCgi("getConsume", {begintime:begintime, endtime:endtime, querytype:1});
		}
		
		/**
		 * 邀请好友
		 */
		public static function inviteFriends():void{
			if(Open3366Core.baseService){
				Open3366Core.baseService.inviteFriends();
			}
		}
		
		/**
		 * 查询邀请好友成功次数
		 */
		public static function getInviteInfo():void{
			if(Open3366Core.baseService){
				Open3366Core.baseService.getInviteInfo();
			}
		}
		
		/**
		 * 验证用户是否为被邀请用户
		 */
		public static function checkIsInvited():void{
			if(Open3366Core.baseService){
				Open3366Core.baseService.checkIsInvited();
			}
		}
		
		/**
		 * 存档 
		 * @param title 存档名称
		 * @param data 存档的数据对象
		 * @param index
		 * @param pageid
		 * 
		 */		
		public static function setData(title:String, data:Object, index:int = 1, pageid:int = 1):void
		{
			if(Open3366Core.storeService)
			{
				Open3366Core.storeService.setData(title, data, index, pageid);
			}
		}
		
		/**
		 * 取档 
		 * @param index
		 * @param pageid
		 * 
		 */		
		public static function getData(index:int = 1, pageid:int = 1):void
		{
			if(Open3366Core.storeService)
			{
				Open3366Core.storeService.getData(index, pageid);
			}
		}
		
		/**
		 * 获取存档列表 
		 * @param pageid
		 * 
		 */		
		public static function getDataList(pageid:int = 1):void
		{
			if(Open3366Core.storeService)
			{
				Open3366Core.storeService.getDataList(pageid);
			}
		}
		
		/**
		 * 存档,但是数据会进行压缩处理
		 * @param title 存档名称
		 * @param data 存档的数据对象
		 * @param index
		 * @param pageid
		 * 
		 */		
		public static function setDataEx(title:String, data:Object, index:int = 1, pageid:int = 1):void
		{
			if(Open3366Core.storeService)
			{
				Open3366Core.storeService.setDataEx(title, data, index, pageid);
			}
		}
		
		/**
		 * 提交分数 
		 * @param score
		 * 
		 */		
		public static function submitScore(score:int):void
		{ 
			if(Open3366Core.scoreService)
			{
				Open3366Core.scoreService.submitScore(score);
			}
		}
		
		/**
		 * 获取物品的详细信息 
		 * @param itemId
		 * 
		 */		
		public static function getItem(itemId:int, roleId:int = 0):void
		{
			if(Open3366Core.payService)
			{
				Open3366Core.payService.getItem(itemId, roleId);
			}
		}
		
		/**
		 * 获取物品列表 
		 * 
		 */		
		public static function getItemList(roleId:int = 0):void
		{
			if(Open3366Core.payService)
			{
				Open3366Core.payService.getItemList(roleId);
			}
		}
		
		/**
		 * 购买物品 
		 * @param itemId
		 * @param buyCount
		 * 
		 */		
		public static function buyItem(itemId:int, count:int, roleId:int = 0):void
		{
			if(Open3366Core.payService)
			{
				Open3366Core.payService.buyItem(itemId, count, roleId);
			}
		}
		
		/**
		 * 消耗物品 
		 * @param itemId
		 * @param consume
		 * 
		 */		
		public static function consumeItem(itemId:int, count:int, roleId:int = 0):void
		{
			if(Open3366Core.payService)
			{
				Open3366Core.payService.consumeItem(itemId, count, roleId);
			}
		}
		
		/**
		 * 推荐API 
		 * 
		 */		
		public static function recomGame():void
		{
			Open3366Core.recomGame();
		}
			
		/**
		 * 获取活动详情 
		 * @param activeId 活动id
		 * 
		 */		
		public static function getActiveDetail(activeId:int):void
		{
			if(Open3366Core.activeService)
			{
				Open3366Core.activeService.getActiveDetail(activeId);
			}
		}
		
		/**
		 * 领取活动礼包 
		 * @param activeId 活动id
		 * 
		 */		
		public static function receiveReward(activeId:int, roleId:int):void
		{
			if(Open3366Core.activeService)
			{
				Open3366Core.activeService.receiveReward(activeId, roleId);
			}
		}
		
		/**
		 * 查询玩家是否满足活动条件 
		 * @param activeId 活动id
		 * 
		 */		
		public static function quireActiveLimit(activeId:int):void
		{
			if(Open3366Core.activeService)
			{
				Open3366Core.activeService.quireActiveLimit(activeId);
			}
		}
		
		/**
		 * 玩家签到（计算玩家登录天数） 
		 * 
		 */		
		public static function signIn():void
		{
			if(Open3366Core.activeService)
			{
				Open3366Core.activeService.signIn();
			}
		}
		
		/**
		 * 分享游戏到微博 
		 * @param content 微博正文
		 * @param picUrl 微博图片地址
		 * @param utf8 编码方式 1为uft8 其它为gbk 
		 */		
		public static function sendWeibo(content:String, picUrl:String = null, utf8:int = 1):void
		{
			Open3366Core.loadCgi("sendWeibo", {content:content, picurl:picUrl, utf8:utf8});
		}
		
		public static function dispatchEvent(evt:Event):void
		{
			_dispatcher.dispatchEvent(evt);
		}
		
		public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, prority:int = 0, useWeakReference:Boolean = false):void
		{
			_dispatcher.addEventListener(type, listener, useCapture, prority, useWeakReference);
		}
		
		public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			_dispatcher.removeEventListener(type, listener, useCapture);
		}
	}
}