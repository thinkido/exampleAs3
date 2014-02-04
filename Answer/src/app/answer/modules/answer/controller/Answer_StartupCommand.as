package app.answer.modules.answer.controller
{
	import app.answer.modules.answer.model.Answer_MsgReceivedProxy;
	import app.answer.modules.answer.model.Answer_MsgSendProxy;
	import app.answer.modules.answer.view.AnswerMediator;
	import app.answer.modules.answer.view.AnswerPanel;
	import app.answer.modules.answer.view.ScoreMediator;
	import app.answer.modules.answer.view.ScorePanel;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

    public class Answer_StartupCommand extends SimpleCommand
    {

        public function Answer_StartupCommand()
        {
            return;
        }

        override public function execute(_name:INotification) : void
        {
	    	var ui:AnswerPanel = new AnswerPanel();
            facade.registerProxy(new Answer_MsgSendProxy());
            facade.registerProxy(new Answer_MsgReceivedProxy());
            facade.registerMediator(new AnswerMediator(ui));
			
			var score:ScorePanel = new ScorePanel();
			facade.registerMediator( new ScoreMediator(score)) ;
			
            return;
        }

    }
}
