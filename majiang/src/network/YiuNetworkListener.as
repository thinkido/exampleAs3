package network
{
	import flash.utils.ByteArray;
	
	/**
	 *
	 * @author jmulro
	 */
	public interface YiuNetworkListener {
		/**
		 * @return true: 继续分发此消息.  false: 不再分发此消息
		 */
//		function onNetworkEvent( name:String, content:ByteArray):Boolean;
		function onNetworkEvent( name:String, content:ByteArray):Boolean;
	}
}
