package jing.configs
{
	import framework.resources.Res;
	
	import game.model.vo.IpAddressVO;
	
	import managers.ResManager;
	
	/**
	 * 配置工具
	 * 
	 * @author Jing
	 */
	public class Config
	{
	
		private var _gateAddressVO:IpAddressVO= null;
	
		private var _hallAddressVO:IpAddressVO= null;
	
		/**
		 * 网关地址
		 * 
		 * @return
		 */
		public function gateAddressVO():IpAddressVO{
			return _gateAddressVO;
		}
	
		/**
		 * 大厅地址
		 * 
		 * @return
		 */
		public function hallAddressVO():IpAddressVO{
			return _hallAddressVO;
		}
	
		public function Config(file:String)
		{
			init(file);
		}
	
		public function init(file:String):void{
			var obj:Object= null;
//			obj = Res.actively.getJson(file);
			obj = ResManager.getFile(file , Res.TYPE_JSON , true) ; 
			try
			{
				_gateAddressVO = new IpAddressVO(obj["gate_address"], obj["gate_port"]);
				_hallAddressVO = new IpAddressVO(obj["hall_address"], obj["hall_port"]);
				trace("config loaded" + obj.toString());
			}
			catch(e:*)
			{
				trace("加载配置文件出错", "LogManager.LEVEL_ERROR");
			}
		}
	}
}