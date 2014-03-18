package
{
	import flash.display.Sprite;
	import lm.mui.controls.GRadioButton;
	import lm.mui.controls.GCheckBox;
	import lm.mui.controls.GButton;
	import flash.text.TextFormat;
	import lm.mui.controls.GLabel;
	import game.common.staticdata.SkinClassNameDefine;
	import lm.mui.core.GlobalClass;
	import lm.mui.controls.GImageBitmap;
	import lm.mui.CompCreateFactory;

	public class AnswerPanel extends Sprite
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
		public var nextBtn:GButton;
		public var goInput:GImageBitmap;
		public var GLabel6:GLabel;
		public var GLabel5:GLabel;
		public var currTxt:GLabel;
		public var timeTxt:GLabel;
		public var GImageBitmap10:GImageBitmap;
		public var GImageBitmap9:GImageBitmap;
		public var GImageBitmap8:GImageBitmap;
		public var GImageBitmap7:GImageBitmap;
		public var goBtn:GImageBitmap;
		public var lastBtn:GImageBitmap;
		public var tipTxt:GLabel;
		public var preBtn:GImageBitmap;
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
			GImageBitmap1 = CompCreateFactory.createGImageBitmap(0,0,600,403);
			this.addChild(GImageBitmap1);

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

			preBtn = new GImageBitmap();
			preBtn.bitmapData = GlobalClass.getBitmapData('Button2');
			preBtn.scale9Grid = SkinClassNameDefine.BUTTON2RECT;
			preBtn.x = 156;
			preBtn.y = 339;
			preBtn.width = 62;
			preBtn.height = 25;
			this.addChild(preBtn);

			format = new TextFormat(null,12, 0xff0000, false, null, null, null, null, 'left');
			tipTxt = CompCreateFactory.createGLabel(177,250,296,22,'你答错了，标准答案是A。为什么选A？',format);
			this.addChild(tipTxt);

			lastBtn = new GImageBitmap();
			lastBtn.bitmapData = GlobalClass.getBitmapData('Button2');
			lastBtn.scale9Grid = SkinClassNameDefine.BUTTON2RECT;
			lastBtn.x = 218;
			lastBtn.y = 339;
			lastBtn.width = 62;
			lastBtn.height = 25;
			this.addChild(lastBtn);

			goBtn = new GImageBitmap();
			goBtn.bitmapData = GlobalClass.getBitmapData('Button');
			goBtn.scale9Grid = SkinClassNameDefine.BUTTONRECT;
			goBtn.x = 541;
			goBtn.y = 333;
			goBtn.width = 28;
			goBtn.height = 28;
			this.addChild(goBtn);

			GImageBitmap7 = new GImageBitmap();
			GImageBitmap7.bitmapData = GlobalClass.getBitmapData('Line');
			GImageBitmap7.scale9Grid = SkinClassNameDefine.LINERECT;
			GImageBitmap7.x = 152;
			GImageBitmap7.y = 134;
			GImageBitmap7.width = 439;
			GImageBitmap7.height = 2;
			this.addChild(GImageBitmap7);

			GImageBitmap8 = new GImageBitmap();
			GImageBitmap8.bitmapData = GlobalClass.getBitmapData('Line');
			GImageBitmap8.scale9Grid = SkinClassNameDefine.LINERECT;
			GImageBitmap8.x = 151;
			GImageBitmap8.y = 281;
			GImageBitmap8.width = 439;
			GImageBitmap8.height = 2;
			this.addChild(GImageBitmap8);

			GImageBitmap9 = new GImageBitmap();
			GImageBitmap9.bitmapData = GlobalClass.getBitmapData('Line');
			GImageBitmap9.scale9Grid = SkinClassNameDefine.LINERECT;
			GImageBitmap9.x = 8;
			GImageBitmap9.y = 91;
			GImageBitmap9.width = 140;
			GImageBitmap9.height = 2;
			this.addChild(GImageBitmap9);

			GImageBitmap10 = new GImageBitmap();
			GImageBitmap10.bitmapData = GlobalClass.getBitmapData('Line');
			GImageBitmap10.scale9Grid = SkinClassNameDefine.LINERECT;
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
			nextBtn.styleName = 'BlueButton';
			this.addChild(nextBtn);

			autoCheck = CompCreateFactory.createGCheckBox(15,102);
			autoCheck.label ="自动切换";
			autoCheck.styleName = "GCheckBox" ;
			autoCheck.width = 100;
			this.addChild(autoCheck);

			showAnswerCheck = CompCreateFactory.createGCheckBox(15,125);
			showAnswerCheck.label ="查看答案";
			showAnswerCheck.styleName = "GCheckBox" ;
			showAnswerCheck.width = 100;
			this.addChild(showAnswerCheck);

			notSureCheck = CompCreateFactory.createGCheckBox(173,285);
			notSureCheck.label ="标记为"不确定",可以复查";
			notSureCheck.styleName = "GCheckBox" ;
			notSureCheck.width = 240;
			this.addChild(notSureCheck);

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

			preBtn = CompCreateFactory.createGButton(154,335,78,26,'上一题');
			preBtn.styleName = 'RedButton';
			this.addChild(preBtn);

			nextBtn = CompCreateFactory.createGButton(221,335,78,26,'下一题');
			nextBtn.styleName = 'GButton';
			this.addChild(nextBtn);

		}
	}
}