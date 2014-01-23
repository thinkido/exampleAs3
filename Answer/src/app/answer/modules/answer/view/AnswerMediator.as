package app.answer.modules.answer.view
{
	import app.answer.PipeEvent;
	import app.answer.manager.POPWindowManager;
	import app.answer.modules.answer.Answer_ApplicationFacade;
	import app.answer.modules.answer.model.Answer_MsgSendProxy;
	
	import lm.components.window.WindowEvent;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;

	public class AnswerMediator extends Mediator
	{

		private var _msgSenderProxy:Answer_MsgSendProxy;
		public static const NAME:String = "Answer_AnswerMediator";

		public function AnswerMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
			initEvt();
		}
		
		private function initEvt():void
		{
			panel.addEventListener(WindowEvent.CLOSE, closePanel);			
		}
		private function closePanel(event:WindowEvent = null):void
		{
			POPWindowManager.showModule(Answer_ApplicationFacade.NAME, Answer_ApplicationFacade.SHOW_Answer_PANEL);
		}
		
		protected function get panel() : AnswerPanel
		{
			return viewComponent as AnswerPanel;
		}

		override public function onRegister() : void
		{
			return;
		}

		override public function listNotificationInterests() : Array
		{
			return [Answer_ApplicationFacade.SHOW_Answer_PANEL];
		}

		override public function handleNotification($noti:INotification) : void
		{
			switch($noti.getName())
			{
				case Answer_ApplicationFacade.SHOW_Answer_PANEL:
					showPanel();
					break ;
				default:
				{
					break;
				}
			}
			return;
		}
		
		private function showPanel():void
		{
			POPWindowManager.centerWindow(panel, null, Answer_ApplicationFacade.NAME);
			
		}
		
		private function get msgSenderProxy() : Answer_MsgSendProxy
		{
			if (this._msgSenderProxy == null)
			{
				this._msgSenderProxy = facade.retrieveProxy(Answer_MsgSendProxy.NAME) as Answer_MsgSendProxy;
			}
			return this._msgSenderProxy;
		}
	}
}