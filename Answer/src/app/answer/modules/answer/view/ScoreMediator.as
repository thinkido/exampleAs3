package app.answer.modules.answer.view
{
	import app.answer.manager.POPWindowManager;
	import app.answer.modules.answer.Answer_ApplicationFacade;
	import app.answer.modules.answer.model.AnswerModel;
	
	import com.thinkido.framework.common.timer.vo.TimerData;
	import com.thinkido.framework.manager.TimerManager;
	
	import lm.components.window.WindowEvent;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class ScoreMediator extends Mediator
	{
		public static const NAME:String = "Answer_ScoreMediator";
		
		public function ScoreMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			initEvt();
			initUi();
		}
		
		private function initUi():void
		{
			 
		}
		private var td:TimerData ;
		private var model:AnswerModel = AnswerModel.getInstance() ;
		private function initEvt():void
		{
			panel.addEventListener(WindowEvent.CLOSE, closePanel);		
		}
		
		private function closePanel(event:WindowEvent = null):void
		{
			clearTd();
			if( panel.parent != null ){
				panel.parent.removeChild(panel ) ;
			}
			facade.sendNotification(Answer_ApplicationFacade.SHOW_Answer_PANEL);
//			POPWindowManager.showModule(Answer_ApplicationFacade.NAME, Answer_ApplicationFacade.SHOW_Answer_PANEL);
		}

		private function clearTd():void
		{
			if( td != null ){
				TimerManager.deleteTimer(td) ;
				td = null ;
			}
		}

		
		protected function get panel() : ScorePanel
		{
			return viewComponent as ScorePanel;
		}
		
		override public function onRegister() : void
		{
			return;
		}
		
		override public function listNotificationInterests() : Array
		{
			return [Answer_ApplicationFacade.SHOW_SCORE_PANEL];
		}
		
		override public function handleNotification($noti:INotification) : void
		{
			switch($noti.getName())
			{
				case Answer_ApplicationFacade.SHOW_SCORE_PANEL:
					showPanel();
					break ;
				default:
				{
					break;
				}
			}
			return ;
		}
		
		private function showPanel():void
		{
			POPWindowManager.centerWindow(panel, null, Answer_ApplicationFacade.NAME);
			start() ;
			panel.scoreTxt.text = "总分：" + model.score ;
		}
		
		private function start():void
		{
			clearTd();
			td = TimerManager.createTimer(3000,1,autoClose);
		}
		
		private function autoClose():void
		{
			closePanel();
		}
		
	}
}