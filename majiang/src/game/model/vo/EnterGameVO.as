package game.model.vo
{
	public class EnterGameVO
	{
	
		public var ipAddressVO:IpAddressVO;
	
		public var isReEnter:Boolean;
	
		public function EnterGameVO(_ipAddressVO:IpAddressVO, _isReEnter:Boolean)
		{
			ipAddressVO = _ipAddressVO;
			isReEnter = _isReEnter;
		}
	}
}
