
package game.model.vo;

public class EnterGameVO
{

	public IpAddressVO ipAddressVO;

	public boolean isReEnter;

	public EnterGameVO(IpAddressVO _ipAddressVO, boolean _isReEnter)
	{
		ipAddressVO = _ipAddressVO;
		isReEnter = _isReEnter;
	}
}
