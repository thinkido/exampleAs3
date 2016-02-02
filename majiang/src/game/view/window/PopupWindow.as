package game.view.window
{
	
	import com.thinkido.framework.manager.keyBoard.KeyBoardManager;
	import com.thinkido.framework.manager.keyBoard.KeyCode;
	import com.thinkido.framework.manager.keyBoard.KeyEvent;
	
	import game.control.WindowManager;
	import game.model.Global;
	import game.model.vo.PopupVO;
	
	import starling.display.Button;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	import ui.UIImageView;
	import ui.UIObject;
	import ui.UIWindow;
	
	public class PopupWindow extends UIWindow
	{
		private static var LINE_LENGTH:int = 20;
		
		protected var _callback:Function;
		
		protected var _btnOK:Button;
		
		protected var _btnCancel:Button;
		
		protected var _tfContent:TextField;;
		
		protected var _imgContent:UIImageView;
		
		protected var _originBtnOkX:int;
		
		protected var _originBtnOkY:int;
		
		protected var _midBtnOkX:int;
		
		public function PopupWindow() {
			
		}
		
		override public function updateData(args:Object):void 
		{
			var vo:PopupVO =  args as PopupVO;
			if ( vo.content is String){
				update(vo.isConfirm, vo.content as String, vo.callback);
			}else{
				update_2(vo.isConfirm, vo.content as Texture, vo.callback);
			}
		}
		
		private function baseUpdate( isConfirm:Boolean, callback:Function):void 
		{
			_callback = callback;
			if (isConfirm) {
				_btnOK.x = _originBtnOkX;
				_btnOK.y = _originBtnOkY;
				_btnOK.visible = true;
				_btnCancel.visible = true;
				switchFocus(_btnOK);
			} else {
				/*_btnOK.setPosition(_midBtnOkX, _originBtnOkY);
				_btnOK.setVisible(true);
				_btnCancel.setVisible(false);*/
				
				_btnOK.x = _midBtnOkX;
				_btnOK.y = _originBtnOkY;
				_btnOK.visible = true;
				_btnCancel.visible = false;
				switchFocus(_btnOK);
			}
		}
		
		private function update( isConfirm:Boolean,  text:String,  callback:Function):void
		{
			baseUpdate(isConfirm, callback);
			_imgContent.clearTexture();
			var showTxt:String = "";
			while (text.length > LINE_LENGTH) {
				showTxt += text.substring(0, LINE_LENGTH) + "\n";
				text = text.substring(LINE_LENGTH);
			}
			showTxt += text;
			_tfContent.setText(showTxt);
		}
		
		private function update_2( isConfirm:Boolean, texture:Texture,  callback:Function):void
		{
			baseUpdate(isConfirm, callback);
			_tfContent.setText("");
			_imgContent.setTexture(texture);
		}
		
		override public function initUI():void
		{
			_btnOK =  getChildByName("btn_ok") as Button;
			_btnCancel = getChildByName("btn_cancel") as Button;
			_tfContent =  getChildByName("tf_content") as TextField;
			_tfContent.setAnchor(ANCHOR_CENTER);
			_imgContent =  getChildByName("img_content") as UIImageView;
			_imgContent.setAnchor(ANCHOR_CENTER);
			_originBtnOkX = _btnOK.x;
			_originBtnOkY = _btnOK.y;
			_midBtnOkX = Global.SCREEN_WIDTH / 2 - 43;
			_btnOK.setNeighbors(null, null, _btnCancel, _btnCancel);
			_btnCancel.setNeighbors(null, null, _btnOK, _btnOK);
			KeyBoardManager.instance.addEventListener(KeyEvent.KEY_DOWN, this.onKeyDownHandler);
			KeyBoardManager.instance.addEventListener(KeyEvent.KEY_UP, this.onKeyUpHandler);
		}
		
		override public function onConfirm(target:UIObject):void {
			if (_callback != null)
				_callback.run(target == _btnOK);
			WindowManager.getInstance().closeWindow(this);
		}
		
		private function onKeyUpHandler(event:KeyEvent):void
		{
			if(event.keyEvent.target is TextField )
			{				
				return;
			}			
			var keycode:int = event.keyEvent.keyCode;
			switch(keycode)
			{
				case KeyCode.Num1:
					
					break;
			}
		}
		
		private function onKeyDownHandler(event:KeyEvent):void
		{
			var keyCode:int = event.keyEvent.keyCode;
			
			if (_btnCancel.visible) {
//				super.onKeyPressed(type, dispatcher, data);
			} else {
				onConfirm(_btnOK);
				event.stopImmediatePropagation() ;
			}
		}
		
		override public function onEnter():void {
			
		}
		
		override public function onLeave():void {
			
		}
		
		override public function onDispose():void {
			_callback = null;
			_btnOK = null;
			_btnCancel = null;
			_tfContent = null;
			_imgContent = null;
			super.onDispose();
		}
		
		override public function onGoBack():void {
			WindowManager.getInstance().closeWindow(this);
		}
		
		override public function releaseRes():void {
			// ���ͷ���Դ
		}
	}
}
