package managers
{
	import com.mike.utils.SoundState;
	import com.mike.utils.SoundUtil;
	
	import configs.GameInstance;

	public class SoundManager
	{
		public function SoundManager()
		{
		}
		
		public static function playSound(url:String):void
		{
			if (!GameInstance.instance.soundEnable)
				return;
			SoundUtil.playSound(url);
		}
		
		public static function playLoop(url:String):void
		{
			SoundUtil.playLoopSound(url);
		}
		
		public static function init():void
		{
			playSound(ResManager.BASE+"clickcandy.mp3");
			playSound(ResManager.BASE+"selected.mp3");
			playSound(ResManager.BASE+"daojishi.mp3");
		}
	}
}