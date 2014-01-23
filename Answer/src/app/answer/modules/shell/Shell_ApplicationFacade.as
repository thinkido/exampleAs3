package app.answer.modules.shell
{
	import app.answer.PipeEvent;
	import app.answer.manager.PipeManager;
	import app.answer.modules.shell.controller.Shell_StartupCommand;
	
	import com.thinkido.framework.common.observer.Notification;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class Shell_ApplicationFacade extends Facade
	{
		public static const NAME:String = "game.shell.Shell_ApplicationFacade";
		public static const STARTUP:String = "STARTUP";
		
		public function Shell_ApplicationFacade(param1:String)
		{
			super(param1);
			PipeManager.registerMsgs([PipeEvent.STARTUP_SHELL], this.handlePipeMessage, Shell_ApplicationFacade);
			return;
		}
		
		public function dispose() : void
		{
			PipeManager.removeMsgs([PipeEvent.STARTUP_SHELL], Shell_ApplicationFacade);
			Facade.removeCore(Shell_ApplicationFacade.NAME);
			return;
		}
		
		override protected function initializeController() : void
		{
			super.initializeController();
			registerCommand(STARTUP, Shell_StartupCommand);
			return;
		}
		
		private function handlePipeMessage(param1:Notification) : void
		{
			var _loc_2:* = param1.body;
			switch(param1.name)
			{
				case PipeEvent.STARTUP_SHELL:
				{
					this.startup(_loc_2.parameters, _loc_2.decode);
					break;
				}
				default:
				{
					break;
				}
			}
			return;
		}
		
		private function startup(param1:Object, param2:Function = null) : void
		{
			sendNotification(STARTUP, {parameters:param1, decode:param2});
			return;
		}
		
		public static function getInstance() : Shell_ApplicationFacade
		{
			if (instanceMap[NAME] == null)
			{
				instanceMap[NAME] = new Shell_ApplicationFacade(NAME);
			}
			return instanceMap[NAME] as Shell_ApplicationFacade;
		}

	}
}