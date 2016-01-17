package ui
{
	import game.model.Global;
	
	public class UILayer extends UIContainer
	{
		
		/**
		 * 加载完成后处理
		 */
		public function initWithJsonObject(data:JSONObject):void
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
				setPosition(x, y);
				setVisible(!data.has("VisibleForFrame") || data.getBoolean("VisibleForFrame"));
				setName(data.getString("Name"));
				var conf:JSONObject = getJson(transformPath(data.getJSONObject("FileData").getString("Path")));
				super.initWithJsonObject(conf);
			}
			catch( e:Error)
			{
				e.printStackTrace();
			}
		}
	}
}