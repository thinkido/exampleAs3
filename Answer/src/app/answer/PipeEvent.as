package app.answer
{
	/**
	 * 作用：减少各个模块间事件的引用，便于随时独立模块，
	 * @author Administrator
	 * 
	 */	
	public class PipeEvent
	{
		
		public static const STARTUP_SHELL:String = "app.answer.modules.shell.Shell_ApplicationFacade";
		
		public static const SHOW_Answer_PANEL:String = "SHOW_ANSWER_PANEL";
		
		public static const STARTUP_LOADRES:String = "app.answer.modules.loadRes.LoadRes_ApplicationFacade";
		public static const STARTUP_Answer:String = "app.answer.modules.answer.Answer_ApplicationFacade";
		
		
		public function PipeEvent()
		{
			
		}
	}
}