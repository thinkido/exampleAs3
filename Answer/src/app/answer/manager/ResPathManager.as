package app.answer.manager
{
	import app.answer.common.GameConfig;

	public class ResPathManager
	{
		
		private static const _question:String = "assets/question.xml" ;
		private static const _uiLib:String = "assets/useUI.swf" ;
		
		public function ResPathManager()
		{
		}
		
		public static function getQuestionPath():String{
			var temp:String = GameConfig.filePath != "" ? GameConfig.filePath :_question
			return GameConfig.fileBaseFolder + temp ;
		}
		public static function getUIPath():String{
			
			return GameConfig.fileBaseFolder + _uiLib ;
		}
			
	}
}