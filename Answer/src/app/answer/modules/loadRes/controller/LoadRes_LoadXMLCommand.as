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
	import flash.utils.ByteArray;
	
	import org.puremvc.as3.multicore.interfaces.*;
	import org.puremvc.as3.multicore.patterns.command.*;
	
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
			var ques:String = ResPathManager.getUIPath() ;
//			var ques:String = ResPathManager.getQuestionPath() ;
			var ld:LoadData = new LoadData(ques,uiLoadCom,null,err);
			RslLoaderManager.load([ld]);
		}
		
		private function err(ld:LoadData,evt:*):void
		{
			trace(1);
		}
		
		private var configLoader:BulkLoader ;
		private function uiLoadCom(ld:LoadData,evt:*):void
		{
			var ques:String = ResPathManager.getQuestionPath() ;
			var ld:LoadData = new LoadData(ques,quesLoadCom,null,err,"",ques);
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
		}

    }
}
