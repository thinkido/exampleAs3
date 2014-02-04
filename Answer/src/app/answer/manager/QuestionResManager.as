package app.answer.manager
{
	import app.answer.common.vo.QuestionVo;
	
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
			for each (var child:XML in childs)
			{
				tempVO = new QuestionVo();
				tempVO.id = child.@id ;
				tempVO.title = child.@title ;
				tempVO.a = child.@A ;
				tempVO.b = child.@B ;
				tempVO.c = child.@C ;
				tempVO.d = child.@D ;
				tempVO.answer = String(child.@answer).toLocaleLowerCase() ;
				tempVO.desc = child.@desc ;
				tempVO.type = child.@type ;
				tempVO.point = child.@point ;
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


	}
}