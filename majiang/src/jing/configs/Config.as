package jing.configs
{
import framework.resources.Res;
import game.control.LogManager;
import game.model.vo.IpAddressVO;

import org.json.me.JSONException;
import org.json.me.JSONObject;

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
		var obj:JSONObject= null;
		obj = Res.actively.getJson(file);
		try
		{
			_gateAddressVO = new IpAddressVO(obj.getString("gate_address"), obj.getInt("gate_port"));
			_hallAddressVO = new IpAddressVO(obj.getString("hall_address"), obj.getInt("hall_port"));
			LogManager.getInstance().log("config loaded" + obj.toString());
		}
		catch(var e:JSONException)
		{
			LogManager.getInstance().log("加载配置文件出错", LogManager.LEVEL_ERROR);
		}

		Res.actively.release(file);
	}
}
}