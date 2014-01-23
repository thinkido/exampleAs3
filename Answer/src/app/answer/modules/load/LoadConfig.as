package app.answer.modules.load
{
	import com.thinkido.framework.manager.loader.vo.LoadData;

	public class LoadConfig
	{
		public function LoadConfig()
		{
		}
		
		public static function loadDb():void{
			var ld:LoadData = new LoadData("assets/question.xml",loadCom,null);
			
		}
		
		private static function loadCom(ld:LoadData,evt:*):void
		{
			
		}
	}
}