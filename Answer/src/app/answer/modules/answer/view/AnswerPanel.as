package app.answer.modules.answer.view
{
	import app.answer.common.staticdata.SkinClassNameDefine;
	import app.answer.modules.answer.view.components.GroupItem;
	
	import com.thinkido.framework.common.vo.StyleData;
	import com.thinkido.framework.utils.DrawUtil;
	
	import fl.controls.RadioButtonGroup;
	import fl.data.DataProvider;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
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
	import lm.mui.controls.GTileList;
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
		public var leftBorder:MovieClip;
		public var GImageBitmap2:MovieClip;
		public var GImageBitmap1:GImageBitmap;
		public var single:RadioButtonGroup;
		public var submitBtn:GButton ;
		
		public var tabBar:GTabBar ;
		public var radioCon:Sprite;
		public var checkCon:Sprite;
		
		public var timeBar:MovieClip ;
		public var answerBar:MovieClip ;
		public var timeBarTxt:GLabel;
		public var answerBarTxt:GLabel;
		
		public var leftCon:Sprite ;
		public var glist:GTileList ;
		
		/**
		 * 动画用的遮罩 
		 */		
		public var leftConMask:Sprite ;

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
			
			GImageBitmap2 = new GTabbedPanel_bgSkin();
			GImageBitmap2.x = 149;
			GImageBitmap2.y = 30;
			GImageBitmap2.width = 443;
			GImageBitmap2.height = 340;
			this.addChild(GImageBitmap2);

			leftBorder = new GTabbedPanel_bgSkin();
			leftBorder.x = 7;
			leftBorder.y = 30;
			leftBorder.width = 140;
			leftBorder.height = 367;
			this.addChild(leftBorder);

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
			GImageBitmap8.x = 152;
			GImageBitmap8.y = 281;
			GImageBitmap8.width = 439;
			GImageBitmap8.height = 2;
			this.addChild(GImageBitmap8);
			
			leftCon = new Sprite();
			this.addChild(leftCon);
			
			leftConMask = new Sprite();
			DrawUtil.drawRect(leftConMask,new Point(7,30),new Point(147,398),new StyleData(1,0,0,0,0.5));
			this.addChild(leftConMask);
			leftCon.mask = leftConMask ;

			format = new TextFormat(null,14, 0xffffff, false, null, null, null, null, 'left');
			timeTxt = CompCreateFactory.createGLabel(17,36,123,22,'倒计时：',format);
			leftCon.addChild(timeTxt);
			
			GImageBitmap9 = new GImageBitmap();
			GImageBitmap9.bitmapData = GlobalClass.getBitmapData('LineH');
			GImageBitmap9.scale9Grid = SkinClassNameDefine.LINEHRECT;
			GImageBitmap9.x = 8;
			GImageBitmap9.y = 91;
			GImageBitmap9.width = 138;
			GImageBitmap9.height = 2;
			leftCon.addChild(GImageBitmap9);
			
			GImageBitmap10 = new GImageBitmap();
			GImageBitmap10.bitmapData = GlobalClass.getBitmapData('LineH');
			GImageBitmap10.scale9Grid = SkinClassNameDefine.LINEHRECT;
			GImageBitmap10.x = 8;
			GImageBitmap10.y = 154;
			GImageBitmap10.width = 138;
			GImageBitmap10.height = 2;
			leftCon.addChild(GImageBitmap10);
			
			submitBtn = CompCreateFactory.createGButton(50,355,60,28,'提交');
			submitBtn.styleName = 'GButton';
			leftCon.addChild(submitBtn);
			
			autoCheck = CompCreateFactory.createGCheckBox(15,102);
			autoCheck.width = 120;
			autoCheck.label ="  自动切换";
			autoCheck.styleName = "GCheckBox" ;
			leftCon.addChild(autoCheck);
			autoCheck.validateNow();
			
			showAnswerCheck = CompCreateFactory.createGCheckBox(15,125);
			showAnswerCheck.width = 120;
			showAnswerCheck.label ="  查看答案";
			showAnswerCheck.styleName = "GCheckBox" ;
			leftCon.addChild(showAnswerCheck);

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
			preBtn.styleName = 'GButton';
			this.addChild(preBtn);

			nextBtn = CompCreateFactory.createGButton(250,335,74,28,'下一题');
			nextBtn.styleName = 'GButton';
			this.addChild(nextBtn);
			
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
			
			timeBar = new ProgressBarGreen();
			timeBar.x = 72 ;
			timeBar.y = 410 ;
			timeBar.width = 529;
			addChild(timeBar);
			timeBar.gotoAndStop(0);
			
			answerBar = new ProgressBarBlue();
			answerBar.x = 72 ;
			answerBar.y = 427 ;
			answerBar.width = 529;
			addChild(answerBar);
			answerBar.stop() ;
			
			format.size = 12 ;
			timeBarTxt = CompCreateFactory.createGLabel(9,404,123,22,'时间进度：',format);
			this.addChild(timeBarTxt);
			
			answerBarTxt = CompCreateFactory.createGLabel(9,422,123,22,'题目进度：',format);
			this.addChild(answerBarTxt);
			
			glist = new GTileList();
			glist.width = 138 ;
			glist.height = 366 ;
			leftCon.addChild(glist) ;
			glist.x = 150 ;
			glist.y = 30 ;
			glist.columnWidth = 30;
			glist.rowHeight = 30;
			glist.horizontalGap = 1;
			glist.verticalGap = 1;
			glist.horizontalScrollPolicy = "off";
			glist.verticalScrollPolicy = "on";
			glist.direction = GBoxDirection.VERTICAL ;
			glist.styleName = "GTileList" ;
			glist.setStyle("cellRenderer", GroupItem);
			
//			测试代码
//			this.addChild(glist);
//			leftCon.visible = false ;
//			glist.x = 8 ;
//			glist.dataProvider = new DataProvider([{name:"1n",id:"1"},{name:"2n",id:"2"},{name:"3n",id:"3"},{name:"4n",id:"4"}]);
		}
	}
}