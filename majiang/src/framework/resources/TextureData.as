package framework.resources
{
/**
 * ÎÆÀíÊý¾Ý
 * @author Jing
 *
 */
public class TextureData
{
	protected var name:String= null;
	/**
	 * ÎÆÀíÃû³Æ
	 */
	public function name():String{
		return name;
	}
	
	protected var x:int= 0;
	/**
	 * ÎÆÀíÓÐЧÏñËؿªʼµÄXλÖÃ
	 * @return
	 */
	public function x():int{
		return x;
	}
	
	protected var y:int= 0;
	/**
	 * ÎÆÀíÓÐЧÏñËؿªʼµÄYλÖÃ
	 * @return
	 */
	public function y():int{
		return y;
	}
	
	protected var w:int= 0;
	/**
	 * ÎÆÀíÓÐЧÏñËؿí¶È
	 * @return
	 */
	public function w():int{
		return w;
	}
	
	protected var h:int= 0;
	/**
	 * ÎÆÀíÓÐЧÏñËظ߶È
	 * @return
	 */
	public function h():int{
		return h;
	}
	
	protected var offX:int= 0;
	/**
	 * ÎÆÀíÓÐЧÏñËؾàÀëԭͼµÄXÖáƫÒÆ
	 * @return
	 */
	public function offX():int{
		return offX;
	}
	
	protected var offY:int= 0;
	/**
	 * ÎÆÀíÓÐЧÏñËؾàÀëԭͼµÄYÖáƫÒÆ
	 * @return
	 */
	public function offY():int{
		return offY;
	}
	
	protected var sourceW:int= 0;
	/**
	 * ÎÆÀíԭʼͼƬ¿í¶È
	 * @return
	 */
	public function sourceW():int{
		return sourceW;
	}
	
	protected var sourceH:int= 0;
	/**
	 * ÎÆÀíԭʼͼƬ¸߶È
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