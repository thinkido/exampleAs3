package jing.configs
{
import framework.resources.Res;

import game.model.vo.IpAddressVO;

import org.json.me.JSONException;
import org.json.me.JSONObject;

/**
 * ÅäÖù¤¾ß
 * 
 * @author Jing
 */
public class Config
{

	private var _gateAddressVO:IpAddressVO= null;

	private var _hallAddressVO:IpAddressVO= null;

	/**
	 * Íø¹صØַ
	 * 
	 * @return
	 */
	public function gateAddressVO():IpAddressVO{
		return _gateAddressVO;
	}

	/**
	 * ´óÌüµØַ
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
		obj = Res.actively.getJson(file);
		try
		{
			_gateAddressVO = new IpAddressVO(obj["gate_address"], obj["gate_port"]);
			_hallAddressVO = new IpAddressVO(obj["hall_address"], obj["hall_port"]);
			trace("config loaded" + obj.toString());
		}
		catch(e:*)
		{
			trace("¼ÓÔØÅäÖÃÎļþ³ö´í", "LogManager.LEVEL_ERROR");
		}

		Res.actively.release(file);
	}
}
}