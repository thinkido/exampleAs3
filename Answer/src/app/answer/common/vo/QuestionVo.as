package app.answer.common.vo
{
	public class QuestionVo
	{
		public var id:int = 0 ;
		public var type:int = 0 ;
		public var point:int = 1 ;
		public var title:String ="" ;
		public var answer:String = "" ;
		public var a:String = "" ;
		public var b:String = "" ;
		public var c:String = "" ;
		public var d:String = "" ;
		public var desc:String = "" ;
		
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