package app.answer.manager
{
	import app.answer.common.vo.QuestionVo;
	import app.answer.modules.answer.model.AnswerModel;
	
	import com.thinkido.framework.utils.ArrayUtil;
	
	import flash.utils.Dictionary;

	public class QuestionResManager
	{
		public function QuestionResManager()
		{
		}
		
		/**
		 * 记录已经加载过的文件
		 */		
		private static var _questionDic:Dictionary = new Dictionary();
		
		/***/
		public static function parseXML(data:XML):void
		{
			_len = 0 ;
			_questionDic = new Dictionary() ;
			var childs:XMLList = data.quest ;
			var tempVO:QuestionVo, file:XMLList, c:XML;
			var dic:Object ;
			var temp:String ;
			var tempArr:Array ;
			
			var temp1:String ;
			var tempArr1:Array ;
			AnswerModel.getInstance().showTimeCount = data.@time ;
			for each (var child:XML in childs)
			{
				dic = new Dictionary();
				tempVO = new QuestionVo();
				tempVO.id = child.@id ;
				tempVO.title = child.@title ;
				tempVO.a = child.@A ;
				tempVO.b = child.@B ;
				tempVO.c = child.@C ;
				tempVO.d = child.@D ;
				tempVO.e = child.@E ;
				tempVO.desc = child.@desc ;
				tempVO.type = child.@type ;
				temp = String(child.@answer).toLocaleLowerCase() ; 
				dic = {} ;
				tempArr = temp.split(";") ;
				for (var i:int = 0; i < tempArr.length; i++) 
				{
					tempArr1 = tempArr[i].split(":");
					if( tempArr1.length > 0 ){
						dic[tempArr1[0]] = tempArr1[1] ;
					}
				}
				tempVO.answer = dic ;
				_len += 1 ;	
				_questionDic[String(child.@id)] = tempVO;
			}
		}
		
		private static var _len:int = 0;
		public static function getLength():int{
			return _len ;
		}
		
		public static function getValues():Array{
			return null ;
		}
		public static function getKeys():Array{
			return null ;
		}
		
		/***/
		public static function getModuleVO(id:int):QuestionVo
		{
			return _questionDic.hasOwnProperty(id) ? _questionDic[id] : null;
		}
		/***/
		public static function getQuestion():Dictionary
		{
			return _questionDic;
		}


	}
}