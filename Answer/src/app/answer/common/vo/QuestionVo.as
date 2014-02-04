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
		
		public var selected:String = "" ;
		public var notSure:Boolean = false ;
		
		
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
		/**
		 * 查看答案是否选择 
		 * @param answer 答案，如A、B、C、D
		 * @return 
		 * 判断题、单选、多选
		 */		
		public function isSelected(answer:String):Boolean{
			var temp:Boolean = false ;
			temp = selected.indexOf(answer) != -1 ;
			return temp ;
		}
		public function isRight():Boolean{
			return selected == answer;
		}
		public function QuestionVo()
		{
		}
	}
}