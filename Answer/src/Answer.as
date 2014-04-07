package
{
	import app.answer.PipeEvent;
	import app.answer.common.GameInstance;
	import app.answer.manager.FacadeManager;
	import app.answer.manager.layer.LayerManager;
	import app.answer.modules.answer.view.ScorePanel;
	import app.answer.modules.mainui.view.LinkPanel;
	
	import com.google.analytics.AnalyticsTracker;
	import com.google.analytics.GATracker;
	import com.style.GlobalSkin;
	import com.thinkido.example.Application;
	import com.thinkido.framework.common.Global;
	import com.thinkido.framework.display.RepeatImage;
	import com.thinkido.framework.manager.BrowerManager;
	import com.thinkido.framework.manager.MenuManager;
	import com.thinkido.framework.manager.TimerManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.system.Security;
	import flash.utils.setTimeout;
	
	import ui.progress.WelcomeProgress;

	[SWF(width="800",height="500",backgroundColor="#333333",frameRate="30")]
	public class Answer extends Application
	{
		[Embed(source="../asset/focusTile.png",mimeType="image/png")]
		private var FocusImgClass:Class ;
		[Embed(source="../asset/TitleWindow_BG.png",mimeType="image/png")]
		private var TitleWindowClass:Class ;
		private var focusImg:RepeatImage ;
		
		public static const version:String = "1.0.2" ;
		private static const website:String = "http://www.thinkido.com";
		private static const qqStr:String = "http://wpa.qq.com/msgrd?v=3&uin=5526555&site=qq&menu=yes";
		
		private var tracker:AnalyticsTracker ;
		private var bg:RepeatImage ;
		
		public function Answer()
		{
			defaultSkin =  false ;
		}
		
		protected override function initApp():void
		{
			bg = new RepeatImage() ;
			bg.bitmapData = Bitmap(new TitleWindowClass()).bitmapData;
			addChild(bg);
			bg.width = stage.stageWidth ;
			bg.height = stage.stageHeight ;
			
			var app:com.thinkido.framework.common.Application = new com.thinkido.framework.common.Application();
			Global.application = app ;
			addChild(app);
			
			this.initMenu();
			this.initStage();
			GlobalSkin.initStyleSkin();
			GameInstance.stage = stage;
			
			tracker = new GATracker( this, "UA-40324677-1", "AS3", false );
			tracker.trackPageview("/answer");
			
			LayerManager.init() ;
			
			startbefore();
		}
		
		private function startbefore():void
		{
			var wel:WelcomeProgress = new WelcomeProgress();
			wel.addEventListener(WelcomeProgress.CARTOON_END,removeWel);
			addChild(wel) ;
			wel.start(2,3);
			setTimeout(doStart,2000);
			function doStart():void
			{
				startup() ;
			}
			function removeWel():void
			{
				removeChild(wel) ;
			}
			
		}
		
		private function initMenu() : void
		{
			MenuManager.instance.initMenu(this);
			MenuManager.instance.addItem("v"+version);
			MenuManager.instance.addItem("thinkido.com",gotoWebsite);
			MenuManager.instance.addItem("QQ:5526555",openQQ);
			return;
		}
		
		private function openQQ():void
		{
			BrowerManager.instance.getUrl(qqStr,"_blank");
		}
		
		private function gotoWebsite():void
		{
			BrowerManager.instance.getUrl(website,"_blank");
		}
		
		private function initStage():void{
			Security.allowDomain("*");
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.tabChildren = false;
			stage.stageFocusRect = false;			
		}
		private function initGa():void
		{
			TimerManager.createTimer(300000,int.MAX_VALUE,trakerGa);
		}
		private function trakerGa():void
		{
			tracker.trackEvent("alive","auto","main");
		}
		
		private function startup():void
		{
			var obj:Object = stage.loaderInfo.parameters;
			
			var param:Object = {};
			param.baseDir = obj.baseDir;
			param.config = obj.config;
			param.program = obj.program;
			param.filePath = obj.filePath ;
			
			FacadeManager.startupFacade(PipeEvent.STARTUP_SHELL, {parameters:param, decode:null});
			FacadeManager.startupFacade(PipeEvent.STARTUP_LOADRES,null);
		}
		
	}
}