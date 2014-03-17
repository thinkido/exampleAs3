package lm.components.window
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	import lm.mui.CompCreateFactory;
	import lm.mui.controls.GButton;
	import lm.mui.controls.GImageBitmap;
	import lm.mui.controls.GTextFiled;
	import lm.mui.controls.GUIComponent;
	import lm.mui.manager.IDragDrop;
	
	[Event( name="window_close", type="lm.components.window.WindowEvent")]
	
	public class GWindow extends GUIComponent implements IDragDrop
	{
		private var _windowTitle:MovieClip;
		private var _windowBg:MovieClip;
		private var _closeBtn:GButton;
		private var _miniBtn:GButton;
		private var _contentSprite:Sprite;
		private var _title:GTextFiled;
		private var _titleImg:GImageBitmap;
		private var titleBitmap:Bitmap;
		public var GUIDE_NAME:String = "";  
		
		private const titie_height:int = 25;
		private static const Padding_right:Number = 2 ;
		
		public function GWindow(guidename:String="")
		{
			super();
			GUIDE_NAME = guidename;
			this.addEventListener(MouseEvent.MOUSE_DOWN,downHandler);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
//			_windowBg = ResouceConst.getScaleBitmap("GeneralWindowBG");
//			_windowBg.scale9Grid = new Rectangle(87, 36, 26, 46); 
			
			_windowTitle = new GTitleBar_bgSkin() ;
			super.addChild(this._windowTitle);
			_windowTitle.height = titie_height + 1 ;
			_windowBg = new GPanel_bgSkin() ;
			super.addChild(this._windowBg);
			_windowBg.y = titie_height ;
			_windowTitle.mouseEnabled = false;
			_windowBg.mouseEnabled = false;
			
//			titleBitmap = 
			this._title = new GTextFiled();
			this._title.selectable = false;
			this._title.autoSize ='left';
			_title.mouseEnabled = false ;
			var tf:TextFormat = new TextFormat(null,14,0xffffff) ;
			_title.defaultTextFormat = tf ;
			super.addChild(this._title);
			
			_titleImg = new GImageBitmap();
			super.addChild(this._titleImg);
			_titleImg.loadComFunc = updateSize;
			
			_contentSprite = new Sprite();
			super.addChild(_contentSprite);
			
			_closeBtn = new GButton();
			_closeBtn.styleName = 'CloseBtn';
			_closeBtn.label = '';
			_closeBtn.setSize(43,23);
			_closeBtn.addEventListener(MouseEvent.CLICK, closeHandler);
			super.addChild(_closeBtn);
			
			_miniBtn = CompCreateFactory.createGButton(0,0,22,8);
			_miniBtn.visible = false;
			_miniBtn.styleName = 'MinimizeButton';
			_miniBtn.addEventListener(MouseEvent.CLICK, minimizeHandler);
			super.addChild(_miniBtn);
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			return this._contentSprite.addChild(child);
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			return this._contentSprite.addChildAt(child,index);
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			return this._contentSprite.removeChild(child);
		}
		
		override public function removeChildAt(index:int):DisplayObject
		{
			return this._contentSprite.removeChildAt(index);
		}		
		
		override public function set width(arg0:Number):void
		{
			super.width = arg0;
			this._closeBtn.x = this.width - this._closeBtn.width - Padding_right;
			this._closeBtn.y = 2;
		}
		
		override protected function updateSize() : void
		{
			super.updateSize();
			
			this._closeBtn.x = this.width - this._closeBtn.width - Padding_right;
			this._closeBtn.y = 1;
			this._miniBtn.x = this.width - this._closeBtn.width - this._miniBtn.width - 40;
			this._miniBtn.y = 8;
			
			this._contentSprite.y = 0;
			
			this._title.x = (this.width - this._title.width) / 2;
			this._title.y = 4;
			_titleImg.x = (this.width - this._titleImg.width) / 2;
			_titleImg.y = 3;
			_windowTitle.width = this.width;
			_windowBg.width = this.width;

			_windowBg.height = this.height - titie_height ;
		}
		
		public function set isShowCloseBtn(bool:Boolean):void
		{
			this._closeBtn.visible = bool;
		}
		
		public function set isShowMiniBtn(bool:Boolean):void
		{
			this._miniBtn.visible = bool;
		}
		
		public function set title(text:String):void
		{
			this._title.text = text;
		}
		
		/***/
		public function set titleUrl($url:String):void
		{
			_titleImg.imgUrl = $url;
		}
		
		/*override protected function updateDisplayList() : void
		{
			super.updateDisplayList();
			if (this._titleChange)
			{
				this._titleChange = false;
				if (this._title)
				{
					this._title.y = 4;
					this._title.x = (this.width - this._title.width) / 2;
				}
			}
			return;
		}*/
		
		/*public function dispose() : void
		{
			this._closeBtn.removeEventListener(MouseEvent.CLICK, this.closeBtnClickHandler);
			this._closeBtn = null;
			return;
		}*/
		
		
		private function downHandler(event:MouseEvent):void
		{
			if(event.target == this)
			{
				this.startDrag();
				this.addEventListener(MouseEvent.MOUSE_UP, upHandler);
				this.addEventListener(MouseEvent.MOUSE_OUT,upHandler);
			}
			//提到顶层
			if(this.parent)
			{
				var num:int = this.parent.numChildren;
				this.parent.addChildAt(this,num - 1);
			}
		}
		
		private function upHandler(event:MouseEvent):void
		{
			this.stopDrag();
			this.removeEventListener(MouseEvent.MOUSE_UP, upHandler);
			this.removeEventListener(MouseEvent.MOUSE_OUT, upHandler);
		}
		
		private function closeHandler(event:MouseEvent):void
		{
			this.dispatchEvent(new WindowEvent(WindowEvent.CLOSE));
		}
		
		private function minimizeHandler(event:MouseEvent):void
		{
			this.dispatchEvent(new WindowEvent(WindowEvent.MINIMIZE));
		}
		
		public function get isDragAble() : Boolean
		{
			return false;
		}
		
		public function get isDropAble() : Boolean
		{
			return true;
		}
		
		public function get isThrowAble() : Boolean
		{
			return false;
		}
		
		public function get dragSource() : Object
		{
			return {};
		}
		
		public function set dragSource(param1:Object) : void
		{
			return;
		}
		
		public function canDrop(param1:IDragDrop, param2:IDragDrop) : Boolean
		{
			return true;
		}
		
		public function getCloseBtn():GButton
		{
			return _closeBtn;
		}
		
		
//		override public function set width(arg0:Number):void
//		{
//			_windowBg.width = arg0;
//			super.width = arg0;
//			super.scaleX = 1;
//			super.scaleY = 1;
//		}
//		
//		override public function set height(arg0:Number):void
//		{
//			_windowBg.height = arg0;
//			super.height = arg0;
//			super.scaleX = 1;
//			super.scaleY = 1;
//		}
	}
}