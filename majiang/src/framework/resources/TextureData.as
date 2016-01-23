package framework.resources
{
/**
 * 纹理数据
 * @author Jing
 *
 */
public class TextureData
{
	protected var name:String= null;
	/**
	 * 纹理名称
	 */
	public function name():String{
		return name;
	}
	
	protected var x:int= 0;
	/**
	 * 纹理有效像素开始的X位置
	 * @return
	 */
	public function x():int{
		return x;
	}
	
	protected var y:int= 0;
	/**
	 * 纹理有效像素开始的Y位置
	 * @return
	 */
	public function y():int{
		return y;
	}
	
	protected var w:int= 0;
	/**
	 * 纹理有效像素宽度
	 * @return
	 */
	public function w():int{
		return w;
	}
	
	protected var h:int= 0;
	/**
	 * 纹理有效像素高度
	 * @return
	 */
	public function h():int{
		return h;
	}
	
	protected var offX:int= 0;
	/**
	 * 纹理有效像素距离原图的X轴偏移
	 * @return
	 */
	public function offX():int{
		return offX;
	}
	
	protected var offY:int= 0;
	/**
	 * 纹理有效像素距离原图的Y轴偏移
	 * @return
	 */
	public function offY():int{
		return offY;
	}
	
	protected var sourceW:int= 0;
	/**
	 * 纹理原始图片宽度
	 * @return
	 */
	public function sourceW():int{
		return sourceW;
	}
	
	protected var sourceH:int= 0;
	/**
	 * 纹理原始图片高度
	 * @return
	 */
	public function sourceH():int{
		return sourceH;
	}
	
	
	protected function TextureData()
	{
		
	}
}
}