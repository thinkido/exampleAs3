package app.answer.modules.mainui.view
{
	import app.answer.PipeEvent;
	import app.answer.common.staticdata.SkinClassNameDefine;
	import app.answer.manager.FacadeManager;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	import lm.mui.CompCreateFactory;
	import lm.mui.controls.GImageBitmap;
	import lm.mui.controls.GLabel;
	import lm.mui.core.GlobalClass;

	public class LinkPanel extends Sprite
	{
		public var GImageBitmap2:MovieClip;
		private var format:TextFormat = new TextFormat();;
		public var eqTxt:GLabel;
		public var iqTxt:GLabel;
		public var lqTxt:GLabel;
		
		
		public function LinkPanel()
		{
			GImageBitmap2 = new GTabbedPanel_bgSkin();
			GImageBitmap2.x = -15;
			GImageBitmap2.y = 0;
			GImageBitmap2.width = 100;
			GImageBitmap2.height = 200;
			this.addChild(GImageBitmap2);
			
			format = new TextFormat(null,14, 0xffffff, false, null, true, null, null, 'left');
			eqTxt = CompCreateFactory.createGLabel(10,10,80,22,'情商测试',format);
			this.addChild(eqTxt);
			eqTxt.addEventListener(MouseEvent.CLICK,eqClick);
			
			format = new TextFormat(null,14, 0xcccccc, false, null, false, null, null, 'left');
			iqTxt = CompCreateFactory.createGLabel(10,40,80,22,'逆商测试',format);
			this.addChild(iqTxt);
			lqTxt = CompCreateFactory.createGLabel(10,70,80,22,'爱商测试',format);
			this.addChild(lqTxt);
			
			eqTxt.useHandCursor = true ;
			eqTxt.buttonMode = true ;
			iqTxt.useHandCursor = true ;
			iqTxt.buttonMode = true ;
			lqTxt.useHandCursor = true ;
			lqTxt.buttonMode = true ;

		}
		
		protected function eqClick(event:MouseEvent):void
		{
			FacadeManager.startupFacade(PipeEvent.STARTUP_Answer,PipeEvent.SHOW_Answer_PANEL);1
		}
	}
}