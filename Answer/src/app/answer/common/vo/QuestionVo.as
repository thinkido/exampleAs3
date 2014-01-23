package app.answer.common.vo
{
	public class QuestionVo
	{
		private var id:int = 0 ;
		private var title:String ="" ;
		private var type:int = 0 ;
		private var answer:int = 0 ;
		private var a:String = "" ;
		private var b:String = "" ;
		private var c:String = "" ;
		private var d:String = "" ;
		private var dics:String = "" ;
		
		/**
		 *判断题 
		 */		
		public static const JUEST:int = 2 ;
		/**
		 *多选 
		 */		
		public static const SELECT_MIUTIPLE:int = 1 ;
		/**
		 * 单选 
		 */		
		public static const SELECT_SINGLE:int = 0 ;
		
		public function QuestionVo()
		{
		}
	}
}