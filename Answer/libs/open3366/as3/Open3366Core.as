package open3366.as3
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Security;
	import flash.utils.getTimer;
	
	import open3366.as3.*;
	
	/**
	 * 加载open3366组件 
	 * @author mandyxiong
	 * 
	 */	
	public class Open3366Core
	{
		private static const MIN_STORE_INDEX:Number = 1;
		private static const MAX_STORE_INDEX:Number = 4;
		
		private static var _service:*;
		
		private static var _gameId:String;
		private static var _isUseScore:Boolean;
		
		//积分游戏相关参数，通过页面传递过来
		private static var _pid:int;
		private static var _pkType:int;
		private static var _bookId:int;
		private static var _platForm:int;
		private static var _gameSwf:Sprite;
		
		public static function init(gameId:String, gameSwf:Sprite, isUseScore:Boolean):void
		{
			Security.allowDomain('img.3366img.com');
			Security.allowDomain('3366.com');
			Security.allowDomain('img.3366.com');
			Security.allowDomain('open.3366.com');
			Security.allowDomain('flash.3366.com');
			Security.allowDomain('www.3366.com');
			Security.allowDomain('view.3366.com');
			Security.allowDomain('mgp.qq.com');
			Security.allowDomain('app.3366.com');
			Security.allowDomain('pubview.3366.com');
			
			_gameId = gameId;
			_isUseScore = isUseScore;
			_gameSwf = gameSwf;
			
			//尝试获取当前页面的域名
			var sSwfDomain:String = "www.3366.com";
			var obj:Object = gameSwf.stage.loaderInfo.parameters;
			try
			{
				var domain:String = obj["pagedomain"];
				var dLen:int = domain.length;
				var tmpDomain1:String = domain.slice(dLen -8,dLen)
				var tmpDomain2:String = domain.slice(dLen -6,dLen)
				if(tmpDomain1 == "3366.com"||tmpDomain2 == "qq.com")
				{
					sSwfDomain = domain;
				}				
				_pid = parseInt(obj["pid"]);
				_bookId = parseInt(obj["bookid"]);
				_pkType = parseInt(obj["pktype"]);
				_platForm = parseInt(obj["platform"]);
			}
			catch (e:Error)
			{
			}
			var sComponentUrl:String = "http://" + sSwfDomain + "/open3366/component/openservice_as3_v3.swf?r="+getTimer();
			var loader : Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onServiceComplete);
			loader.load(new URLRequest(sComponentUrl));			
			trace(">>>>>>>>>>>>>>>>>>开始加载open366Service组件。gameId="+gameId+",isUseScore="+isUseScore+",pid="+_pid+",bookId="+_bookId+",pkType="+_pkType+",platForm="+_platForm+",sSwfDomain="+sSwfDomain);
		}
		
		private static function onServiceComplete(evt:Event):void
		{
			var loaderInfo:LoaderInfo = evt.target as LoaderInfo;
			loaderInfo.removeEventListener(Event.COMPLETE, onServiceComplete);
			_service = loaderInfo.content;
			
			_service.addEventListener(Open3366Event.STORE_GET, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.STORE_SET, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.STORE_GET_LIST, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.STORE_SET_EX, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.SCORE_SUBMIT, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.SHOW_SHOP, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.SHOP_BACK, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.ITEM_LIST, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.ITEM_DETAIL, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.CONSUME_ITEM, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.CHECK_LOGIN, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.GET_SERVER_TIME, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.ACCESS_TOKEN, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.CONSUME_TOTAL, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.GET_CONSUME, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.SEND_MSG_TO_FLASH, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.SERVICE_READY, Open3366Api.dispatchEvent);
			
			_service.addEventListener(Open3366Event.SIGN_IN, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.GET_ACTIVE_DETAIL, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.QUIRE_ACTIVE_LIMIT, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.RECEIVE_REWARD, Open3366Api.dispatchEvent);
			
			_service.addEventListener(Open3366Event.SEND_WEIBO, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.INVITE_FRIEND, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.GET_INVITE_INFO, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.CHECK_IS_INVITED, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.EXTERNAL_WRONG, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.SERVICE_READY_ERR, Open3366Api.dispatchEvent);
			_service.addEventListener(Open3366Event.RECOME_BOX, Open3366Api.dispatchEvent);
			
			_service.setGame(_gameId, Open3366Event, _platForm, _pkType, _bookId, _pid, _isUseScore);
			trace(">>>>>>>>>>>>>>>>>>>组件open366Service加载完成。");
		}
		
		public static function get payService():*
		{
			if(_service)
			{
				return _service.payService;
			}
			return null;
		}
		
		public static function get baseService():*
		{
			if(_service)
			{
				return _service.baseService;
			}
			return null;
		}
		
		public static function get storeService():*
		{
			if(_service)
			{
				return _service.storeService;
			}
			return null;
		}
		
		public static function get scoreService():*
		{
			if(_service)
			{
				return _service.scoreService;
			}
			return null;
		}
		
		public static function get activeService():*
		{
			if(_service)
			{
				return _service.activeService;
			}
			return null;
		}
		
		public static function recomGame():void
		{
			if(_service)
			{
				_service.recomService["recomGame"](_gameSwf.stage, _gameId);
			}
		}
		
		public static function loadCgi(type:String, data:Object = null):void
		{
			if(_service)
			{
				_service.loadCgiData(type, data);
			}
		}
	}
}