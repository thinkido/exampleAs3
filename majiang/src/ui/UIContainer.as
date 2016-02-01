package ui
{
	public class UIContainer extends UIComponent
	{
	
		/**
		 * 加载完成后处理
		 */
		override public function initWithJsonObject(data:Object):void
		{
			try
			{
				data = data["Content"]["Content"]["ObjectData"];
				var children:Array = data["Children"];
				for(var i:int = 0; i < children.length; ++i)
				{
					var child:Object = children[i];
					var item:UIComponent = decodeType(child["ctype"]);
					if(item != null)
					{
						item.initWithJsonObject(child);
						addChild(item);
					}
				}
			}
			catch(e:*)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
		}
	
		override public function releaseRes():void
		{
			super.releaseRes();
			var len:int = numChildren();
			for(var i:int = 0; i < len; i++)
			{
//				try
				{
					(getChildAt(i) as UIComponent).releaseRes();
				}
//				catch(e:*)
				{
				}
			}
		}
	
		 override public function onDispose():void
		{
			var len:int = numChildren();
			for(var i:int = 0; i < len; i++)
			{
				try
				{
					(getChildAt(i)as UIContainer).onDispose();
				}
				catch( e:Error)
				{
				}
			}
			removeAllChildren();
			super.onDispose();
		}
	}
}