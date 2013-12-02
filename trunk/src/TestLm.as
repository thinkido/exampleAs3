package
{
	import com.thinkido.example.Application;
	import com.thinkido.framework.display.RepeatImage;
	import com.thinkido.framework.utils.StringUtil;
	
	import flash.display.Bitmap;
	
	public class TestLm extends Application
	{
		[Embed(source="../asset/focusTile.png",mimeType="image/png")]
		private var FocusImgClass:Class ;
		private var focusImg:RepeatImage ;
		
		public function TestLm()
		{
			
		}

		protected override function initApp():void
		{
			/*focusImg = new RepeatImage();
			focusImg.setSize(100,100);
			focusImg.x = 100;
			focusImg.y = 100 ;
			addChild(focusImg);
			
			focusImg.bitmapData = Bitmap(new FocusImgClass()).bitmapData ;
			focusImg.alpha = 0.5 ;*/
			var str:String = "i*want$to#see%you" ;
			var arr:Array = ["*","$","%"];
			var arr1:Array = ["1","2","4"];
			
			
		}
	}
}