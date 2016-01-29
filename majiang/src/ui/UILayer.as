package ui
{
	import game.model.Global;
	
	public class UILayer extends UIContainer
	{
		
		/**
		 * 加载完成后处理
		 */
		override public function initWithJsonObject(data:Object):void
		{
			try
			{
				var position:Object = data["Position"];
				var size:Object = data["Size"];
				
				var scale:Object = data["Scale"];
				var x:int = int(position["X"]);
				var y:int = int(position["Y"]);
				var w:int = int(size["X"]);
				var h:int = int(size["Y"]);
				var scaleX:Number = Number(scale["ScaleX"]);
				var scaleY:Number = Number(scale["ScaleY"]);
				var anchorX:int = 0;
				var anchorY:int = (int)(h * scaleY);
				if(data.has("AnchorPoint"))
				{
					var anchor:Object = data["AnchorPoint"];
					if(anchor.has("ScaleX"))
					{
						anchorX = int((anchor["ScaleX"]) * w * scaleX);
					}
					if(anchor.has("ScaleY"))
					{
						anchorY = (int)((1 - Number(anchor["ScaleY"])) * h * scaleY);
					}
				}
				x = x - anchorX;
				y = Global.SCREEN_HEIGHT - y - anchorY;
				/*setPosition(x, y);
				setVisible(!data.has("VisibleForFrame") || data.getBoolean("VisibleForFrame"));
				setName(data["Name"]);*/
				this.x = x;
				this.y = y;
				this.visible = !data.has("VisibleForFrame") || data["VisibleForFrame"];
				this.name = data['Name'];
				var conf:Object = getJson(transformPath(data["FileData"]["Path"]));
				super.initWithJsonObject(conf);
			}
			catch( e:Error)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
		}
	}
}