package
{
	import com.thinkido.example.Application;
	import com.thinkido.framework.display.LightPoint;
	import com.thinkido.framework.display.RepeatImage;
	
	import flash.display.Bitmap;
	
	public class OthenSkin extends Application
	{
		private var bg:RepeatImage ;
		private var _lightPoint:LightPoint;
		
		[Embed(source="../asset/TitleWindow_BG.png",mimeType="image/png")]
		private var TitleWindowClass:Class ;
		
		public function OthenSkin()
		{
			defaultSkin =  false ;
			
		}
		

		protected override function initApp():void
		{
			
			bg = new RepeatImage() ;
			bg.bitmapData = Bitmap(new TitleWindowClass()).bitmapData;
			addChild(bg);
			bg.width = stage.stageWidth ;
			bg.height = stage.stageHeight ;
			
			var _width:Number = stage.stageWidth ;
			var _height:Number = stage.stageHeight ;
			_lightPoint = new LightPoint();
			_lightPoint.setSize(_width,_height);
			addChild(_lightPoint);
			
		}


	}
}