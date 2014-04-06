package app.answer.modules.mainui
{
	
	import app.answer.PipeEvent;
	import app.answer.manager.PipeManager;
	import app.answer.modules.mainui.controller.MainUi_StartupCommand;
	
	import com.thinkido.framework.common.observer.Notification;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class MainUi_ApplicationFacade extends Facade
	{

		public static const NAME:String = "app.answer.modules.mainui.MainUi_ApplicationFacade";
		public static const STARTUP:String = "STARTUP";
		public static const SHOW_Link_PANEL:String = "SHOW_Link_PANEL";

		public function MainUi_ApplicationFacade(param1:String)
		{
			super(param1);
			PipeManager.registerMsgs([PipeEvent.STARTUP_MainUi,PipeEvent.SHOW_Link_PANEL], this.handlePipeMessage, MainUi_ApplicationFacade);
			return;
		}

		override protected function initializeController() : void
		{
			super.initializeController();
			registerCommand(STARTUP, MainUi_StartupCommand);
			return;
		}
		
		private function handlePipeMessage(param1:Notification) : void
		{
			var _loc_2:Object = null;
			var _loc_3:Boolean = false;
			_loc_2 = param1.body;
			switch(param1.name)
			{
//				case PipeEvent.SHOW_MainUi_PANEL:
//					sendNotification(MainUi_ApplicationFacade.SHOW_MainUi_PANEL,_loc_2) ;
//					break ;
				case PipeEvent.STARTUP_MainUi:
					startup() ;
					break ;
				default :
					break;
			}
		}
		
		private function startup() : void
		{
			sendNotification(STARTUP);
			sendNotification(MainUi_ApplicationFacade.SHOW_Link_PANEL) ;
			return;
		}
		
		public static function getInstance() : MainUi_ApplicationFacade
		{
			if (instanceMap[NAME] == null)
			{
				instanceMap[NAME] = new MainUi_ApplicationFacade(NAME);
			}
			return instanceMap[NAME] as MainUi_ApplicationFacade;
		}
		
		public function dispose():void
		{
//			var mediator:MainUiMediator = this.retrieveMediator(MainUiMediator.NAME) as MainUiMediator;
//			var ui:MainUiPanel = mediator.getViewComponent() as MainUiPanel;
//			if (ui && ui.parent)
//			{
//				POPWindowManager.removeSmallWindow(ui, NAME);
//			}
		}
	}
}