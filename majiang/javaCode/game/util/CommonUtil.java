
package game.util;

import framework.resources.Texture;
import framework.views.Bitmap;
import framework.views.Sprite;
import game.constant.WindowType;
import game.control.ActionManager;
import game.control.WindowManager;
import game.model.Global;
import game.model.action.ActionWaitTo;
import game.model.callback.CallbackO;
import game.model.callback.ICallbackB;
import game.model.comparator.IComparatorI;
import game.model.comparator.IComparatorO;
import game.model.vo.PopupVO;

import java.util.Vector;

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;

public class CommonUtil
{

	public static void sort(Object[] list, IComparatorO comparator)
	{
		int len = list.length;
		for(int i = 0; i < len - 1; i++)
		{
			for(int j = i + 1; j < len; j++)
			{
				if(comparator.compare(list[i], list[j]))
				{
					Object tmp = list[i];
					list[i] = list[j];
					list[j] = tmp;
				}
			}
		}
	}

	public static void sort(int[] list, IComparatorI comparator)
	{
		int len = list.length;
		for(int i = 0; i < len - 1; i++)
		{
			for(int j = i + 1; j < len; j++)
			{
				if(comparator.compare(list[i], list[j]))
				{
					int tmp = list[i];
					list[i] = list[j];
					list[j] = tmp;
				}
			}
		}
	}

	public static void sort(int[] list, boolean isAesc)
	{
		if(isAesc)
		{
			sort(list, new IComparatorI()
			{

				public boolean compare(int a, int b)
				{
					return a > b;
				}
			});
		}
		else
		{
			sort(list, new IComparatorI()
			{

				public boolean compare(int a, int b)
				{
					return a < b;
				}
			});
		}
	}

	public static int[] intVectorToArray(Vector vector)
	{
		if(vector != null && vector.size() > 0)
		{
			int len = vector.size();
			int[] array = new int[len];
			for(int i = 0; i < len; i++)
			{
				array[i] = ((Integer)vector.elementAt(i)).intValue();
			}
			return array;
		}
		return null;
	}

	public static Vector intArrayToVector(int[] array)
	{
		Vector vector = new Vector();
		if(array != null)
		{
			int len = array.length;
			for(int i = 0; i < len; i++)
			{
				vector.addElement(new Integer(array[i]));
			}
		}
		return vector;
	}

	public static String formatGold(long gold)
	{
		String strGold = "";
		if(gold >= 100000000)
			strGold += (gold / 100000000) + "вк";
		else if(gold >= 10000)
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
//			int len = name.length();
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

	public static Bitmap getSnapShot()
	{
		return getSnapShot(Global.root());
	}

	public static Bitmap getSnapShot(Sprite sp)
	{
		Image canvas = Image.createImage(Global.SCREEN_WIDTH, Global.SCREEN_HEIGHT);
		Graphics cg = canvas.getGraphics();
		sp.paint(cg);
		return new Bitmap(new Texture(canvas));
	}

	public static void showPopupWindow(boolean isConfirm, Object content, ICallbackB callback)
	{
		WindowManager.getInstance().openWindow(WindowType.WINDOW_POPUP, new PopupVO(isConfirm, content, callback));
	}
	
	public static void setTimeout(CallbackO callback,long interval)
	{
		ActionManager.getInstance().doAction(new ActionWaitTo(interval, null, callback));
	}
}
