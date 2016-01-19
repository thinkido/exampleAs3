package ui
{	
	import game.model.Global;
	
	public class UIObject extends UIComponent
	{
		
		/**
		 * 邻居列表
		 */
		protected var _neighborArr:Vector.<UIObject> = new Vector.<UIObject>;
		
		/**
		 * 状态
		 */
		protected var _state:int = STATE_NORMAL;
		
		/**
		 * 设置邻居
		 * 
		 * @param up
		 * @param down
		 * @param left
		 * @param right
		 */
		public function setNeighbors(up:UIObject,  down:UIObject,  left:UIObject,  right:UIObject):void
		{
			_neighborArr[DIR_UP] = up;
			_neighborArr[DIR_DOWN] = down;
			_neighborArr[DIR_LEFT] = left;
			_neighborArr[DIR_RIGHT] = right;
		}
		
		/**
		 * 获取邻居
		 * 
		 * @param dir
		 * @return
		 */
		public function getNeighbor( dir:int):UIObject
		{
			return _neighborArr[dir];
		}
		
		/**
		 * 获取状态
		 * 
		 * @return
		 */
		public function getState():int
		{
			return _state;
		}
		
		/**
		 * 设置状态
		 * 
		 * @param state
		 */
		public function setState(state:int):void
		{
			_state = state;
		}
		
		public function autoSetPosition(data:JSONObject):void
		{
			try
			{
				var position:JSONObject = data.getJSONObject("Position");
				var size:JSONObject = data.getJSONObject("Size");
				
				var scale:JSONObject = data.getJSONObject("Scale");
				var x:int = int(position.getString("X"));
				var y:int = int(position.getString("Y"));
				var w:int = int(size.getString("X"));
				var h:int = int(size.getString("Y"));
				var scaleX:Number = Number(scale.getString("ScaleX"));
				var scaleY:Number = Number(scale.getString("ScaleY"));
				var anchorX:int = 0;
				var anchorY:int = (int)(h * scaleY);
				if(data.has("AnchorPoint"))
				{
					var anchor:JSONObject = data.getJSONObject("AnchorPoint");
					if(anchor.has("ScaleX"))
					{
						anchorX = int((anchor.getString("ScaleX")) * w * scaleX);
					}
					if(anchor.has("ScaleY"))
					{
						anchorY = (int)((1 - Number(anchor.getString("ScaleY"))) * h * scaleY);
					}
				}
				x = x - anchorX;
				y = Global.SCREEN_HEIGHT - y - anchorY;
//				setPosition(x, y);
//				setVisible(!data.has("VisibleForFrame") || data.getBoolean("VisibleForFrame"));
				this.x = x;
				this.y = y;
				this.visible = !data.has("VisibleForFrame") || data.getBoolean("VisibleForFrame");
			}
			catch( e:Error)
			{
				e.printStackTrace();
			}
		}
		
		override public function onDispose():void
		{
			_neighborArr = null;
			super.onDispose();
		}
	}
}