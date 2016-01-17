package managers
{
	
	import flash.display.BitmapData;
	
	import br.com.stimuli.loading.BulkLoader;
	
	import starling.utils.AssetManager;

	public class ResManager
	{
		public function ResManager()
		{
		}
		
		public static const BASE:String = "assets/";
		
		public static const YLXD:String = BASE + "collectcandy.png";
		
		public static const YLXDXML:String = BASE + "collectcandy.xml";
		
		public static const YLXD2:String = BASE + "collectcandy2.png";
		public static const YLXDXML2:String = BASE + "collectcandy2.xml";
		
		public static const CANDYCONFIG:String = BASE + "candyconfig.xml";
		
		public static const YLXD3:String = BASE + "collectcandy3.png";
		public static const YLXDXML3:String = BASE + "collectcandy3.xml";
		
		public static var assetsManager:AssetManager;
		
		public static var resLoader:BulkLoader;
		
		public static var YLXD_NAME:String = "collectcandy";
		public static var YLXD_NAME2:String = "collectcandy2";
		public static var YLXD_NAME3:String = "collectcandy3";
		
		public static const PASS_SOUND:String = BASE + "pass.mp3";
		
		public static const BEYOND_MAX:String = BASE + "win.mp3";
		public static const GAME_OVER:String = BASE + "gameover.mp3";
		public static var backGroundBmd:BitmapData;
		
		public static const BUFF_BASE:String = "buff_";
		
		public static function getResKey(key:String):String
		{
			return key;
//			return LanUtil.isChinese ? key : key+"_en";
		}
	}
}