package framework.resources
{
	import starling.display.Image;
	
	/**
	 * 纹理
	 * 
	 * @author Jing
	 */
	public class Texture_A
	{
		
		private var _img:Image= null;
		
		/**
		 * 图片资源
		 * @return
		 */
		public function img():Image{
			return _img;
		}
		
		private var _td:TextureData= null;
		
		/**
		 * 纹理的显示数据
		 * @return
		 */
		public function data():TextureData{
			return _td;
		}
		
		public function Texture(img:Image, td:TextureData = null )
		{
			_img = img;
			if( td == null ){			
				_td = new TextureData();
				_td.w = _img.getWidth();
				_td.h = _img.getHeight();
				_td.sourceW = _td.w;
				_td.sourceH = _td.h;
			}else{
				_td = td;
			}
		}	
	}
}
import framework.resources;

