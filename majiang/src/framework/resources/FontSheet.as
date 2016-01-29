package framework.resources
{
	import framework.io.FileIO;
	
	import starling.display.Image;
	
	
	/**
	 * 字体
	 * @author 
	 *
	 */
	public class FontSheet
	{
		private var _ta:TextureAtlas= null;
		
		/**
		 * 纹理集
		 * @return
		 */
		public function sheet():Image{
			return _ta.img();
		}
		
		/**
		 * 获取字符数据
		 * @param ch 字符
		 * @return
		 */
		public function getCharData(ch:String):TextureData{
			var str:String= String(ch);
			return _ta.getFrame(str);		
		}
		
		public function FontSheet(url:String)
		{
			try
			{
				var jsonObj:Object = FileIO.getJson(url);
				var imagePath:String= url.substring(0, url.length - 4) + ".png";
				var sheet:Image= Image.createImage(imagePath);
				init(jsonObj, sheet);
			}
			catch(e:Error)
			{
//				trace( e.getStackTrace() );   //e.printStackTrace();
				trace(e.message);
			}
		}
		
		public function FontSheet_2(jsonObj:Object, sheet:Image):void
		{
			init(jsonObj, sheet);
		}
		
		protected function init(jsonObj:Object, sheet:Image):void{	
			_ta = new TextureAtlas(sheet, jsonObj);
		}
	}
}