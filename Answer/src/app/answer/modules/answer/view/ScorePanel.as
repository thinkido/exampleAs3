package app.answer.modules.answer.view
{
	import app.answer.common.staticdata.SkinClassNameDefine;
	
	import flash.text.TextFormat;
	
	import lm.components.window.GWindow;
	import lm.mui.CompCreateFactory;
	import lm.mui.controls.GImageBitmap;
	import lm.mui.controls.GLabel;
	import lm.mui.core.GlobalClass;
	
	public class ScorePanel extends GWindow
	{
		public var scoreTxt:GLabel;
		public var GImageBitmap2:GImageBitmap ;
		private var format:TextFormat = new TextFormat();;
		
		
		public function ScorePanel()
		{
			init();
		}
		
		private function init():void
		{
			//			GImageBitmap1 = CompCreateFactory.createGImageBitmap(0,0,600,403);
			//			this.addChild(GImageBitmap1);
			width = 600 ;
			height = 403 ;
			title ="测试结果" ;
			
			
//			format = new TextFormat(null,14, 0xffffff, false, null, null, null, null, 'left');
//			scoreTxt = CompCreateFactory.createGLabel(17,36,123,22,'倒计时：',format);
			format = new TextFormat(null,50, 0xffffff, false, null, null, null, null, 'left');
			scoreTxt = CompCreateFactory.createGLabel(200,100,500,100,'倒计时：',format);
			this.addChild(scoreTxt);
			scoreTxt.text = "总分：100" ;
			
		}
	}
}