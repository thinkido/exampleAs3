package network
{
	
	import flash.utils.ByteArray;
	
	import java.util.Vector;
	
	import protocol.protocol;
	import protocol.sc_protocol_pack;
	
	
	/**
	 *
	 * @author jmulro
	 */
	public class YiuNetworkProtobuf
	{
		protected static var Log:Boolean = false;
		
	    public static function processBytes( buffer:ByteArray, length:int):void
	    {
	        try 
			{
//	            byte[] newBuffer = new byte[length];
				var newBuffer:ByteArray = new ByteArray();
	            System.arraycopy( buffer, 0, newBuffer, 0, length );
	
	            var pbObject:protocol = protocol.parseFrom( newBuffer );
	            var node:ProtocolNode = ProtocolList.getNode(pbObject.getId());
	
	            if (node == null) return;
	
	            if (node.mName == "sc_protocol_pack")
	            {
	                var pbPack:sc_protocol_pack = sc_protocol_pack.parseFrom( pbObject.getContent().toByteArray() );
	                var vecProtocol:Array = pbPack.getPack();
	                for (var index:int = 0; index < vecProtocol.length; ++index)
	                {
	                   var pbPackedObject:protocol = vecProtocol[index] as protocol; // (protocol)vecProtocol.elementAt(index);
	                   var packedNode:ProtocolNode = ProtocolList.getNode(pbPackedObject.getId());
					   
	                    if (Log)
						{
//							trace( "Got Protobuf: " + String.valueOf(pbPackedObject.getId()) );
							trace( "Got Protobuf: " + pbPackedObject.getId() );
						}
	                    YiuNetworkHandlerMgr.processPacket(packedNode.mName, pbPackedObject.getContent());
	                }
	            } 
				else 
				{
	                if (Log) 
					{
//						trace( "Got Protobuf: " + String.valueOf(pbObject.getId()) );
						trace( "Got Protobuf: " + pbObject.getId() );
					}
	                YiuNetworkHandlerMgr.processPacket(node.mName, pbObject.getContent());
	            }
	        }
	        catch ( ex:Error)
	        {
	            //trace( ex.getMessage() );
	        }
	    }
	}
}
