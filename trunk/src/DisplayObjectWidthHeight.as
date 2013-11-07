package
{
	import com.thinkido.example.Application;
	
	import flash.display.Shape;
	import flash.external.ExternalInterface;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * 显示对象直接设置宽和高无用
	        宽高是有DisplayObject的内容决定
	       相关还包括：Sprite、shape、movieclip
	 * @author www.thinkido.com
	 * 欢迎你的加入
	 */		
	[SWF(width="600",height="600")]
	public class DisplayObjectWidthHeight extends Application
	{
		public function DisplayObjectWidthHeight()
		{
			
		}
		
		override protected function initApp():void{
			var s:Shape = new Shape();
			s.width = 100 ;
			trace(s.width); // 结果:0 
			
			var txt:TextField = new TextField();
			txt.defaultTextFormat = new TextFormat(null,16,0xffffff);
			addChild(txt);
			txt.width = 400 ;
			//			txt.height = 600 ;
			txt.mouseEnabled = false ;
			txt.htmlText = "var s:Shape = new Shape();" +
				"\ns.width = 100 ;" +
				"\ntrace(s.width); // 结果:0 ";
			txt.x = (stage.width - txt.textWidth) /2 ;
			txt.y = (stage.height - txt.textHeight) /2 ;
		}
	}
}