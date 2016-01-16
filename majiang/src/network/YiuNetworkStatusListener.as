package network
{
	
	/**
	 * Created by renjunkun on 5/11/2015.
	 */
	public interface  YiuNetworkStatusListener
	{
	   function onNetworkStatusNotify(socket:YiuNetworkSocket,  status:String ):void;
	}
}
