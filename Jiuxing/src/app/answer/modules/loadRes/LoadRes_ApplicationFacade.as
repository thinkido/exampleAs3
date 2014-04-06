package app.answer.modules.loadRes
{
    import app.answer.PipeEvent;
    import app.answer.manager.PipeManager;
    import app.answer.modules.loadRes.controller.LoadRes_ShutdownCommand;
    import app.answer.modules.loadRes.controller.LoadRes_StartupCommand;
    
    import com.thinkido.framework.common.observer.Notification;
    
    import org.puremvc.as3.multicore.patterns.facade.*;

    public class LoadRes_ApplicationFacade extends Facade
    {
        public static const NAME:String = "app.answer.modules.loadRes.LoadRes_ApplicationFacade";
        public static const STARTUP:String = "STARTUP";
        public static const SHUTDOWN:String = "SHUTDOWN";
        public static const LOAD_LAN:String = "LOAD_LAN";
        public static const LOAD_CONFIG:String = "LOAD_CONFIG";
        public static const LOAD_SKIN:String = "LOAD_SKIN";
        public static const LOAD_LOGIN:String = "LOAD_LOGIN";
        public static const LOAD_RSL:String = "LOAD_RSL";
        public static const LOAD_XML:String = "LOAD_XML";

        public function LoadRes_ApplicationFacade($key:String)
        {
            super($key);
            PipeManager.registerMsg(PipeEvent.STARTUP_LOADRES, this.handlePipeMessage, LoadRes_ApplicationFacade);
            return;
        }

        public function dispose() : void
        {
            this.shutdown();
            PipeManager.removeMsg(PipeEvent.STARTUP_LOADRES, LoadRes_ApplicationFacade);
            Facade.removeCore(LoadRes_ApplicationFacade.NAME);
            return;
        }

        override protected function initializeController() : void
        {
            super.initializeController();
            registerCommand(STARTUP, LoadRes_StartupCommand);
            registerCommand(SHUTDOWN, LoadRes_ShutdownCommand);
            return;
        }

        private function handlePipeMessage(param1:Notification) : void
        {
            var _loc_2:* = param1.body;
            switch(param1.name)
            {
                case PipeEvent.STARTUP_LOADRES:
                {
					sendNotification(STARTUP, _loc_2);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }

        private function startup() : void
        {
            sendNotification(STARTUP);
            return;
        }

        private function shutdown() : void
        {
            sendNotification(SHUTDOWN);
            return;
        }

        public static function getInstance() : LoadRes_ApplicationFacade
        {
            if (instanceMap[NAME] == null)
            {
                instanceMap[NAME] = new LoadRes_ApplicationFacade(NAME);
            }
            return instanceMap[NAME] as LoadRes_ApplicationFacade;
        }

    }
}
