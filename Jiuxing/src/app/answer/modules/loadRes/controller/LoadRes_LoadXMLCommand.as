package app.answer.modules.loadRes.controller
{
	import app.answer.PipeEvent;
	import app.answer.manager.FacadeManager;
	import app.answer.manager.QuestionResManager;
	import app.answer.manager.ResPathManager;
	import app.answer.modules.loadRes.LoadRes_ApplicationFacade;
	
	import br.com.stimuli.loading.BulkLoader;
	
	import com.thinkido.framework.common.privatehome.PrivateHome;
	import com.thinkido.framework.manager.RslLoaderManager;
	import com.thinkido.framework.manager.loader.LoaderManager;
	import com.thinkido.framework.manager.loader.vo.LoadData;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class LoadRes_LoadXMLCommand extends SimpleCommand
	{
		private static var privateHome:PrivateHome = new PrivateHome();
		private var lastBytes:int;
		private var during:int = 0;
		
		public function LoadRes_LoadXMLCommand()
		{
			return;
		}
		
		override public function execute(param1:INotification) : void
		{
			var uiUrl:String = ResPathManager.getUIPath() ;
			var ld:LoadData = new LoadData(uiUrl,uiLoadCom,null,err);
			RslLoaderManager.load([ld]);
		}
		
		private function err(...args):void
		{
			trace(1);
		}
		
		private var configLoader:BulkLoader ;
		private function uiLoadCom(ld:LoadData,evt:*):void
		{
			var quesXmlUrl:String = ResPathManager.getQuestionPath() ;
			var ld:LoadData = new LoadData(quesXmlUrl,quesLoadCom,null,err,"",quesXmlUrl);
			ld.userData.type = BulkLoader.TYPE_XML ;
			configLoader = new BulkLoader("config");
			LoaderManager.load([ld],configLoader) ;
		}
		private function quesLoadCom(evt:Event):void
		{
			var data:ByteArray = configLoader.getContent(ResPathManager.getQuestionPath())  ;
			var str:String = data.readUTFBytes(data.length) ;
			var xml:XML = new XML( str ) ;
			QuestionResManager.parseXML(xml);
			this.sendNotification(LoadRes_ApplicationFacade.SHUTDOWN);
			FacadeManager.startupFacade(PipeEvent.STARTUP_Answer,PipeEvent.SHOW_Answer_PANEL);
			FacadeManager.startupFacade(PipeEvent.STARTUP_MainUi,PipeEvent.SHOW_Link_PANEL);
		}

    }
}
