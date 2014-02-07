package app.answer.modules.answer.model
{
	import app.answer.common.vo.QuestionVo;
	
	import game.utils.bind.Data;

	public class AnswerModel extends Data
	{
		public function AnswerModel()
		{
		}
		private static var _inst:AnswerModel  ;
		public static function getInstance():AnswerModel{
			if( _inst == null ){
				_inst = new AnswerModel() ;
			}
			return _inst ;
		}
		/**
		 * 显示计时数字 
		 */		
		public var  showTimeCount:int = 600 ;
		/**
		 * 总时长 
		 */		
		public var showTime:int = 600 ;
		
		public var currIndex:int = 1 ;
		public var total:int = 1 ;
		public var score:int = 0 ;
		
		public var currVo:QuestionVo ;
		public var notSure:Boolean = false ;
		public var autoJump:Boolean = false ;
		public var showAnswer:Boolean = false ;
		
		public var rightArr:Array = [];
		public var signArr:Array = [];
		
		public var jumpTime:Number = 1000;
		public var jumpNeedTime:Number = 500;
		public var showAnswerNeedTime:int = 2000 ;
		
		public var comment:String = "" ;
		
		public var analyze:Array = [] ;
		private var errorStr:String = "你简直太强了，超过了系统最高分！你是个Bug";
		
		protected override function getProperty($name:String):*
		{
			return super.getProperty($name);
		}

		protected override function setProperty($name:String, $value:*):void
		{
			super.setProperty($name,$value);
		}
		
		public function getScoreTxt($score:int):String{
			var temp:String = "" ;
			analyze.sortOn("score",Array.NUMERIC|Array.DESCENDING);
			for each(var item:* in analyze) 
			{
				if($score < int(item.score)){
					temp = item.txt ;
				}else{
					break ;
				}
			}
			if(temp.length == 0 ){
				temp = errorStr ;
			}
			return temp;
		}


	}
}