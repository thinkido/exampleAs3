package framework.util
{
	import starling.display.Image;

	public class ImageUtil
	{
		public function ImageUtil()
		{
		}
		
		/**
		 * 将img中指定的颜色修改为透明色
		 * 
		 * @param img
		 * @param oColor
		 * @param alpha
		 * @return
		 */
		static public function alpha(img:Image, color:int):Image
		{
			var w:int = img.width;
			var h:int = img.height;
			var v:int ;
			var colors:Array = [] ;
			img.getRGB(colors, 0, w, 0, 0, w, h);
			for(int i = 0; i < colors.length; i++)
			{
				v = colors[i];
				if(v == color)
				{
					colors[i] = 0;
				}
			}
			img = Image.createRGBImage(colors, w, h, true);
			return img;
		}
	}
}