package framework.resources
{
/**
 * 纹理数据
 * @author Jing
 *
 */
public class TextureData
{
	protected var _name:String= null;
	/**
	 * 纹理名称
	 */
	public function get name():String{
		return _name;
	}
	
	public function set name(str:String):void
	{
		this._name = str;
	}
	
	public var x:int= 0;
	/**
	 * 纹理有效像素开始的X位置
	 * @return
	 */
/*	public function get x():int{
		return x;
	}*/
	
	public var y:int= 0;
	/**
	 * 纹理有效像素开始的Y位置
	 * @return
	 */
	/*public function y():int{
		return y;
	}*/
	
	public var w:int= 0;
	/**
	 * 纹理有效像素宽度
	 * @return
	 */
	/*public function w():int{
		return w;
	}*/
	
	public var h:int= 0;
	/**
	 * 纹理有效像素高度
	 * @return
	 */
	/*public function h():int{
		return h;
	}*/
	
	public var offX:int= 0;
	/**
	 * 纹理有效像素距离原图的X轴偏移
	 * @return
	 */
	/*public function offX():int{
		return offX;
	}*/
	
	public var offY:int= 0;
	/**
	 * 纹理有效像素距离原图的Y轴偏移
	 * @return
	 */
	/*public function offY():int{
		return offY;
	}*/
	
	public var sourceW:int= 0;
	/**
	 * 纹理原始图片宽度
	 * @return
	 */
	/*public function sourceW():int{
		return sourceW;
	}*/
	
	public var sourceH:int= 0;
	/**
	 * 纹理原始图片高度
	 * @return
	 */
	/*public function sourceH():int{
		return sourceH;
	}*/
	
	
	public function TextureData()
	{
		
	}
}
}