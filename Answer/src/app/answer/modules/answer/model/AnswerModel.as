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
		
		public var  showTimeCount:int = 600 ;
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
		
		protected override function getProperty($name:String):*
		{
			return super.getProperty($name);
		}

		protected override function setProperty($name:String, $value:*):void
		{
			super.setProperty($name,$value);
		}


	}
}