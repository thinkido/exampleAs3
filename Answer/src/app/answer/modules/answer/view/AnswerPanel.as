package app.answer.modules.answer.view
{
	import app.answer.common.staticdata.SkinClassNameDefine;
	
	import fl.controls.RadioButtonGroup;
	
	import flash.display.Sprite;
	import flash.text.TextFormat;
	
	import lm.components.window.GWindow;
	import lm.mui.CompCreateFactory;
	import lm.mui.containers.globalVariable.GBoxDirection;
	import lm.mui.controls.GButton;
	import lm.mui.controls.GCheckBox;
	import lm.mui.controls.GImageBitmap;
	import lm.mui.controls.GLabel;
	import lm.mui.controls.GRadioButton;
	import lm.mui.controls.GTabBar;
	import lm.mui.controls.GTextInput;
	import lm.mui.core.GlobalClass;

	public class AnswerPanel extends GWindow
	{
		public var nextBtn:GButton;
		public var preBtn:GButton;
		public var eRadio:GRadioButton;
		public var dRadio:GRadioButton;
		public var cRadio:GRadioButton;
		public var bRadio:GRadioButton;
		public var aRadio:GRadioButton;
		
		public var aCheck:GCheckBox;
		public var bCheck:GCheckBox;
		public var cCheck:GCheckBox;
		public var dCheck:GCheckBox;
		public var eCheck:GCheckBox;
		
		public var nullRadio:GRadioButton;
		public var notSureCheck:GCheckBox;
		public var showAnswerCheck:GCheckBox;
		public var autoCheck:GCheckBox;
		public var goInput:GTextInput;
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
		public var single:RadioButtonGroup;
		public var submitBtn:GButton ;
		
		public var tabBar:GTabBar ;
		public var radioCon:Sprite;
		public var checkCon:Sprite;

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

			format = new TextFormat(null,14, 0xffffff, false, null, null, null, null, 'left');
			titleTxt = CompCreateFactory.createGLabel(164,37,408,89,'1、标题',format);
			this.addChild(titleTxt);

			format = new TextFormat(null,12, 0xff0000, false, null, null, null, null, 'right');
			tipTxt = CompCreateFactory.createGLabel(177,310,400,22,'你答错了，标准答案是A。为什么选A？',format);
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

			format = new TextFormat(null,14, 0xffffff, false, null, null, null, null, 'left');
			timeTxt = CompCreateFactory.createGLabel(17,36,123,22,'倒计时：',format);
			this.addChild(timeTxt);

			currTxt = CompCreateFactory.createGLabel(468,290,100,22,'当前：1/120',format);
			this.addChild(currTxt);

			GLabel5 = CompCreateFactory.createGLabel(452,335,72,22,'转到',format);
			this.addChild(GLabel5);

			GLabel6 = CompCreateFactory.createGLabel(522,335,17,22,'题',format);
			this.addChild(GLabel6);

			goInput = new GTextInput();
			goInput.x = 482;
			goInput.y = 335;
			goInput.width = 38;
			goInput.height = 20;
			goInput.restrict = "0-9" ;
			goInput.styleName = "GText" ;
			
			this.addChild(goInput);

			goBtn = CompCreateFactory.createGButton(541,332,28,28,'Go');
			goBtn.styleName = 'GButton';
			this.addChild(goBtn);

			autoCheck = CompCreateFactory.createGCheckBox(15,102);
			autoCheck.width = 120;
			autoCheck.label ="  自动切换";
			autoCheck.styleName = "GCheckBox" ;
			this.addChild(autoCheck);
			autoCheck.validateNow();

			showAnswerCheck = CompCreateFactory.createGCheckBox(15,125);
			showAnswerCheck.width = 120;
			showAnswerCheck.label ="  查看答案";
			showAnswerCheck.styleName = "GCheckBox" ;
			this.addChild(showAnswerCheck);

			notSureCheck = CompCreateFactory.createGCheckBox(173,285);
			notSureCheck.styleName = "GCheckBox" ;
			notSureCheck.label ='  标记为"不确定",可以复查';
			this.addChild(notSureCheck);
			notSureCheck.width = 300;
			notSureCheck.textField.width = 300 ;
			notSureCheck.validateNow();

			radioCon = new Sprite();
			checkCon = new Sprite();
			addChild(radioCon);
			addChild(checkCon);
			
			aRadio = new GRadioButton();
			aRadio.x = 173;
			aRadio.y = 149;
			aRadio.width = 410;
			aRadio.height = 22;
			radioCon.addChild(aRadio);

			bRadio = new GRadioButton();
			bRadio.x = 173;
			bRadio.y = 174;
			bRadio.width = 410;
			bRadio.height = 22;
			radioCon.addChild(bRadio);

			cRadio = new GRadioButton();
			cRadio.x = 173;
			cRadio.y = 199;
			cRadio.width = 410;
			cRadio.height = 22;
			radioCon.addChild(cRadio);

			dRadio = new GRadioButton();
			dRadio.x = 173;
			dRadio.y = 225;
			dRadio.width = 410;
			dRadio.height = 22;
			radioCon.addChild(dRadio);
			
			eRadio = new GRadioButton();
			eRadio.x = 173;
			eRadio.y = 250;
			eRadio.width = 410;
			eRadio.height = 22;
			radioCon.addChild(eRadio);
			
			nullRadio = new GRadioButton();
			nullRadio.x = 173;
			nullRadio.y = 245;
			nullRadio.width = 410;
			nullRadio.height = 22;
			
			single = new RadioButtonGroup("singleSelect");
			aRadio.group = single ;
			bRadio.group = single ;
			cRadio.group = single ;
			dRadio.group = single ;
			eRadio.group = single ;
			nullRadio.group = single ;

			preBtn = CompCreateFactory.createGButton(170,335,74,28,'上一题');
			preBtn.styleName = 'RedButton';
			this.addChild(preBtn);

			nextBtn = CompCreateFactory.createGButton(250,335,74,28,'下一题');
			nextBtn.styleName = 'RedButton';
			this.addChild(nextBtn);
			
			submitBtn = CompCreateFactory.createGButton(50,355,60,28,'提交');
			submitBtn.styleName = 'RedButton';
			this.addChild(submitBtn);
			
			aRadio.styleName = "GRadio";
			bRadio.styleName = "GRadio";
			cRadio.styleName = "GRadio";
			dRadio.styleName = "GRadio";
			eRadio.styleName = "GRadio";
			nullRadio.styleName = "GRadio";
			titleTxt.wordWrap = true ;
			
			var arr:Array = [{label:"全部",name:'all'},{label:"错误",name:'error'}] ;
//			var arr:Array = [{label:"全部",name:'all'}] ;
			tabBar = CompCreateFactory.createGTabBar( 160,369,65,27); 
			tabBar.buttonStyleName = "GTabBarButton" ;
			tabBar.direction = GBoxDirection.HORIZONTAL;
			tabBar.dataProvider = arr;
			this.addChild(tabBar);
			
			aCheck = new GCheckBox();
			aCheck.x = 173;
			aCheck.y = 149;
			aCheck.width = 410;
			aCheck.height = 22;
			aCheck.styleName = "GCheckBox" ;
			checkCon.addChild(aCheck);
			
			bCheck = new GCheckBox();
			bCheck.x = 173;
			bCheck.y = 174;
			bCheck.width = 410;
			bCheck.height = 22;
			bCheck.styleName = "GCheckBox" ;
			checkCon.addChild(bCheck);
			
			cCheck = new GCheckBox();
			cCheck.x = 173;
			cCheck.y = 199;
			cCheck.width = 410;
			cCheck.height = 22;
			cCheck.styleName = "GCheckBox" ;
			checkCon.addChild(cCheck);
			
			dCheck = new GCheckBox();
			dCheck.x = 173;
			dCheck.y = 225;
			dCheck.width = 410;
			dCheck.height = 22;
			dCheck.styleName = "GCheckBox" ;
			checkCon.addChild(dCheck);
			
			eCheck = new GCheckBox();
			eCheck.x = 173;
			eCheck.y = 250;
			eCheck.width = 410;
			eCheck.height = 22;
			eCheck.styleName = "GCheckBox" ;
			checkCon.addChild(eCheck);
			
			checkCon.visible = false ;
		}
	}
}