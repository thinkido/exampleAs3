package game.model.vo
{
	public class IpAddressVO
	{
	
		public var ip:String;
	
		public var port:int;
	
		public function IpAddressVO( _ip:String, _port:int)
		{
			ip = _ip;
			port = _port;
		}
	
		public function toHttpAddress():String
		{
			return "http://" + ip + ":" + port;
		}
	
		public function toSocketAddress():String
		{
			return "socket://" + ip + ":" + port;
		}
	
	}
}
