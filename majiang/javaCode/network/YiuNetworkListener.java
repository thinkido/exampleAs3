package network;
import net.jarlehansen.protobuf.javame.ByteString;

/**
 *
 * @author jmulro
 */
public interface YiuNetworkListener {
	/**
     * @return true: �����ַ�����Ϣ.  false: ���ٷַ�����Ϣ
     */
    public boolean onNetworkEvent(String name, ByteString content);
}