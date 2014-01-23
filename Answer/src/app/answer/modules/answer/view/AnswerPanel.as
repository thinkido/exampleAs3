package app.answer.modules.answer.view
{
	import app.answer.common.staticdata.SkinClassNameDefine;
	
	import flash.display.Sprite;
	import flash.text.TextFormat;
	
	import lm.components.window.GWindow;
	import lm.mui.CompCreateFactory;
	import lm.mui.controls.GButton;
	import lm.mui.controls.GCheckBox;
	import lm.mui.controls.GImageBitmap;
	import lm.mui.controls.GLabel;
	import lm.mui.controls.GRadioButton;
	import lm.mui.core.GlobalClass;

	public class AnswerPanel extends GWindow
	{
		public var nextBtn:GButton;
		public var preBtn:GButton;
		public var dRadio:GRadioButton;
		public var cRadio:GRadioButton;
		public var bRadio:GRadioButton;
		public var aRadio:GRadioButton;
		public var notSureCheck:GCheckBox;
		public var showAnswerCheck:GCheckBox;
		public var autoCheck:GCheckBox;
		public var goInput:GImageBitmap;
		public var GLabel6:GLabel;
		public var GLabel5:GLabel;
		public var currTxt:GLabel;
		public var timeTxt:GLabel;
		public var GImageBitmap10:GImageBitmap;
		public var GImageBitmap9:GImageBitmap;
		public var GImageBitmap8:GImageBitmap;
		public var GImageBitmap7:GImageBitmap;
		public var goBtn:GButton ;
		public var lastBtn:GButton ;
		public var tipTxt:GLabel ;
		private var format:TextFormat = new TextFormat();;
		public var titleTxt:GLabel;
		public var GImageBitmap3:GImageBitmap;
		public var GImageBitmap2:GImageBitmap;
		public var GImageBitmap1:GImageBitmap;

		public function AnswerPanel()
		{
			init();
		}

		private function init():void
		{
//			GImageBitmap1 = CompCreateFactory.createGImageBitmap(0,0,600,403);
//			this.addChild(GImageBitmap1);
			width = 600 ;
			height = 403 ;
			title ="情商测试" ;
			
			GImageBitmap2 = new GImageBitmap();
			GImageBitmap2.bitmapData = GlobalClass.getBitmapData('CanvasBg1');
			GImageBitmap2.scale9Grid = SkinClassNameDefine.CANVASBG1RECT;
			GImageBitmap2.x = 149;
			GImageBitmap2.y = 30;
			GImageBitmap2.width = 443;
			GImageBitmap2.height = 340;
			this.addChild(GImageBitmap2);

			GImageBitmap3 = new GImageBitmap();
			GImageBitmap3.bitmapData = GlobalClass.getBitmapData('CanvasBg1');
			GImageBitmap3.scale9Grid = SkinClassNameDefine.CANVASBG1RECT;
			GImageBitmap3.x = 7;
			GImageBitmap3.y = 30;
			GImageBitmap3.width = 140;
			GImageBitmap3.height = 367;
			this.addChild(GImageBitmap3);

			format = new TextFormat(null,12, 0xffffff, false, null, null, null, null, 'left');
			titleTxt = CompCreateFactory.createGLabel(164,37,408,89,'1、标题',format);
			this.addChild(titleTxt);

			format = new TextFormat(null,12, 0xff0000, false, null, null, null, null, 'left');
			tipTxt = CompCreateFactory.createGLabel(177,250,296,22,'你答错了，标准答案是A。为什么选A？',format);
			this.addChild(tipTxt);


			GImageBitmap7 = new GImageBitmap();
			GImageBitmap7.bitmapData = GlobalClass.getBitmapData('LineH');
			GImageBitmap7.scale9Grid = SkinClassNameDefine.LINEHRECT;
			GImageBitmap7.x = 152;
			GImageBitmap7.y = 134;
			GImageBitmap7.width = 439;
			GImageBitmap7.height = 2;
			this.addChild(GImageBitmap7);

			GImageBitmap8 = new GImageBitmap();
			GImageBitmap8.bitmapData = GlobalClass.getBitmapData('LineH');
			GImageBitmap8.scale9Grid = SkinClassNameDefine.LINEHRECT;
			GImageBitmap8.x = 151;
			GImageBitmap8.y = 281;
			GImageBitmap8.width = 439;
			GImageBitmap8.height = 2;
			this.addChild(GImageBitmap8);

			GImageBitmap9 = new GImageBitmap();
			GImageBitmap9.bitmapData = GlobalClass.getBitmapData('LineH');
			GImageBitmap9.scale9Grid = SkinClassNameDefine.LINEHRECT;
			GImageBitmap9.x = 8;
			GImageBitmap9.y = 91;
			GImageBitmap9.width = 140;
			GImageBitmap9.height = 2;
			this.addChild(GImageBitmap9);

			GImageBitmap10 = new GImageBitmap();
			GImageBitmap10.bitmapData = GlobalClass.getBitmapData('LineH');
			GImageBitmap10.scale9Grid = SkinClassNameDefine.LINEHRECT;
			GImageBitmap10.x = 4;
			GImageBitmap10.y = 154;
			GImageBitmap10.width = 140;
			GImageBitmap10.height = 2;
			this.addChild(GImageBitmap10);

			format = new TextFormat(null,12, 0xffffff, false, null, null, null, null, 'left');
			timeTxt = CompCreateFactory.createGLabel(17,36,123,22,'倒计时：10:12',format);
			this.addChild(timeTxt);

			currTxt = CompCreateFactory.createGLabel(468,290,100,22,'当前：1/120',format);
			this.addChild(currTxt);

			GLabel5 = CompCreateFactory.createGLabel(452,335,72,22,'转到',format);
			this.addChild(GLabel5);

			GLabel6 = CompCreateFactory.createGLabel(522,335,17,22,'题',format);
			this.addChild(GLabel6);

			goInput = new GImageBitmap();
			goInput.bitmapData = GlobalClass.getBitmapData('CanvasBg1');
			goInput.scale9Grid = SkinClassNameDefine.CANVASBG1RECT;
			goInput.x = 482;
			goInput.y = 337;
			goInput.width = 38;
			goInput.height = 19;
			this.addChild(goInput);

			nextBtn = CompCreateFactory.createGButton(541,332,28,28,'Go');
			nextBtn.styleName = 'GButton';
			this.addChild(nextBtn);

			autoCheck = CompCreateFactory.createGCheckBox(15,102);
			autoCheck.width = 120;
			autoCheck.label ="自动切换";
			autoCheck.styleName = "GCheckBox" ;
			this.addChild(autoCheck);
			autoCheck.validateNow();

			showAnswerCheck = CompCreateFactory.createGCheckBox(15,125);
			showAnswerCheck.width = 120;
			showAnswerCheck.label ="查看答案";
			showAnswerCheck.styleName = "GCheckBox" ;
			this.addChild(showAnswerCheck);

			notSureCheck = CompCreateFactory.createGCheckBox(173,285);
			notSureCheck.width = 300;
			notSureCheck.label ='标记为"不确定",可以复查';
			notSureCheck.styleName = "GCheckBox" ;
			this.addChild(notSureCheck);
			notSureCheck.validateNow();

			aRadio = new GRadioButton();
			aRadio.x = 173;
			aRadio.y = 149;
			aRadio.width = 410;
			aRadio.height = 22;
			this.addChild(aRadio);

			bRadio = new GRadioButton();
			bRadio.x = 173;
			bRadio.y = 174;
			bRadio.width = 410;
			bRadio.height = 22;
			this.addChild(bRadio);

			cRadio = new GRadioButton();
			cRadio.x = 173;
			cRadio.y = 199;
			cRadio.width = 410;
			cRadio.height = 22;
			this.addChild(cRadio);

			dRadio = new GRadioButton();
			dRadio.x = 173;
			dRadio.y = 225;
			dRadio.width = 410;
			dRadio.height = 22;
			this.addChild(dRadio);

			preBtn = CompCreateFactory.createGButton(170,335,74,28,'上一题');
			preBtn.styleName = 'RedButton';
			this.addChild(preBtn);

			nextBtn = CompCreateFactory.createGButton(250,335,74,28,'下一题');
			nextBtn.styleName = 'RedButton';
			this.addChild(nextBtn);
			
			aRadio.styleName = "GRadio";
			bRadio.styleName = "GRadio";
			cRadio.styleName = "GRadio";
			dRadio.styleName = "GRadio";
		}
	}
}