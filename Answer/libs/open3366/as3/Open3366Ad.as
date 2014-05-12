package open3366.as3
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Security;
	import flash.utils.getTimer;
	
	/**
	 * 广告api
	 * @author mandyxiong
	 */
	public class Open3366Ad
	{
		private static var _service:*;
		private static var _stage:Stage;
		private static var _gameId:String;
		private static var _version:String;
		private static var _callBack:Function;	
		
		public static function showAd(gameId:String, gameSwf:Sprite, callBack:Function, version:String = "1.1.1_as3"):void
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
			_stage = gameSwf.stage;
			_version = version;
			_callBack = callBack;
			
			var sComponentUrl:String = "http://www.3366.com/open3366/component/openad_as3.swf?r="+getTimer();
			var loader : Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onServiceComplete);
			loader.load(new URLRequest(sComponentUrl));			
			trace(">>>>>>>>>>>>>>>>>>开始加载openad_as3组件。gameId="+gameId+",version="+version);
		}
		
		private static function onServiceComplete(evt:Event):void
		{
			var loaderInfo:LoaderInfo = evt.target as LoaderInfo;
			loaderInfo.removeEventListener(Event.COMPLETE, onServiceComplete);
			_service = loaderInfo.content;
			_service.setup(_stage, _gameId, _version, _callBack);
		}
	}
}