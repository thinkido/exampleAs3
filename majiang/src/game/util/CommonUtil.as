package game.util
{
	import game.constant.WindowType;
	import game.control.WindowManager;
	import game.model.vo.PopupVO;
	
	public class CommonUtil
	{	
		
		public static function intVectorToArray(vect:Vector.<int>):Array
		{
			var arr:Array = [];
			if(vect != null)
			{
				var len:int = vect.length;
				for(var i:int = 0; i < len; i++)
				{
					arr.push(int(vect[i]));
				}
			}
			return arr;
		}
		
		public static function intArrayToVector(arr:Array):Vector.<int>
		{
			if(arr != null && arr.length > 0)
			{
				var len:int = arr.length;
				var vect:Vector.<int> = new Vector.<int>;
				for(var i:int = 0; i < len; i++)
				{
					vect[i] = int(arr[i]);
				}
				return vect;
			}
			return null;
		}	

		public static function formatGold( gold:Number):String
		{
			var strGold:String = "";
			if(gold >= 1000000000)
				strGold += (gold / 100000000) + "亿";
			else if(gold >= 100000)
				strGold += (gold / 10000) + "万";
			else
				strGold += gold;
			return strGold;
		}	
	
	
		public static function showPopupWindow(isConfirm:Boolean, content:Object, callback:Function):void
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_POPUP, new PopupVO(isConfirm, content, callback));
		}
	}
}