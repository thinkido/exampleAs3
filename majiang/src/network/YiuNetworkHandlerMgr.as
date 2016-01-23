package network
{
	
	import game.control.LogManager;
	
	import java.util.Vector;
	
	import net.jarlehansen.protobuf.javame.ByteString;
	
	/**
	 * @author jmulro
	 */
	public class YiuNetworkHandlerMgr
	{
	
		protected static var mListeners:Array = [];
	
		public static function processPacket(name:String, packet:ByteString):void
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
			if(mListeners.contains(listener))
				return;
	
			mListeners.addElement(listener);
		}
	
		public static function unSubscribe(listener:YiuNetworkListener):void
		{
			mListeners.removeElement(listener);
		}
	}
}
