
package jing.configs;

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

	private IpAddressVO _gateAddressVO = null;

	private IpAddressVO _hallAddressVO = null;
	
	private int _leftNameOff = 0;
	
	public int leftNameOff()
	{
		return _leftNameOff;
	}
	
	private int _rightNameOff = 0;
	
	public int rightNameOff()
	{
		return _rightNameOff;
	}
	

	/**
	 * 网关地址
	 * 
	 * @return
	 */
	public IpAddressVO gateAddressVO()
	{
		return _gateAddressVO;
	}

	/**
	 * 大厅地址
	 * 
	 * @return
	 */
	public IpAddressVO hallAddressVO()
	{
		return _hallAddressVO;
	}

	public Config(String file)
	{
		init(file);
	}

	public void init(String file)
	{
		JSONObject obj = null;
		obj = Res.actively.getJson(file);
		try
		{
			_gateAddressVO = new IpAddressVO(obj.getString("gate_address"), obj.getInt("gate_port"));
			_hallAddressVO = new IpAddressVO(obj.getString("hall_address"), obj.getInt("hall_port"));
			_leftNameOff = obj.getInt("left_name_off");
			_rightNameOff = obj.getInt("right_name_off");
			LogManager.getInstance().log("config loaded" + obj.toString());
		}
		catch(JSONException e)
		{
			LogManager.getInstance().log("加载配置文件出错", LogManager.LEVEL_ERROR);
		}

		Res.actively.release(file);
	}
}
