
package jing.configs;

import framework.resources.Res;
import game.control.LogManager;
import game.model.vo.IpAddressVO;

import org.json.me.JSONException;
import org.json.me.JSONObject;

/**
 * ���ù���
 * 
 * @author Jing
 */
public class Config
{

	private IpAddressVO _gateAddressVO = null;

	private IpAddressVO _hallAddressVO = null;

	/**
	 * ���ص�ַ
	 * 
	 * @return
	 */
	public IpAddressVO gateAddressVO()
	{
		return _gateAddressVO;
	}

	/**
	 * ������ַ
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
			LogManager.getInstance().log("config loaded" + obj.toString());
		}
		catch(JSONException e)
		{
			LogManager.getInstance().log("���������ļ�����", LogManager.LEVEL_ERROR);
		}

		Res.actively.release(file);
	}
}
