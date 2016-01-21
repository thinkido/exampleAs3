package framework.geom
{
import framework.util.StringUtil;

/**
 * 
 * @author Jing
 *
 */
public class Point
{
	/**
	 * »ñȡһ¸öµãÈÆÈÎÒâµã˳ʱÕëÐýתÈÎÒâ½ǶȺóµÄ×ø±ê
	 * @param x
	 * @param y
	 * @param cx
	 * @param cy
	 * @param angle
	 * @return
	 */
	static public function rotatePoint(x:int, y:int, cx:int, cy:int, angle:int):Point{
		//Ê×ÏȻ»Ëã³öÕýȷµĽǶÈ
		angle = angle % 360;
		if(angle < 0)
		{
			angle = 360+ angle;
		}
		angle = 360- angle;
		
		var newX:int= 0;
		var newY:int= 0;
		
		//½ǶÈת»»Ϊ»¡¶È
        var radian:Number= angle * Math.PI / 180;
        var tx:Number= (x- cx) * Math.cos(radian) + (y - cy ) * Math.sin(radian) + cy;  
        var ty:Number= -(x - cx) * Math.sin(radian) + (y - cy) * Math.cos(radian) + cy;  
        newX = int(tx);
        newY = int(ty);
		
		return new Point(newX,newY);
	}
	
	/**
	 * X×ø±êλÖÃ
	 */
	private var _x:int= 0;
	
	public function x():int{
		return _x;
	}
	
	public function setX(x:int):void{
		_x = x;
	}
	
	/**
	 * Y×ø±êλÖÃ
	 */
	private var _y:int= 0;
	
	public function y():int{
		return _y;
	}
	
	public function setY(y:int):void{
		_y = y;
	}
	
	
	/**
	 * ÉèÖÃX,YµÄֵ
	 * @param x
	 * @param y
	 */
	public function setPos(x:int, y:int):void{
		_x = x;
		_y = y;
	}
	
	public function Point(x:int, y:int)
	{
		_x = x;
		_y = y;
	}
	
	public function toString():String{
		var args:Array= new String[2];
		args[0] = String.valueOf(_x);
		args[1] = String.valueOf(_y);
		return StringUtil.format("[x = %s, y = %s]",args);
	}
}
}