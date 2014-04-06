package app.answer.modules.loadRes.controller
{
	import app.answer.modules.loadRes.LoadRes_ApplicationFacade;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

    public class LoadRes_ShutdownCommand extends SimpleCommand
    {

        public function LoadRes_ShutdownCommand()
        {
            return;
        }

        override public function execute(param1:INotification) : void
        {
            facade.removeCommand(LoadRes_ApplicationFacade.LOAD_XML);
            return;
        }

    }
}
