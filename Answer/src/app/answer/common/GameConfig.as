package app.answer.common
{
	
	public class GameConfig extends Object
	{
		public static var frameRate:int = 60;
		public static var sceneWidth:int;
		public static var sceneHeight:int;
		public static var fileBaseFolder:String = "" ;
		public static var filePath:String;
		public static var serverUrl:String;
		public static var gameId:String;
		public static var program:String;
		public static var config:String;
		public static var flashParameters:Object;
		public static var decode:Function;
		public static var activeServer:String;
		public static var resServer:String;
		
		public function GameConfig()
		{
			return;
		}
	}
}