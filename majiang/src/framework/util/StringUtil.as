package framework.util
{
	public class StringUtil
	{
		public function StringUtil()
		{
		}
		/**
		 * 格式化字符串，替换符用%s表示
		 * @param str
		 * @param repls
		 * @return
		 */
		static public function format(str:String,repls:Array):String
		{			
			for(var i:int = 0; i < repls.length; i++)
			{
				str = replace(str, "%s", repls[i], false);
			}
			return str;		
		}
		/**
		 * 替换字符串中的字符
		 * 
		 * @param str 字符串源
		 * @param p 要替换的字符串
		 * @param repl 替换成的字符串
		 * @param global 替换所有匹配的，或者替换第一个匹配的
		 * @return
		 */
		static public function replace(str:String, p:String, repl:String, global:Boolean):String
		{
			var index:int = 0;
			do
			{
				var si:int = str.indexOf(p, index);
				if(-1 == si)
				{
					break;
				}
				var ei:int = si + p.length;
				str = str.substring(0, si) + repl + str.substring(ei);
				index = si + repl.length;
				
			} while(global);
			return str;
		}
		
	}
}