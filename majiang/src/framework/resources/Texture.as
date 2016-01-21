package framework.resources
{
import javax.microedition.lcdui.Image;

/**
 * ÎÆÀí
 * 
 * @author Jing
 */
public class Texture
{

	private var _img:Image= null;

	/**
	 * ͼƬ×ÊԴ
	 * @return
	 */
	public function img():Image{
		return _img;
	}

	private var _td:TextureData= null;

	/**
	 * ÎÆÀíµÄÏÔʾÊý¾Ý
	 * @return
	 */
	public function data():TextureData{
		return _td;
	}

	public function Texture(img:Image)
	{
		_img = img;
		_td = new TextureData();
		_td.w = _img.getWidth();
		_td.h = _img.getHeight();
		_td.sourceW = _td.w;
		_td.sourceH = _td.h;
	}
	
	public function Texture(img:Image, td:TextureData)
	{
		_img = img;
		_td = td;
	}
}
}