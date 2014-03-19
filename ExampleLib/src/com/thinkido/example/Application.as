package com.thinkido.example
{
	import com.google.analytics.AnalyticsTracker;
	import com.google.analytics.GATracker;
	import com.greensock.TweenLite;
	import com.thinkido.framework.common.events.helper.EventDispatchHelper;
	import com.thinkido.framework.common.timer.helper.TimerHelper;
	import com.thinkido.framework.display.LightPoint;
	import com.thinkido.framework.display.RepeatImage;
	import com.thinkido.framework.events.DataEvent;
	import com.thinkido.framework.manager.BrowerManager;
	import com.thinkido.framework.manager.TimerManager;
	import com.thinkido.framework.manager.loader.RslLoader;
	import com.thinkido.framework.manager.loader.vo.LoadData;
	import com.thinkido.framework.utils.StringHelper;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	import lm.mui.controls.GButton;
	
	import style.GlobalSkin;
	
	public class Application extends Sprite
	{
		[Embed(source = "../asset/tile1.jpg")]
		private var Tile1:Class;
		[Embed(source = "../asset/thinkido.png")]
		private var LogoClass:Class;
		[Embed(source = "../asset/magicTree.swf")]
		private var BackgroundSwf:Class;
		
		[Embed(source = "../asset/ExampleSkin.swf",mimeType="application/octet-stream")]
		private var ButtonRedClass:Class;
		
		private var _logo:DisplayObject ;
		private const prefixStr:String = "http://www.thinkido.com/app/example/" ;

		/**
		 * 20131005  
		 */		
		public static var Version:Number = 1.0 ;
		
		/**
		 * 修改自己的logo,也可以是一个动画。 
		 * @param value logo显示对象，不能为空，宽高大于0
		 * 
		 */		
		private var _background:Sprite = null ;
		private var _content:Sprite = null ;
		private var _top:Sprite = null ;
		private var _backgroundSwf:MovieClip;
		private var tileImg:RepeatImage;
		private var _lightPoint:LightPoint;
		
		protected var defaultSkin:Boolean = true ;
		
		public function Application()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
		}
		private function addedToStageHandler(event : Event) : void {
			
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.quality = StageQuality.HIGH;
			
			_background = new Sprite();
			super.addChild(_background);
			_top = new Sprite();
			super.addChild(_top);
			
			if( defaultSkin ){
				tileImg = new RepeatImage();
				
				var _width:Number = stage.stageWidth ;
				var _height:Number = stage.stageHeight ;
				tileImg.setSize(_width,_height);
				tileImg.bitmapData = (new Tile1()).bitmapData ;
				_background.addChild(tileImg);
				
				_backgroundSwf = new BackgroundSwf() ;
				_background.addChild(_backgroundSwf);
				_backgroundSwf.x = _width - 440 ;
				_backgroundSwf.y = _height - 300 ;
				_lightPoint = new LightPoint();
				_lightPoint.setSize(_width,_height);
				_background.addChild(_lightPoint);
			}
			
			var _logo:Bitmap = new LogoClass() ;
			logo = _logo ;
			
			getVersion();
			
			this.stage.addEventListener(Event.RESIZE,appResize);
			
			GlobalSkin.initStyleSkin() ;
			
			var skinLoader:Loader = new Loader();
			var ButtonRedSkin:ByteArray = new ButtonRedClass() ;
			
			var loaderContext:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
			skinLoader.loadBytes(ButtonRedSkin,loaderContext);
			skinLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeHandler);
			
			tracker = new GATracker( this, "UA-40324677-1", "AS3", false );
			tracker.trackPageview("/exampleLib");
			
			initGa();
		}
		
		private function initGa():void
		{
			TimerManager.createTimer(500000,int.MAX_VALUE,aliveEventHandler);
		}
		
		private function aliveEventHandler():void
		{
			tracker.trackEvent("alive","auto","main");
		}
		private var tracker:AnalyticsTracker ; 
		
		private function completeHandler(evt:*=null) : void
		{
			initApp();
			initMenu();
		}
		protected function initApp():void{
			
		}
		private function createBtn(name:String):GButton{
			var btn:GButton = new GButton();
			btn.styleName = 'ButtonRed';
			btn.label = "  "+name ;
			btn.width=80 ;
			return btn ;
		}
		protected function appResize(event:Event):void
		{
			if(defaultSkin){
				var _width:Number = stage.stageWidth ;
				var _height:Number = stage.stageHeight ;
				_backgroundSwf.x = _width - 440 ;
				_backgroundSwf.y = _height - 300 ;
				_lightPoint.setSize(_width,_height);
				tileImg.setSize(_width,_height);
			}
		}
		/**
		 * 加载版本文件
		 */		
		private function getVersion():void
		{
			var str:String ;
			try{
				str = BrowerManager.instance.isNet?(prefixStr + "version.xml"): "version.xml" ;
			}catch(e:*){
				str = "version.xml" ;
			}
			var urlLoader:URLLoader = new URLLoader();
			var req:URLRequest = new URLRequest(str);
			urlLoader.addEventListener(Event.COMPLETE,loadVerComplate);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR,loadVerError);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadVerError);
			urlLoader.load(req);
		}

		private function loadVerError(event:*):void
		{
			
		}
		/**
		 * 版本文件加载完成 
		 * @param event
		 * 
		 */		
		private function loadVerComplate(event:Event):void
		{
			var _xml:XML = new XML((event.target as URLLoader).data) ;
			var _version:Number = Number(_xml.version.@value) ;
			if( _version > Version ){
				loadBackgroundSwf(_xml.version.@url);
			}
		}
		/**
		 * 如果版本有更新，是加载新的背景 
		 */		
		private function loadBackgroundSwf($url:String):void
		{
			var urlLoader:URLLoader = new URLLoader();
			var loader:RslLoader = new RslLoader();
			loader.addEventListener(Event.COMPLETE,loadSwfComplate);
			var ld:LoadData = new LoadData($url);
			loader.load(ld);
		}
		
		private function loadSwfComplate(event:Event):void
		{
			var rslLoader:RslLoader = RslLoader(event.target) ;
			_background.addChild(rslLoader.loader);
		}
		public function set logo(value:DisplayObject):void
		{
			if( value == null || value.width == 0 || value.height == 0 ){
				return ;
			}
			if( _logo != null ){
				_top.removeChild(_logo);
			}
			_logo = value;
			_top.addChild(_logo);
		}
		/**
		 *  初始化菜单
		 */		
		private function initMenu():void
		{
			var str:String = BrowerManager.instance.isNet?(prefixStr + "menu.xml"): "menu.xml" ; 
			var urlLoader:URLLoader = new URLLoader();
			var req:URLRequest = new URLRequest(str);
			urlLoader.addEventListener(Event.COMPLETE,loadComplate);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR,loadError);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadError);
			urlLoader.load(req);
		}
		/**
		 * 菜单xml 加载失败，使用默认菜单 
		 * @param event
		 */		
		private function loadError(event:*):void
		{
			var name:String = "官网" ;
			var link:String = "http://www.thinkido.com/" ;
			createMenu(name,link);
		}
		
		private function loadComplate(event:Event):void
		{
			var _xml:XML = new XML((event.target as URLLoader).data) ;
			for each(var item:XML in _xml.menu ) 
			{
				createMenu(String(item.@name),String(item.@link),String(item.@type));
			}
//			按钮动画,从左到右依次出现
			var len:int = box.numChildren ;
			var btn:GButton ;
			var _x:int ;
			var _y:int ;
			var before:Function = function (tar:GButton):void{
				tar.visible = true ;
			}
			var _time:Number = 0.5 ;
			for (var i:int = len -1; i >= 0 ; i-- ) 
			{
				btn = box.getChildAt(i) as GButton ;
				btn.visible = false ;
				btn.x += btn.width;
				TweenLite.to( btn ,_time,{x: btn.x - btn.width ,delay:_time * (len -1 - i) , onStart : before ,onStartParams:[btn]} ) ;
			}
		}
		/**
		 * 按钮容器 
		 */		
		private var box:Sprite ;
		/**
		 * 按钮数目 
		 */		
		private var buttonNum:int = 0 ;
		/**
		 * 按钮链接信息 
		 */		
		private var linkObj:Object = {} ;
		/**
		 * url使用打开新窗口，
		 * event 使用EventDispatchHelper.dispatchEvent 派发，EventDispatchCenter.getInstance().addEvent
		 * @param name 按钮label
		 * @param link 按钮链接或者event字符串
		 * @param type 链接类型，url 或者 event
		 * 
		 */		
		public function createMenu(name:String,link:String,type:String="url"):void{
			if( box == null ){
				box = new Sprite() ;
				addChild(box);
			}
			var btn:GButton = createBtn(name);
			btn.x = buttonNum * 50 ;
			box.addChild(btn);
			buttonNum ++ ;
			box.x = stage.stageWidth - box.width + 35 ;
			if( !box.hasEventListener(MouseEvent.CLICK)  ){
				box.addEventListener(MouseEvent.CLICK,menuclick);
			}
			linkObj[name] = {name:name,link:link,type:type} ;
		}
		private const LinkType_URL:String = "url" ;
		private const LinkType_Event:String = "event" ;
		private function menuclick(event:MouseEvent):void
		{
			var btn:GButton = event.target as GButton ;
			if( btn == null ){
				return ;
			}
			var key:String = btn.label ;
			key = StringHelper.trim(key);
			var obj:Object = linkObj[key] ;
			if( obj == null ){
				return ;
			}
			var url:String = obj.link ;
			if( obj.type == LinkType_URL ){
				BrowerManager.instance.getUrl(url,"_blank");
			}else{
				EventDispatchHelper.dispatchEvent(new DataEvent(obj.link));
			}
			tracker.trackEvent("Example","Menu",key) ;
		}
		
		/**
		 * 每次添加内容放在 logo下面 
		 * @param child
		 * @return 
		 * 
		 */		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			var index:int = Math.max(0,this.numChildren - 1) ;
			return addChildAt(child,index);
		}

	}
}