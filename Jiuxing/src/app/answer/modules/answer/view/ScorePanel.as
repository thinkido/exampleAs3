package app.answer.modules.answer.view
{
	import app.answer.modules.answer.model.AnswerModel;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import lm.components.window.GWindow;
	import lm.mui.CompCreateFactory;
	import lm.mui.controls.GButton;
	import lm.mui.controls.GImageBitmap;
	import lm.mui.controls.GLabel;
	import lm.mui.controls.GTextFiled;
	import lm.mui.controls.TimeButton;
	
	public class ScorePanel extends GWindow
	{
		public var scoreTxt:GLabel;
		public var shareTxt:GLabel;
		public var showTxt:GTextFiled;
		public var GImageBitmap2:GImageBitmap ;
		private var format:TextFormat = new TextFormat();;
		public var shareBtn:GButton ;
		public var timeBtn:TimeButton
		
		public function ScorePanel()
		{
			init();
		}
		
		private function init():void
		{
			width = 600 ;
			height = 403 ;
			title ="测试结果" ;
			
//			format = new TextFormat(null,14, 0xffffff, false, null, null, null, null, 'left');
//			scoreTxt = CompCreateFactory.createGLabel(17,36,123,22,'倒计时：',format);
			format = new TextFormat(null,50, 0xffffff, false, null, null, null, null, 'left');
			scoreTxt = CompCreateFactory.createGLabel(200,50,500,100,'倒计时：',format);
			this.addChild(scoreTxt);
			scoreTxt.text = "总分：100" ;
			
			format = new TextFormat(null,14, 0xffffff, false, null, null, null, null, 'left');
			shareTxt = CompCreateFactory.createGLabel(200,350,500,100,'分享：',format);
			this.addChild(shareTxt);
			var shareStr:String = "没想到我的情商这么高,等你来挑战！" ;
			shareTxt.text = shareStr ;
			
			showTxt = CompCreateFactory.createGTextField(10,120,580,200,format);
			this.addChild(showTxt);
			showTxt.wordWrap = true ;
			showTxt.selectable = false ;
			
			shareBtn = CompCreateFactory.createGButton(440,350,70,28,'分享');
			shareBtn.styleName = 'RedButton';
			this.addChild(shareBtn);
			
			timeBtn = new TimeButton(10);
			timeBtn.styleName = "RedButton" ;
			timeBtn.x = 510 ;
			timeBtn.y = 350 ;
			timeBtn.width = 85;
			timeBtn.height = 28 ;
			timeBtn.label = "查看答案";
			this.addChild(timeBtn);
		}
	}
}