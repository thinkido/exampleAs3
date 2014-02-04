package app.answer.common.vo
{
	import flash.utils.Dictionary;

	public class QuestionVo
	{
		public var id:int = 0 ;
		public var type:int = 0 ;
		public var point:int = 1 ;
		public var title:String ="" ;
		/**
		 * 记录答案和分数 
		 */		
		public var answer:Object = {} ;
		public var a:String = "" ;
		public var b:String = "" ;
		public var c:String = "" ;
		public var d:String = "" ;
		public var e:String = "" ;
		public var desc:String = "" ;
		
		public var selected:String = "" ;
		public var notSure:Boolean = false ;
		
		
		/**
		 *判断题 
		 */		
		public static const JUEST:int = 3 ;
		/**
		 *多选 
		 */		
		public static const SELECT_MIUTIPLE:int = 2 ;
		/**
		 * 单选 
		 */		
		public static const SELECT_SINGLE:int = 1 ;
		/**
		 * 查看答案是否选择 
		 * @param answer 答案，如A、B、C、D
		 * @return 
		 * 判断题、单选、多选
		 */		
		public function isSelected(answer:String):Boolean{
			var temp:Boolean = false ;
			temp = selected.length > 0 ;
			return temp ;
		}
		public function isRight():Boolean{
			var temp:Boolean = false ;
			if( type == SELECT_SINGLE && answer[selected] != undefined ){
				temp = true ;
			}
			return temp;
		}
		private var _answerStr:String = "" ;
		public function getAnswer():String{
			var temp:Array = [] ;
			if( _answerStr == ""){
				for (var key:String in answer) 
				{
					temp.push(key.toUpperCase()) ;
				}
				temp.sort();
				_answerStr = temp.join("或") ;
			}
			return _answerStr ;
		}
		public function getScore():int{
			var temp:int = 0 ;
			if( type == SELECT_SINGLE && answer[selected] != undefined ){
				temp = answer[selected] ;
			}
			return temp ;
		}
		public function QuestionVo()
		{
		}
	}
}