package network
{
	
	
	
	import com.thinkido.framework.utils.ArrayUtil;
	
	import flash.utils.ByteArray;
	
	/**
	 * @author jmulro
	 */
	public class YiuNetworkHandlerMgr
	{
	
		protected static var mListeners:Array = [];
	
		public static function processPacket(name:String, packet:ByteArray):void
		{
			trace("Got Proto Name: " + name);
			var len:int = mListeners.length;
			for(var index:int = 0; index < len; index++)
			{
				var listener:YiuNetworkListener = mListeners[index] as YiuNetworkListener;
				if(listener != null)
				{
					if(!listener.onNetworkEvent(name, packet))
						break;
				}
			}
		}
	
		public static function subscribe(listener:YiuNetworkListener):void
		{
			if(mListeners.indexOf(listener) != -1)
				return;
	
			mListeners.push(listener);
		}
	
		public static function unSubscribe(listener:YiuNetworkListener):void
		{
//			mListeners.removeElement(listener);
			ArrayUtil.removeItem( mListeners , listener );
		}
	}
}
