
package network;

import game.control.LogManager;

import java.util.Vector;

import net.jarlehansen.protobuf.javame.ByteString;

/**
 * @author jmulro
 */
public class YiuNetworkHandlerMgr
{

	protected static Vector mListeners = new Vector();

	public static void processPacket(String name, ByteString packet)
	{
		LogManager.getInstance().log("Got Proto Name: " + name);
		int len = mListeners.size();
		for(int index = 0; index < len; index++)
		{
			YiuNetworkListener listener = (YiuNetworkListener)mListeners.elementAt(index);
			if(listener != null)
			{
				if(!listener.onNetworkEvent(name, packet))
					break;
			}
		}
	}

	public static void subscribe(YiuNetworkListener listener)
	{
		if(mListeners.contains(listener))
			return;

		mListeners.addElement(listener);
	}

	public static void unSubscribe(YiuNetworkListener listener)
	{
		mListeners.removeElement(listener);
	}
}
