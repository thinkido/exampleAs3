package ui
{
	
	import game.util.CommonUtil;
	
	public class UIScene extends UICurrentView
	{
		
		public function UIScene()
		{
			
		}
		
		override public function onGoBack():void
		{
			CommonUtil.showPopupWindow(true, "确定退出游戏?",new CallBack);
		}


		
		override public function initWithJsonObject( data:Object):void
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
			catch( e:Error)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
		}

	}
}
import flash.system.System;

import game.model.callback.ICallbackB;

class CallBack implements ICallbackB
{
	public function run( data:Boolean):void
	{
		if(data)
			System.exit(0);
	}
}