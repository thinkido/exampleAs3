package game.view.inline
{
	import framework.resources.Res;
	
	import managers.LayerManager;
	import managers.ResManager;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;

	/**
	 *跑马灯
	 * 
	 * @author Jing
	 */
	public class NoticeBoard extends Sprite {
	
		static private var _nb:NoticeBoard = new NoticeBoard();
	
		static public function show(content:String):void {
			_nb.add(content);
//			_nb.setPosition(0, 50);
			_nb.x = 0 ;
			_nb.y = 50 ;		}
	
		private var _bg:Image;
	
		private var _tf:TextField;
	
		private var contents:Array = [];
	
		private var _playing:Boolean = false;
	
		public function NoticeBoard() 
		{
			var filename:String = "notice_board_bg_png";
			_bg = new Image( ResManager.getFile(filename , Res.TYPE_TEXTURE ) );
			ResManager.release(filename);
			this.addChild(_bg);
			_tf = new TextField(100,22,'');
			_tf.bold = true;
			_tf.color = 0xFFFFFF;
			_tf.fontSize = 16;
//			_tf.setSize(Font.SIZE_LARGE);
			this.addChild(_tf);
	
		}
	
		public function add(content:String):void
		{
			contents.addElement(content);
			if (false == _playing) {
				next();
			}
	
		}
	
		/**
		 * 游戏进入新一帧֡
		 */
		protected function enterFrame(time:Number):void
		{
			if (this.parent != null) {
//				super.enterFrame(time);
//				_tf.setPosition(_tf.getX() - 2, _tf.getY());
				_tf.x -= - 2;
				if (_tf.x < -320) {
					_playing = false;
					next();
				}
			}
		}
	
		private function next():void
		{
			if (contents.length > 0) {
				_playing = true;
				var content:String = contents[0] as String;
				contents.shift();
				_tf.text = content;
//				_tf.setPosition(640, 5);
				_tf.x = 640;
				_tf.y = 5;
				LayerManager.msgTipLayer.addChild(_nb);  // Stage.current.getRoot().addChild(_nb);
				
			} else {
				if (this.parent != null) {
//					((Sprite) this.getParent()).removeChild(this);
					this.parent.removeChild(this);
				}
			}
		}
	}
}