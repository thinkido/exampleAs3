package jing
{
import jing.configs.CardLayout;

/**
 * 游戏数据中心
 * 
 * @author Jing
 */
public class GDC
{

	/**
	 * 游戏牌局布局
	 */
	public static var cl:CardLayout= null;

	static public function trace(str:String):void{
		var enable:Boolean= false;
		if(enable)
		{
			System.out.println(str);
		}
	}

}
}