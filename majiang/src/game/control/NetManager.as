package game.control
{
	import com.thinkido.framework.net.JSocket;
	import com.thinkido.framework.net.TProtocol;
	
	import flash.system.System;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import network.ProtocolList;
	import network.ProtocolNode;
	
	import protos.common.protocol;

	public class NetManager
	{
		public function NetManager()
		{
		}
		
		public static function sendProtobuf( socket:JSocket , proName:String , data:ByteArray ):void{
			var node:ProtocolNode = ProtocolList.getNodeStr(proName);
			if(node == null)
			{
				trace("No-Protocol: " + proName);
				return;
			}			
			var proto:protocol = new protocol();
			proto.id = node.mId ; 
			proto.content = data ;
//			var ipro:TProtocol = new TProtocol();
			var msg:ByteArray = new ByteArray();
			msg.endian = Endian.LITTLE_ENDIAN ;
			proto.writeTo(msg) ;
//			ipro.body = msg;
			socket.send( msg ) ;
		}
	}
}