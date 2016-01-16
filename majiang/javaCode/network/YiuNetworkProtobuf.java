package network;

import java.util.Vector;

import protocol.protocol;
import protocol.sc_protocol_pack;


/**
 *
 * @author jmulro
 */
public class YiuNetworkProtobuf {
	protected static boolean Log = false;
	
    public static void processBytes(byte[] buffer, int length)
    {
        try {
            byte[] newBuffer = new byte[length];
            System.arraycopy( buffer, 0, newBuffer, 0, length );

            protocol pbObject = protocol.parseFrom( newBuffer );
            ProtocolList.ProtocolNode node = ProtocolList.getNode(pbObject.getId());

            if (node == null) return;

            if (node.mName.equals("sc_protocol_pack"))
            {
                sc_protocol_pack pbPack = sc_protocol_pack.parseFrom( pbObject.getContent().toByteArray() );
                Vector vecProtocol = pbPack.getPack();
                for (int index = 0; index < vecProtocol.size(); ++index)
                {
                    protocol pbPackedObject = (protocol)vecProtocol.elementAt(index);
                    ProtocolList.ProtocolNode packedNode = ProtocolList.getNode(pbPackedObject.getId());
                    if (Log) System.out.println( "Got Protobuf: " + String.valueOf(pbPackedObject.getId()) );
                    YiuNetworkHandlerMgr.processPacket(packedNode.mName, pbPackedObject.getContent());
                }
            } else {
                if (Log) System.out.println( "Got Protobuf: " + String.valueOf(pbObject.getId()) );
                YiuNetworkHandlerMgr.processPacket(node.mName, pbObject.getContent());
            }
        }
        catch (Exception ex)
        {
            //System.out.println( ex.getMessage() );
        }
    }
}
