package lm.components.window
{
	import com.thinkido.framework.common.observer.Notification;
	import com.thinkido.framework.events.DataEvent;
	
	import fl.controls.SelectableList;
	import fl.events.ListEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import game.PipeEvent;
	import game.manager.GuideAssistantManager;
	import game.manager.POPWindowManager;
	import game.manager.PipeManager;
	import game.manager.layer.LayerManager;
	import game.modules.taskTrack.view.components.TextContent;
	import game.utils.DisplayUtil;
	
	import lm.components.guide.GuideCondition;
	import lm.components.guide.GuideInfo;
	import lm.components.guide.GuideVO;
	import lm.components.guide.IGuide;
	import lm.mui.controls.GTabBar;
	import lm.mui.events.MuiEvent;
	
	/**
	 * 
	 * @author wangjianglin
	 * 
	 */	
	public class CustomWindow extends Sprite implements IGuide
	{
		private var disX:Number;
		private var disY:Number;
		public var GUIDE_NAME:String = "";  
		
		public function CustomWindow()
		{
			super();
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		protected function registerGuide():void
		{
			if (GUIDE_NAME != "")
			{
				GuideAssistantManager.registerPanel(GUIDE_NAME, this);
			}
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			if (this.parent == null)
				 return;
			if (event.target == this)
			{
				this.startDrag();
				this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
				this.stage.addEventListener(MouseEvent.ROLL_OUT,onMouseUp);
				this.stage.addEventListener(MouseEvent.MOUSE_OUT,onMouseUp);
				if( this.parent.getChildIndex(this) != this.parent.numChildren -1 ){
					parent.setChildIndex(this,this.parent.numChildren -1);
				}
			}
		}

		private function onMouseMove(event:MouseEvent):void
		{
			var bitmap:BitmapData = new BitmapData(this.width,this.height, false,0x000000);
			bitmap.draw(this);
			var bit:Bitmap = new Bitmap(bitmap);
			LayerManager.effectLayer.addChild(bit);
			bit.x = this.x;
			bit.y = this.y;
			bit.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event:Event):void
		{
			var tar:Bitmap = event.currentTarget as Bitmap;
			if (tar.alpha <= 0.0)
			{
				tar.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				LayerManager.effectLayer.removeChild(tar);
				tar.bitmapData.dispose();
				return;
			}
			tar.alpha = tar.alpha - 0.1;
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			if (this.stage  == null)
				 return;
			if (event.type == MouseEvent.MOUSE_OUT)
			{
				if (this.stage.mouseX >= 0 && this.stage.mouseY >= 0 && this.stage.mouseX<=this.stage.stageWidth && this.stage.mouseY <= this.stage.stageHeight)
					return;
			}
			
			this.stopDrag();
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.stage.removeEventListener(MouseEvent.ROLL_OUT,onMouseUp);
		}
		
		
		/**
		 * 新手引导调用
		 * @param vo
		 * 
		 */		
		public function guideToDo(vo:GuideVO):void
		{
			var guideContanier:DisplayObjectContainer;
			var guideData:GuideInfo = new GuideInfo();
			guideData.gid = vo.id;
			guideData.dir = vo.dir;
			//取箭头父容器
			guideContanier = this;
			guideContanier = guideData.container = DisplayUtil.getObjectByExpress(guideContanier, vo.container) as DisplayObjectContainer;
			//取坐标参照物
			var posComponent:DisplayObject;
			posComponent = this;
			posComponent = DisplayUtil.getObjectByExpress(this, vo.posReferComponent);
			var p:Point = new Point(0,0);
			if (vo.posReferComponent.length > 0){
				p.x = posComponent.x;
				p.y = posComponent.y;
			}
			p = GuideAssistantManager.getArrowPosition(p, guideData.dir);
			if (vo.offsetX != 0)
				p.x = posComponent.x + vo.offsetX;
			if (vo.offsetY != 0)
				p.y = posComponent.y + vo.offsetY;
			if (guideContanier == this)
			{
				p.y = p.y - 30;
			}
			guideData.x = p.x;
			guideData.y = p.y;
			
			var closeHandle:Function;
			var appproxy:EventDispatcher = this;
			if (vo.endTpye == 0)
			{
				GuideAssistantManager.completeAssistant(vo.id);
			}
			if (vo.endCondition.length > 0)
			{
				var con:GuideCondition = vo.endCondition[0];
				if (con.type == 1)
				{
					var endHandler:Function = function(e:Notification):void
					{
						PipeManager.removeMsg(con.data, this);
						if (vo.endTpye == 0)
							GuideAssistantManager.guideEnd(vo.id);
						else
							GuideAssistantManager.completeAssistant(vo.id);
					};
					PipeManager.registerMsg(con.data, endHandler, this);
				}
			}else{
				if (posComponent is SelectableList)
				{
					closeHandle = function(e:ListEvent):void
					{
						posComponent.removeEventListener(ListEvent.ITEM_CLICK, closeHandle);
						if (vo.endTpye == 0)
							GuideAssistantManager.guideEnd(vo.id);
						else
							GuideAssistantManager.completeAssistant(vo.id);
					};
					posComponent.addEventListener(ListEvent.ITEM_CLICK, closeHandle);
				}else if (posComponent is GTabBar)
				{
					closeHandle = function(e:MuiEvent):void
					{
						var containTabbar:Array = vo.posReferComponent.split(".");
						var tabbarParam:Array =  containTabbar[containTabbar.length-1].split("-");
						var index:int = tabbarParam.length > 1 ? -1 : tabbarParam[1];
						if (index >= 0 && e.selectedIndex != index)
							return;
						posComponent.removeEventListener(MuiEvent.GTABBAR_SELECTED_CHANGE, closeHandle);
						if (vo.endTpye == 0)
							GuideAssistantManager.guideEnd(vo.id);
						else
							GuideAssistantManager.completeAssistant(vo.id);
					};
					posComponent.addEventListener(MuiEvent.GTABBAR_SELECTED_CHANGE, closeHandle);
				}else if (posComponent is TextContent)
				{
					closeHandle = function(e:DataEvent):void
					{
						posComponent.removeEventListener(TextContent.TASK_TRANSPORT, closeHandle);
						if (vo.endTpye == 0)
							GuideAssistantManager.guideEnd(vo.id);
						else
							GuideAssistantManager.completeAssistant(vo.id);
					};
					posComponent.addEventListener(TextContent.TASK_TRANSPORT, closeHandle);
				}else
				{
					closeHandle = function(e:MouseEvent):void
					{
						posComponent.removeEventListener(MouseEvent.CLICK, closeHandle);
						if (vo.endTpye == 0)
							GuideAssistantManager.guideEnd(vo.id);
						else
							GuideAssistantManager.completeAssistant(vo.id);
					};
					posComponent.addEventListener(MouseEvent.CLICK, closeHandle);
				}
			}
			POPWindowManager.showModule(PipeEvent.STARTUP_ASSISTANT, PipeEvent.SHOW_ASSISTANT_MAINUI, guideData);
		}
	}
}