package app.answer.modules.answer.view
{
	import app.answer.common.vo.QuestionVo;
	import app.answer.manager.POPWindowManager;
	import app.answer.manager.QuestionResManager;
	import app.answer.manager.TopTipManager;
	import app.answer.modules.answer.Answer_ApplicationFacade;
	import app.answer.modules.answer.model.AnswerModel;
	import app.answer.modules.answer.model.Answer_MsgSendProxy;
	
	import com.thinkido.framework.common.timer.vo.TimerData;
	import com.thinkido.framework.manager.TimerManager;
	import com.thinkido.framework.utils.ArrayUtil;
	import com.thinkido.framework.utils.TFormatter;
	
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import lm.components.window.WindowEvent;
	import lm.mui.controls.GRadioButton;
	import lm.mui.events.MuiEvent;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;

	public class AnswerMediator extends Mediator
	{

		private var _msgSenderProxy:Answer_MsgSendProxy;
		public static const NAME:String = "Answer_AnswerMediator";

		public function AnswerMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
			initEvt();
			initUi();
		}
		
		private function initUi():void
		{
			panel.tipTxt.visible = false ;
			panel.autoCheck.selected = true ;
		}
		private var td:TimerData ;
		private function initEvt():void
		{
			panel.addEventListener(WindowEvent.CLOSE, closePanel);		
			panel.preBtn.addEventListener(MouseEvent.CLICK,preClick);
			panel.nextBtn.addEventListener(MouseEvent.CLICK,nextClick);
			panel.notSureCheck.addEventListener(MouseEvent.CLICK,notSureClick);
			panel.aRadio.addEventListener(MouseEvent.CLICK,radioClick);
			panel.bRadio.addEventListener(MouseEvent.CLICK,radioClick);
			panel.cRadio.addEventListener(MouseEvent.CLICK,radioClick);
			panel.dRadio.addEventListener(MouseEvent.CLICK,radioClick);
			panel.eRadio.addEventListener(MouseEvent.CLICK,radioClick);
			
			panel.aCheck.addEventListener(MouseEvent.CLICK,checkClick);
			panel.bCheck.addEventListener(MouseEvent.CLICK,checkClick);
			panel.cCheck.addEventListener(MouseEvent.CLICK,checkClick);
			panel.dCheck.addEventListener(MouseEvent.CLICK,checkClick);
			panel.eCheck.addEventListener(MouseEvent.CLICK,checkClick);
			
			panel.autoCheck.addEventListener(MouseEvent.CLICK,autoCheckClick);
			panel.showAnswerCheck.addEventListener(MouseEvent.CLICK,showAnswerClick);
			
			panel.goBtn.addEventListener(MouseEvent.CLICK,goClick);
			panel.goInput.addEventListener(Event.CHANGE ,goInputChange);
			panel.goInput.addEventListener(FocusEvent.FOCUS_IN,focusIn);
			panel.submitBtn.addEventListener(MouseEvent.CLICK,overTest) ;
			
			panel.tabBar.addEventListener(MuiEvent.GTABBAR_SELECTED_CHANGE, tabBarClick);
			
			panel.tabBar.dataProvider = model.tabArr ;
		}
		
		private function tabBarClick(evt:MuiEvent):void
		{
			var index:int = evt.selectedIndex;
			panel.tabBar.dataProvider[index].name ;
			TopTipManager.getInstance().addSystemMouseTip("功能暂未开发");
		}
		
		protected function focusIn(event:FocusEvent):void
		{
			panel.goInput.setSelection(0,panel.goInput.text.length) ;
		}
		
		private function goInputChange(evt:Event):void{
			if( panel.goInput.text.length == 0 ){
				return ;
			}
			var value:int = int(panel.goInput.text) ;
			var temp:int = Math.max(1,value) ;
			panel.goInput.text = Math.min(temp,model.total).toString() ;
			
		}
		
		/**
		 * 跳转题目 
		 * @param event
		 */		
		protected function goClick(event:MouseEvent):void
		{
			var ind:int = int(panel.goInput.text) ;
			if( ind <= model.total ){ //在题目库范围内，可以跳转
				setIndex(ind) ;
			}else{ //提示不能跳转
				
			}
		}
		
		protected function autoCheckClick(event:MouseEvent):void
		{
			model.autoJump = panel.autoCheck.selected ;
			changeJumpTime();
		}
		
		protected function showAnswerClick(event:MouseEvent):void
		{
			model.showAnswer = panel.showAnswerCheck.selected ;
			changeJumpTime();
			checkAndShow();
		}
		
		protected function checkClick(event:MouseEvent):void
		{
			model.currVo.selected = "" ;
			if( panel.aCheck.selected ){
				model.currVo.selected += "a";
			}
			if( panel.bCheck.selected ){
				model.currVo.selected += "b";
			}
			if( panel.cCheck.selected ){
				model.currVo.selected += "c";
			}
			if( panel.dCheck.selected ){
				model.currVo.selected += "d";
			}
			if( panel.eCheck.selected ){
				model.currVo.selected += "e";
			}
			setAnswerData( model.currVo ) ;
			changeAnsweredNum() ;
		}
		protected function radioClick(event:MouseEvent):void
		{
			var rad:GRadioButton = event.currentTarget as GRadioButton ;
//			if( panel.single.selection == rad ){
//				return ;
//			}
			if( rad == panel.aRadio ){
				model.currVo.selected = "a" ;
			}
			else if(rad == panel.bRadio ){
				model.currVo.selected = "b" ;
			}
			else if(rad == panel.cRadio ){
				model.currVo.selected = "c" ;
			}
			else if(rad == panel.dRadio ){
				model.currVo.selected = "d" ;
			}
			else if(rad == panel.eRadio ){
				model.currVo.selected = "e" ;
			}
			changeJumpTime();
			checkAndShow();
			if( model.autoJump ){
				if( jumpTd != null ){
					TimerManager.deleteTimer(jumpTd) ;
				}
				jumpTd = TimerManager.createTimer(model.jumpTime,1,autoJump);
			}
			setAnswerData( model.currVo ) ;
			changeAnsweredNum() ;
		}
		private var jumpTd:TimerData ;
		
//		检查改变当前答题进度
		private function changeAnsweredNum():void{
			if( model.currVo != null ) {   // 切换题的时候，判断该题是否已经作答，如果已经回答则 答题计数+1，否则-1
				if( model.currVo.selected.length == 0 ){
					var temp:int = model.answed.indexOf(model.currVo.id) ;
					if( temp != -1 ){
						model.answed.splice(temp,1);
					}
				}else{
					if( model.answed.indexOf(model.currVo.id) == -1 ){
						model.answed.push(model.currVo.id) ;
					}
				}
			}
			var frame:int = model.answed.length / model.total * 100 ;
			panel.answerBar.gotoAndStop(frame);
			
		}
		
		private function changeJumpTime():void
		{
			if( model.showAnswer ){
				model.jumpTime = model.jumpNeedTime + model.showAnswerNeedTime ;
			}else{
				model.jumpTime = model.jumpNeedTime ;
			}
		}

		/**
		 * 检查正确性，提示答案 
		 * 
		 */
		private function checkAndShow():void
		{
			if( model.showAnswer && model.currVo.selected.length != 0 ){
					var txt:String = "" ;
				if( !model.currVo.isRight() ){
					panel.tipTxt.text = '你答错了，标准答案是'+ model.currVo.getAnswer() +'。为什么选'+ model.currVo.getAnswer() +'？'  ;
				}else{
					panel.tipTxt.text = '你答对了！'  ;
				}
				panel.tipTxt.visible = true ;
			}
		}

		
		private function setAnswerData(currVo:QuestionVo):void
		{
			var temp:Boolean = model.currVo.isRight() ;
			if( temp && model.rightArr.indexOf( model.currVo.id ) == -1 ){
				model.rightArr.push( model.currVo.id );
			}else if( !temp && model.rightArr.indexOf( model.currVo.id ) != -1 ){
				ArrayUtil.removeObj(model.rightArr,model.currVo.id) ;
			}
			calcScore();
			if( model.currVo.notSure && model.signArr.indexOf( model.currVo.id ) == -1 ){
				model.signArr.push( model.currVo.id );
			}else{
				ArrayUtil.removeObj(model.signArr,model.currVo.id) ;
			}
		}
		/**
		 * 计算得分 
		 */		
		private function calcScore():void
		{
			model.score = 0 ;
			var db:Dictionary = QuestionResManager.getQuestion() ;
			for each (var vo:QuestionVo in db ) 
			{
				if( vo.type == QuestionVo.SELECT_SINGLE && vo.isRight() ){
					model.score += vo.getScore() ;
				}else{
					model.score += vo.getScore() ;
				}
			}
		}
		
		/**
		 * 自动跳转 
		 * 只通过点击答案后自动跳转;
		 */		
		private function autoJump():void
		{
			panel.nextBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
		
		protected function notSureClick(event:MouseEvent):void
		{
			model.currVo.notSure = panel.notSureCheck.selected ;
			
		}
		
		private var model:AnswerModel = AnswerModel.getInstance() ;
		
		protected function nextClick(event:MouseEvent):void
		{
			var vo:QuestionVo = QuestionResManager.getModuleVO(model.currIndex +1 );
			if( vo == null ){
				
				return ;
			}
			setIndex(model.currIndex + 1) ;
		}
		
		protected function preClick(event:MouseEvent):void
		{
			var vo:QuestionVo = QuestionResManager.getModuleVO(model.currIndex - 1 );
			if( vo == null ){
				
				return ;
			}
			setIndex(model.currIndex -1 ) ;
		}
		
		
		private function timerCount():void
		{
			model.showTimeCount -- ;
			panel.timeTxt.text = "当前时间: " + TFormatter.formatFromSecond( model.showTimeCount ) ;
			var frame:int =  ( model.showTime - model.showTimeCount) / model.showTime *100 ;
			panel.timeBar.gotoAndStop(frame);
			if( model.showTimeCount <=0 ){
				TimerManager.deleteTimer(td) ;
				td = null ;
				overTest();
			}
			trace(panel.timeBar.width,panel.answerBar.width);
		}
		
		private function start():void{
			if(td != null){
				TimerManager.deleteTimer(td);
				td = null ;
			}
			model.showTimeCount = model.showTime ;
			td = TimerManager.createTimer(1000,int.MAX_VALUE,timerCount);
			model.total =  QuestionResManager.getLength() ;
			setIndex(model.currIndex) ;
		}

		private function setIndex(value:int):void{
			model.currIndex = value ;
			var vo:QuestionVo = QuestionResManager.getModuleVO(value);
			setData(vo) ;
		}
		private function setData(vo:QuestionVo):void{
			if( vo == null ){
				return ;
			}
			
			panel.currTxt.text = '当前：'+ model.currIndex + "/" + model.total ;
			panel.tipTxt.visible = false ;
			model.currVo = vo ;
			panel.notSureCheck.selected = vo.notSure ;
			
			panel.titleTxt.text = vo.id + "、"+ vo.title ;
			
			if( model.currVo.type == QuestionVo.SELECT_SINGLE  ){
				panel.checkCon.visible = false ;
				panel.radioCon.visible = true ;
				panel.aRadio.label = "A." + vo.a ;
				panel.bRadio.label = "B." + vo.b ;
				panel.cRadio.label = "C." + vo.c ;
				panel.dRadio.label = "D." + vo.d ;
				panel.eRadio.label = "E." + vo.e ;
				
				panel.aRadio.visible = vo.a == ""? false:true ;
				panel.bRadio.visible = vo.b == ""? false:true ;
				panel.cRadio.visible = vo.c == ""? false:true ;
				panel.dRadio.visible = vo.d == ""? false:true ;
				panel.eRadio.visible = vo.e == ""? false:true ;
				
				if( vo.selected.length > 0 ){
					panel.single.selection = panel[vo.selected + "Radio"] ;
				}else{
					panel.single.selection = panel.nullRadio ;
				}
			}
			else if( model.currVo.type == QuestionVo.SELECT_MIUTIPLE  ){
				panel.checkCon.visible = true ;
				panel.radioCon.visible = false ;
				panel.aCheck.label = "A." + vo.a ;
				panel.bCheck.label = "B." + vo.b ;
				panel.cCheck.label = "C." + vo.c ;
				panel.dCheck.label = "D." + vo.d ;
				panel.eCheck.label = "E." + vo.e ;
				
				panel.aCheck.visible = vo.a == ""? false:true ;
				panel.bCheck.visible = vo.b == ""? false:true ;
				panel.cCheck.visible = vo.c == ""? false:true ;
				panel.dCheck.visible = vo.d == ""? false:true ;
				panel.eCheck.visible = vo.e == ""? false:true ;
				
				panel.aCheck.selected = vo.selected.indexOf("a") != -1 ? true : false ;
				panel.bCheck.selected = vo.selected.indexOf("b") != -1 ? true :false ;
				panel.cCheck.selected = vo.selected.indexOf("c") != -1 ? true :false ;
				panel.dCheck.selected = vo.selected.indexOf("d") != -1 ? true :false ;
				panel.eCheck.selected = vo.selected.indexOf("e") != -1 ? true :false ;
				
			}
			
			checkAndShow();
		}
		
//		考试结束
		private function overTest(evt:* = null):void
		{
//			计算得分
//			本地保存数据
//			错误、标记题目划分 tab
			facade.sendNotification(Answer_ApplicationFacade.SHOW_SCORE_PANEL,null );
			dispose();
		}
		
		private function dispose():void
		{
			model.answed = [] ;
			panel.answerBar.gotoAndStop(0);
			panel.timeBar.gotoAndStop(0);
		}
		private function closePanel(event:WindowEvent = null):void
		{
			POPWindowManager.showModule(Answer_ApplicationFacade.NAME, Answer_ApplicationFacade.SHOW_Answer_PANEL);
		}
		
		protected function get panel() : AnswerPanel
		{
			return viewComponent as AnswerPanel;
		}

		override public function onRegister() : void
		{
			return;
		}

		override public function listNotificationInterests() : Array
		{
			return [Answer_ApplicationFacade.SHOW_Answer_PANEL];
		}

		override public function handleNotification($noti:INotification) : void
		{
			switch($noti.getName())
			{
				case Answer_ApplicationFacade.SHOW_Answer_PANEL:
					showPanel();
					break ;
				default:
				{
					break;
				}
			}
			return;
		}
		
		private function showPanel():void
		{
			POPWindowManager.centerWindow(panel, null, Answer_ApplicationFacade.NAME);
			start() ;
			
		}
		
		private function get msgSenderProxy() : Answer_MsgSendProxy
		{
			if (this._msgSenderProxy == null)
			{
				this._msgSenderProxy = facade.retrieveProxy(Answer_MsgSendProxy.NAME) as Answer_MsgSendProxy;
			}
			return this._msgSenderProxy;
		}
	}
}