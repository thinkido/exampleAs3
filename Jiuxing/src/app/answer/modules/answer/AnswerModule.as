package app.answer.modules.answer
{
	import flash.display.Sprite;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class AnswerModule extends Sprite
	{

		public function AnswerModule()
		{
			trace(Answer_ApplicationFacade.NAME);
			if (!Facade.hasCore(Answer_ApplicationFacade.NAME))
				new Answer_ApplicationFacade(Answer_ApplicationFacade.NAME);
		}
	}
}