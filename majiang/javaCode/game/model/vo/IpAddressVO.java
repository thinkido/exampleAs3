
package game.model.vo;

public class IpAddressVO
{

	public String ip;

	public int port;

	public IpAddressVO(String _ip, int _port)
	{
		ip = _ip;
		port = _port;
	}

	public String toHttpAddress()
	{
		return "http://" + ip + ":" + port;
	}

	public String toSocketAddress()
	{
		return "socket://" + ip + ":" + port;
	}

}
