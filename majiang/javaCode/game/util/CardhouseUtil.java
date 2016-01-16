
package game.util;

import framework.io.FileIO;
import framework.io.HttpData;
import framework.views.Stage;
import game.model.Global;

import java.util.Hashtable;

public class CardhouseUtil
{

	public static int requestDiamond()
	{
		try
		{
			Hashtable args = new Hashtable();
			args.put("ad_account", Global.adAccount);
			HttpData data = FileIO.postHttpData(Global.CARDHOUSE_URL + "get_diamond", args);
			String returnValue = String.valueOf(data.data());
			return Integer.valueOf(returnValue).intValue();
		}
		catch(Exception e)
		{
			return 0;
		}
	}

	public static String requestBuy(int type)
	{
		try
		{
			long time = Stage.current.now();
			Hashtable args = new Hashtable();
			args.put("game_id", Global.GAME_ID);
			args.put("ad_account", Global.adAccount);
			args.put("exchange_type_id", new Integer(type));
			args.put("time", new Long(time));
			String sign = Md5Util.md5(Global.GAME_ID + Global.adAccount + type + time + "it is client who fuck this piece of shit");
			args.put("sign", sign);
			HttpData data = FileIO.postHttpData(Global.CARDHOUSE_URL + "buy", args);
			String returnValue = String.valueOf(data.data());
			return returnValue;
		}
		catch(Exception e)
		{
			return "ERROR:发送购买请求过程出错";
		}
	}
}
