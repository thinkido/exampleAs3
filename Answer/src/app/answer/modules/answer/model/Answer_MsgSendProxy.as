package app.answer.modules.answer.model
{
    import org.puremvc.as3.multicore.patterns.proxy.Proxy;

    public class Answer_MsgSendProxy extends Proxy
    {
        public static const NAME:String = "Answer_MsgSendProxy";

        public function Answer_MsgSendProxy($proxyName:String = null, $data:Object = null)
        {
            super(NAME);
            return;
        }

    }
}
