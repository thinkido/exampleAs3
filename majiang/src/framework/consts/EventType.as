package framework.consts
{
	public class EventType
	{
		/**
		 * 舞台进入新的一帧
		 */
		static public const EVENT_STAGE_ENTER_FRAME:int = 1;
		
		/**
		 * 键盘按下事件
		 */
		static public const EVENT_KEY_PRESSED:int = 2;
		
		/**
		 * 键盘弹起事件
		 */
		static public const EVENT_KEY_RELEASEED:int = 3;
		
		/**
		 * Tween结束事件
		 */
		static public const EVENT_TWEEN_COMPLETE:int = 4;
		
		/**
		 * MC又从头开始播放了
		 */
		static public const EVENT_MOVIE_CLIP_RESTART:int = 5;
		
		/**
		 * 时间，Loader加载完成
		 */
		static public const EVENT_LOAD_COMPLETE:int = 6;
		public function EventType()
		{
		}
	}
}