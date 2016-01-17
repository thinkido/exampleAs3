package game.util
{
	import flash.utils.getTimer;
	
	import framework.io.FileIO;
	import framework.io.HttpData;
	
	import game.model.Global;
	
	public class CardhouseUtil
	{
	
		public static function requestDiamond():int
		{
			try
			{
				var args:Object = {};
				args["ad_account"] = Global.adAccount;
				var data:HttpData = FileIO.postHttpData(Global.CARDHOUSE_URL + "get_diamond", args);
				var returnValue:String = data.data().toString();
				return int(returnValue);
			}
			catch( e:Error)
			{
				return 0;
			}
		}
	
		public static function requestBuy(type:int):String
		{
			try
			{
				var time:Number = getTimer();
				var args:Object = {};
				args["game_id"] = Global.GAME_ID;
				args["ad_account"] = Global.adAccount;
				args["exchange_type_id"] = type;
				args["time"] = time;
				var sign:String = Md5Util.md5(Global.GAME_ID + Global.adAccount + type + time + "it is client who fuck this piece of shit");
				args["sign"] = sign;
				var data:HttpData = FileIO.postHttpData(Global.CARDHOUSE_URL + "buy", args);
				var returnValue:String = data.data();
				return returnValue;
			}
			catch( e:Error)
			{
				return "ERROR:发送购买请求过程出错";
			}
		}
	}
}
