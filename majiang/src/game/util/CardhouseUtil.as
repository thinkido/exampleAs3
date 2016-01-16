package game.util
{
	import com.adobe.crypto.MD5;
	
	import flash.utils.getTimer;
	
	public class CardhouseUtil
	{
		public function CardhouseUtil()
		{
		}
		public static function requestDiamond():int
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
		public function requestBuy(type:int):String
		{ 
			try
			{
				var time:int = getTimer() ;
				var args:Hashtable = new Hashtable();
				args.put("game_id", Global.GAME_ID );
				args.put("ad_account", Global.adAccount );
				args.put("exchange_type_id", type);
				args.put("time", new Long(time));
				var sign:String = MD5.hash(Global.GAME_ID + Global.adAccount + type + time + "it is client who fuck this piece of shit");
				args.put("sign", sign);
				var data:HttpData = FileIO.postHttpData(Global.CARDHOUSE_URL + "buy", args);
				var returnValue:String = String(data.data());
				return returnValue;
			}
			catch(Exception e)
			{
				return "ERROR:发送购买请求过程出错";
			}
		}
	}
}