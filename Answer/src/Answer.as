package
{
	import app.answer.manager.LayerManager;
	
	import com.thinkido.example.Application;
	import com.thinkido.framework.common.Global;
	import com.thinkido.framework.display.RepeatImage;
	
	import lm.components.window.GWindow;
	import lm.components.window.WindowEvent;

	[SWF(width="1000",height="700")]
	public class Answer extends Application
	{
		[Embed(source="../asset/focusTile.png",mimeType="image/png")]
		private var FocusImgClass:Class ;
		private var focusImg:RepeatImage ;
		
		public function Answer()
		{
			
		}
		
		protected override function initApp():void
		{
			var app:com.thinkido.framework.common.Application = new com.thinkido.framework.common.Application();
			Global.application = app ;
			addChild(app);
			
			LayerManager.init() ;
			
			window = new GWindow() ;
			window.title = "情商测试系统" ;
			window.setSize(600,400);
			window.move(100,100);
			LayerManager.windowLayer.addChild(window);
			window.addEventListener(WindowEvent.CLOSE,onclose);
			
		}
		
		private var window:GWindow ;
		
		private function onclose(event:WindowEvent):void
		{
			window.parent.removeChild(window);
			
		}
	}
}