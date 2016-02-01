package game.model.action
{
	import starling.display.Image;
	
	public class ActionPlane extends Action
	{
	
		private var _imgPlane:Image;
	
		private var _imgSmokeList:Vector.<Image> = new Vector.<Image>;
	
		private var _flag:Boolean;
	
		public function ActionPlane(ss:SpriteSheet)
		{
			_imgPlane = new Image(ss.getTexture("plane"));
			_imgSmokeList[0] = new Image(ss.getTexture("smoke_0"));
			_imgSmokeList[1] = new Image(ss.getTexture("smoke_1"));
		}
	
		override public function onStart():void
		{
//			_imgPlane.setPosition(Global.SCREEN_WIDTH, Global.SCREEN_HEIGHT / 2 - 40);
			_imgPlane.x = Global.SCREEN_WIDTH;
			_imgPlane.y = Global.SCREEN_HEIGHT / 2 - 40;
			setSmokePostion();
			LayerManager.effectLayer.addChild(_imgSmokeList[0]);
			LayerManager.effectLayer.addChild(_imgSmokeList[1]);
			LayerManager.effectLayer.addChild(_imgPlane);
		}
	
		override public function onComplete():void
		{
			LayerManager.effectLayer.removeChild(_imgPlane);
			LayerManager.effectLayer.removeChild(_imgSmokeList[0]);
			LayerManager.effectLayer.removeChild(_imgSmokeList[1]);
		}
	
		override public function onStep():Boolean
		{
//			_imgPlane.setPosition(_imgPlane.getX() - 35, _imgPlane.getY());
			_imgPlane.x = _imgPlane.x - 35;
//			_imgPlane.y = _imgPlane.getY();
			_flag = !_flag;
			setSmokePostion();
			if(_imgSmokeList[0].getX() <= -_imgSmokeList[0].getWidth())
				return true;
			return false;
		}
	
		override public function getReverseAction():Action
		{
			return null;
		}
	
		private function setSmokePostion():void
		{
			var x:int = _imgPlane.x;
			var y:int = _imgPlane.y;
			/*_imgSmokeList[0].setPosition(x + 130, y + 60);
			_imgSmokeList[0].setVisible(_flag);
			_imgSmokeList[1].setPosition(x + 130, y + 60);
			_imgSmokeList[1].setVisible(!_flag);*/
			
			_imgSmokeList[0].x = x + 130;
			_imgSmokeList[0].y = y + 60;
			_imgSmokeList[0].visible = _flag;
			_imgSmokeList[1].x = x + 130;
			_imgSmokeList[1].y = y + 60;
			_imgSmokeList[1].visible = !_flag;
			
		}
	
		override public function onDispose():void
		{
			_imgPlane = null;
			_imgSmokeList = null;
		}
	}
}