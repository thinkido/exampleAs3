package game.util
{
	import flash.display.Graphics;
	
	import game.control.ActionManager;
	import game.control.WindowManager;
	import game.model.Global;
	import game.model.action.ActionWaitTo;
	import game.model.callback.CallbackO;
	import game.model.callback.ICallbackB;
	import game.model.comparator.IComparatorI;
	import game.model.comparator.IComparatorO;
	import game.model.vo.PopupVO;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class CommonUtil
	{
	
		public static function sort( list:Vector.<Object>, comparator:IComparatorO):void
		{
			var len:int = list.length;
			for(var i:int = 0; i < len - 1; i++)
			{
				for(var j:int = i + 1; j < len; j++)
				{
					if(comparator.compare(list[i], list[j]))
					{
						var tmp:Object = list[i] as Object;
						list[i] = list[j];
						list[j] = tmp;
					}
				}
			}
		}
	
		public static function sort_2(list:Vector.<int>, comparator:IComparatorI):void
		{
			var len:int = list.length;
			for(var i:int = 0; i < len - 1; i++)
			{
				for(var j:int = i + 1; j < len; j++)
				{
					if(comparator.compare(list[i], list[j]))
					{
						var tmp:int = list[i];
						list[i] = list[j];
						list[j] = tmp;
					}
				}
			}
		}
	
		public static function sort_3(list:Vector.<int>, isAesc:Boolean):void
		{
			if(isAesc)
			{
				/*sort_2(list, new IComparatorI()
				{
	
					public boolean compare(int a, int b)
					{
						return a > b;
					}
				});*/
				sort_2(list, new Compare_1);
			}
			else
			{
				/*sort(list, new IComparatorI()
				{
	
					public boolean compare(int a, int b)
					{
						return a < b;
					}
				});*/
				sort_2(list, new Compare_2);
			}
		}
	
		public static function intVectorToArray(arr:Array):Vector.<int>
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


	
		public static function intArrayToVector(vect:Vector.<int>):Array
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

		public static function formatGold( gold:Number):String
		{
			var strGold:String = "";
			if(gold >= 1000000000)
				strGold += (gold / 100000000) + "вк";
			else if(gold >= 100000)
				strGold += (gold / 10000) + "Эђ";
			else
				strGold += gold;
			return strGold;
		}
	
	//	public static String formatName(String name,boolean isShort)
	//	{
	//		String output;
	//		if(isShort)
	//		{
	//			int len = name.length;
	//			if(len > 7)
	//				output = name.substring(2, 7);
	//			else
	//				output = name.substring(2);
	//		}
	//		else
	//			output  = name.substring(2) + "@itv";
	//		return output;
	//	}
		
	//	public static String formatName(String name)
	//	{
	//		return formatName(name,false);
	//	}
	
		public static function getSnapShot():Image
		{
			return getSnapShot(Global.root());
		}
	
		public static function getSnapShot_2(sp:Sprite):Image
		{
			var canvas:Image = Image.createImage(Global.SCREEN_WIDTH, Global.SCREEN_HEIGHT);
//			canvas.width = Global.SCREEN_WIDTH;
//			canvas.height = Global.SCREEN_HEIGHT;
			var cg:Graphics = canvas.getGraphics();
			sp.paint(cg);
			return new Image(new Texture(canvas));
		}
	
		public static function showPopupWindow(isConfirm:Boolean, content:Object, callback:ICallbackB):void
		{
			WindowManager.getInstance().openWindow(WindowType.WINDOW_POPUP, new PopupVO(isConfirm, content, callback));
		}
		
		public static function setTimeout(callback:CallbackO, interval:Number):void
		{
			ActionManager.getInstance().doAction(new ActionWaitTo(interval, null, callback));
		}
	}
}
import game.model.comparator.IComparatorI;

class Compare_1 implements IComparatorI
{
	public function compare(a:int, b:int):Boolean
	{
		return a > b;
	}
}

class Compare_2 implements IComparatorI
{
	public function compare(a:int, b:int):Boolean
	{
		return a < b;
	}
}
