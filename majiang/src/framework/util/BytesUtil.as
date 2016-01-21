package framework.util
{
/**
 * ×ֽÚÊý×鹤¾ß
 * @author Jing
 *
 */
public class BytesUtil
{
	/**
	 * ½«×ֽÚÊý×éÀïµÄÊý¾ÝÕûÌå×óÒÆ
	 * @param ba
	 * @param pos
	 */
	static public function moveLeft(ba:Array, pos:int):void{
		for(var i:int= 0; i < ba.length; i++)
		{			
			var copyPos:int= i + pos;
			var copyValue:uint= 0;
			if(copyPos < ba.length)
			{
				copyValue = ba[copyPos];
			}
			ba[i] = copyValue;
		}
	}
}
}