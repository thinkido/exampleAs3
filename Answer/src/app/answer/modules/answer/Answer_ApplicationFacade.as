package app.answer.modules.answer
{
	import app.answer.PipeEvent;
	import app.answer.manager.POPWindowManager;
	import app.answer.manager.PipeManager;
	import app.answer.manager.layer.LayerManager;
	import app.answer.modules.answer.controller.Answer_StartupCommand;
	import app.answer.modules.answer.view.AnswerMediator;
	import app.answer.modules.answer.view.AnswerPanel;
	
	import com.greensock.TweenLite;
	import com.thinkido.framework.common.observer.Notification;
	import com.thinkido.framework.manager.TimerManager;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class Answer_ApplicationFacade extends Facade
	{

		public static const NAME:String = "app.answer.modules.answer.Answer_ApplicationFacade";
		public static const STARTUP:String = "STARTUP";
		public static const SHOW_Answer_PANEL:String = "SHOW_Answer_PANEL";

		public static const SHOW_SCORE_PANEL:String = "Show_Score_Panel" ;
		
		public function Answer_ApplicationFacade(param1:String)
		{
			super(param1);
			PipeManager.registerMsgs([PipeEvent.STARTUP_Answer,PipeEvent.SHOW_Answer_PANEL], this.handlePipeMessage, Answer_ApplicationFacade);
			return;
		}

		override protected function initializeController() : void
		{
			super.initializeController();
			registerCommand(STARTUP, Answer_StartupCommand);
			return;
		}
		
		private function handlePipeMessage(param1:Notification) : void
		{
			var _loc_2:Object = null;
			var _loc_3:Boolean = false;
			_loc_2 = param1.body;
			switch(param1.name)
			{
//				case PipeEvent.SHOW_Answer_PANEL:
//					sendNotification(Answer_ApplicationFacade.SHOW_Answer_PANEL,_loc_2) ;
//					break ;
				case PipeEvent.STARTUP_Answer:
					startup() ;
					break ;
				default :
					break;
			}
		}
		
		private function startup() : void
		{
			sendNotification(STARTUP);
			sendNotification(Answer_ApplicationFacade.SHOW_Answer_PANEL) ;
			return;
		}
		
		public static function getInstance() : Answer_ApplicationFacade
		{
			if (instanceMap[NAME] == null)
			{
				instanceMap[NAME] = new Answer_ApplicationFacade(NAME);
			}
			return instanceMap[NAME] as Answer_ApplicationFacade;
		}
		
		public function dispose():void
		{
			var mediator:AnswerMediator = this.retrieveMediator(AnswerMediator.NAME) as AnswerMediator;
			var ui:AnswerPanel = mediator.getViewComponent() as AnswerPanel;
			if (ui && ui.parent)
			{
				var removeWindow:Function = function():void{
					LayerManager.effectLayer.removeChild(bm);
				}
				POPWindowManager.removeSmallWindow(ui, NAME);
				var bmd:BitmapData = new BitmapData(ui.width,ui.height,true,0x00ffffff);
				bmd.draw(ui);
				var bm:Bitmap = new Bitmap(bmd);
				bm.x = ui.x ;
				bm.y = ui.y ;
				LayerManager.effectLayer.addChild(bm);
				TweenLite.to(bm,0.6,{x:50,y:100,width:bm.width/10,height:bm.height/10,alpha:0.3,onComplete:removeWindow}) ;
			}
		}
	}
}