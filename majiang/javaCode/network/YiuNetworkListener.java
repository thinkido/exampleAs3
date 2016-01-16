package network;
import net.jarlehansen.protobuf.javame.ByteString;

/**
 *
 * @author jmulro
 */
public interface YiuNetworkListener {
	/**
     * @return true: 继续分发此消息.  false: 不再分发此消息
     */
    public boolean onNetworkEvent(String name, ByteString content);
}
