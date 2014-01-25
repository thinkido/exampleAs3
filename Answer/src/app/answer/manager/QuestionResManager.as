package app.answer.manager
{
	import app.answer.common.vo.QuestionVo;
	
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
				tempVO.answer = child.@answer ;
				tempVO.desc = child.@desc ;
				tempVO.type = child.@type ;
				tempVO.point = child.@point ;
					
				_questionDic[String(child.@id)] = tempVO;
			}
		}
		
		/***/
		public static function getModuleVO(id:int):QuestionVo
		{
			return _questionDic.hasOwnProperty(id) ? _questionDic[id] : null;
		}


	}
}