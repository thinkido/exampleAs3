package app.answer.modules.loadRes.controller
{
	import app.answer.modules.loadRes.LoadRes_ApplicationFacade;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

    public class LoadRes_StartupCommand extends SimpleCommand
    {

        public function LoadRes_StartupCommand()
        {
            return;
        }

        override public function execute(param1:INotification) : void
        {
            facade.registerCommand(LoadRes_ApplicationFacade.LOAD_XML, LoadRes_LoadXMLCommand);
//			有修改
            sendNotification(LoadRes_ApplicationFacade.LOAD_XML, param1.getBody());
        }

    }
}
