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
			else if( type == SELECT_MIUTIPLE ){
//				多选所有答案一致才算正确
				var tempArr:Array = [];
				var tempStr:String ;
				for (var key:String in answer) 
				{
					tempArr.push(key) ;
				}
				tempArr.sort();
				tempStr = tempArr.join("") ;
				if( selected == tempStr ){
					temp = true ;
				}
			}
			return temp;
		}
		
		/**
		 * 可以是临时变量，这里为了减少字符串生成次数。
		 */
		private var _answerStr:String = "" ;
		/**
		 * @return 获取答案提示字符串
		 */		
		public function getAnswer():String{
			var temp:Array = [] ;
			if( _answerStr == ""){
				for (var key:String in answer) 
				{
					temp.push(key.toUpperCase()) ;
				}
				temp.sort();
				if( type == SELECT_SINGLE ){
					_answerStr = temp.join("或") ;
				}else{
					_answerStr = temp.join("和") ;
				}
			}
			return _answerStr ;
		}
		/**
		 * @return 获取分数
		 */		
		public function getScore():int{
			var temp:int = 0 ;
			if( type == SELECT_SINGLE && answer[selected] != undefined ){
				temp = answer[selected] ;
			}else if( type == SELECT_MIUTIPLE && selected.length > 0){
				var score:int = 0 ;
				var item:String ;
				var minusScore:int ;  //和第一个正确答案的的分数一致
				for (var i:int = 0; i < selected.length ; i++) 
				{
					item = selected.charAt(i) ;
					if( answer[item] != undefined ){
						score += int(answer[item]) ;
						if( minusScore == 0 ){
							minusScore = int(answer[item]);
						}
					}else{
						score -= minusScore ;
					}
				}
				temp = Math.max(0,score) ;
			}
			return temp ;
		}
		public function QuestionVo()
		{
		}
	}
}