package app.answer.modules.answer.model
{
    import app.answer.manager.NetWorkManager;
    
    import com.thinkido.framework.common.observer.Notification;
    import com.thinkido.framework.net.NProtocol;
    
    import org.osflash.thunderbolt.Logger;
    import org.puremvc.as3.multicore.patterns.proxy.Proxy;
    

    public class Answer_MsgReceivedProxy extends Proxy
    {
        private var _msgSenderProxy:Answer_MsgSendProxy;
        public static const NAME:String = "Answer_MsgReceivedProxy";

        public function Answer_MsgReceivedProxy()
        {
            super(NAME, null);
            return;
        }

        override public function onRegister() : void
        {
            NetWorkManager.registerMsgs([], this.receivedMsgHandle, NAME);
            return;
        }

        override public function onRemove() : void
        {
            NetWorkManager.removeMsgs([], NAME);
            return;
        }

        private function get msgSenderProxy() : Answer_MsgSendProxy
        {
            if (this._msgSenderProxy == null)
            {
                this._msgSenderProxy = facade.retrieveProxy(Answer_MsgSendProxy.NAME) as Answer_MsgSendProxy;
            }
            return this._msgSenderProxy;
        }

        private function receivedMsgHandle($noti:Notification) : void
        {
            var _name:String = $noti.name;
            var _body:Object = ($noti.body as NProtocol).body ;
		    if (this.hasOwnProperty("received_" + _name))
	            {
	                this["received_" + _name](_body);
	            }
	            else
	            {
	                 Logger.info("协议号" + _name + "不存在");
	            }
	            return;
	        }

       

    }
}
